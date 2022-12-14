// Use this file to create a Javascript web worker to convert data from a
// vtk file to data for csv and gpx files using the conversionWorker function.
//
// This allows the conversion to happen on a separate thread from the UI
// and prevents the UI from freezing.
//
// Here are the steps to make a Javascript web worker out of this file:
//
// 1. Uncomment the main function.
//
// 2. Compile the file to Javascript using: 
//    $ dart compile js converter.dart -o converter.js
//
// 3. Manually edit the compiler generated file converter.js:
//      a. Delete this line at the top of the file:
//
//            (function dartProgram() {
//
//         and the line at the bottom of the file with 
//         the corresponding closing brace:
//
//           })();
//
//      b. Add this wrapper function at the top of converter.js
//        
//          function conversionWorker(vtkBytesAsString) {
//            return A.conversionWorker(vtkBytesAsString);
//          }    
//
// 4. Move converter.js to the web folder.

@JS()
library callable_function;

import 'dart:math';
import 'dart:convert';
import 'dart:typed_data';
import 'protobuf/vtk.pb.dart';
import 'package:vector_math/vector_math.dart';
import 'package:xml/xml.dart';
import 'package:js/js.dart';

/*
main(){
  allowInterop(conversionWorker);
}
*/

@JS('conversionWorker')
String conversionWorker(String vtkBytesAsString) {
  Uint8List vtkBytes = Uint8List.fromList(vtkBytesAsString.codeUnits);
  List<Record> records = readVtk(vtkBytes);
  List<DartTrackpoint> dartTrackpoints = vtkRecordsToDartTrackpoints(records);
  Uint8List csvBytes = generateCsvBytes(dartTrackpoints);
  Uint8List gpxBytes = generateGpxBytes(dartTrackpoints);
  String csvAndGpxAsJsonString =
      generateCsvAndGpxAsJsonString(csvBytes, gpxBytes);
  return csvAndGpxAsJsonString;
}

List<Record> readVtk(Uint8List vtkBytes) {
  //final Uint8List vtkBytes = inputFile.readAsBytesSync();
  print('Reading VTK...');
  int i = 0;
  int packetLength = 0;
  List<Record> records = [];
  while (i < vtkBytes.length) {
    // Combine two length bytes to get length as an unsigned 16 bit integer.
    packetLength = vtkBytes[i] + (vtkBytes[i + 1] << 8);
    i += 2;
    var data = vtkBytes.sublist(i, i + packetLength);
    Record r = Record.fromBuffer(data);
    records.add(r);
    // print('packetLength = $packetLength');
    i += packetLength;
  }
  return records;
}

class DartTrackpoint {
  DateTime time = DateTime.utc(1982, 2, 13);
  double latitude = 0;
  double longitude = 0;
  double sog = 0;
  int cog = 0;
  double q1 = 0;
  double q2 = 0;
  double q3 = 0;
  double q4 = 0;
  List<double> quaternion = List.filled(4, 0); //what do?
  List<double> eulerAngles = List.filled(3, 0); //what do?
  int magHeading = 0;
  int heel = 0;
  int pitch = 0;

  DartTrackpoint(Trackpoint trackpoint) {
    time = DateTime.fromMillisecondsSinceEpoch(
        1000 * trackpoint.seconds + 10 * trackpoint.centiseconds,
        isUtc: true);
    latitude = trackpoint.latitudeE7 / 1e7;
    longitude = trackpoint.longitudeE7 / 1e7;
    sog = trackpoint.sogKnotsE1 / 1e1;
    cog = trackpoint.cog;
    quaternion[0] = trackpoint.q1E3 / 1e3;
    quaternion[1] = trackpoint.q2E3 / 1e3;
    quaternion[2] = trackpoint.q3E3 / 1e3;
    quaternion[3] = trackpoint.q4E3 / 1e3;
    eulerAngles = eulerFromQuaternion(quaternion);
    magHeading = (-degrees(eulerAngles[2]) % 360).round();
    heel = (degrees(eulerAngles[0])).round();
    pitch = (-degrees(eulerAngles[1])).round();
  }

  @override
  String toString() {
    return '{time: $time, sog: $sog}';
  }
}

List<DartTrackpoint> vtkRecordsToDartTrackpoints(List<Record> records) {
  List<DartTrackpoint> dartTrackpoints = [];
  for (int i = 0; i < records.length; i++) {
    if (records[i].hasTrackpoint()) {
      dartTrackpoints.add(DartTrackpoint(records[i].trackpoint));
    }
  }
  return dartTrackpoints;
}

List<double> eulerFromQuaternion(List<double> quaternion) {
  Matrix3 rotationMatrix = matrixFromQuaternion(quaternion);
  //print('rot mat = ${rotationMatrix}');
  List<double> eulerAngles = eulerFromMatrix(rotationMatrix);
  return eulerAngles;
}

List<double> eulerFromMatrix(Matrix3 matrix) {
  int i = 0;
  int j = 1;
  int k = 2;

  // var matrix = Matrix3(-0.11224688, -0.52760613, -0.84204062,
  //                      0.92548014, -0.36403171, 0.10472548,
  //                      -0.84204062, 0.10472548, 0.52915042);

  double cy = sqrt(matrix.entry(i, i) * matrix.entry(i, i) +
      matrix.entry(j, i) * matrix.entry(j, i));
  double epsilon = 1.97626258336E-322;
  double ax = 0;
  double ay = 0;
  double az = 0;

  if (cy > epsilon) {
    ax = atan2(matrix.entry(k, j), matrix.entry(k, k));
    ay = atan2(-matrix.entry(k, i), cy);
    az = atan2(matrix.entry(j, i), matrix.entry(i, i));
  } else {
    ax = atan2(-matrix.entry(j, k), matrix.entry(j, j));
    ay = atan2(-matrix.entry(k, i), cy);
    az = 0.0;
  }
  List<double> eulerAngles = List.filled(3, 0);
  eulerAngles[0] = ax;
  eulerAngles[1] = ay;
  eulerAngles[2] = az;

  return eulerAngles;
}

Matrix3 matrixFromQuaternion(List<double> q) {
  double n = 0;
  const int elementsInQuaternion = 4;

  for (int i = 0; i < elementsInQuaternion; i++) {
    n += q[i] * q[i];
  }
  double epsilon = 1.97626258336E-322;
  if (n < epsilon) {
    return Matrix3.identity();
  }

  List<double> qScaled =
      List.filled(4, 0); //elementsInQuaternion as List<double>;

  for (int i = 0; i < elementsInQuaternion; i++) {
    qScaled[i] = sqrt(2.0 / n) * q[i];
  }

  // op = outer product
  var op = List<List<double>>.generate(elementsInQuaternion,
      (i) => List.filled(elementsInQuaternion, 0, growable: false),
      growable: false);

  for (int i = 0; i < elementsInQuaternion; i++) {
    for (int j = 0; j < elementsInQuaternion; j++) {
      op[i][j] = qScaled[i] * qScaled[j];
    }
  }

  double m11 = 1.0 - op[2][2] - op[3][3];
  double m12 = op[1][2] - op[3][0];
  double m13 = op[1][3] + op[2][0];
  double m21 = op[1][2] + op[3][0];
  double m22 = 1.0 - op[1][1] - op[3][3];
  double m23 = op[2][3] - op[1][0];
  double m31 = op[1][3] - op[2][0];
  double m32 = op[2][3] + op[1][0];
  double m33 = 1.0 - op[1][1] - op[2][2];

  return Matrix3(m11, m21, m31, m12, m22, m32, m13, m23, m33);
}

void buildGpxTrackpoint(XmlBuilder builder, DartTrackpoint trackpoint) {
  builder.element('trkpt', nest: () {
    builder.attribute('lat', '${trackpoint.latitude}');
    builder.attribute('lon', '${trackpoint.longitude}');
    String timestamp = '${trackpoint.time}';
    String gpxTimestamp =
        timestamp.substring(0, 10) + 'T' + timestamp.substring(11);
    builder.element('time', nest: gpxTimestamp);
    builder.element('extensions', nest: () {
      builder.element('vtk:sog', nest: '${trackpoint.sog}');
      builder.element('vtk:cog', nest: '${trackpoint.cog}');
      builder.element('vtk:headingMagnetic', nest: '${trackpoint.magHeading}');
      builder.element('vtk:heel', nest: '${trackpoint.heel}');
      builder.element('vtk:pitch', nest: '${trackpoint.pitch}');
    });
  });
}

void buildGpx(XmlBuilder builder, List<DartTrackpoint> dartTrackpoints) {
  builder.processing('xml', 'version="1.0"');
  builder.element('gpx', nest: () {
    builder.attribute('xmlns', 'http://www.topografix.com/GPX/1/1');
    builder.attribute('xmlns:vtk', 'http://www.velocitek.com/VelocitekGPX/v1');
    builder.attribute('version', '1.1');
    builder.element('trk', nest: () {
      builder.element('trkseg', nest: () {
        for (int i = 0; i < dartTrackpoints.length; i++) {
          buildGpxTrackpoint(builder, dartTrackpoints[i]);
        }
      });
    });
  });
}

Uint8List generateCsvBytes(List<DartTrackpoint> dartTrackpoints) {
  print('Converting to CSV...');
  String stringBytes = 'time, latitude, longitude, sog, cog,'
      'q1, q2, q3, q4, mag_heading, heel, pitch\n';
  for (int i = 0; i < dartTrackpoints.length; i++) {
    stringBytes += "${dartTrackpoints[i].time}, "
        "${dartTrackpoints[i].latitude}, "
        "${dartTrackpoints[i].longitude}, "
        "${dartTrackpoints[i].sog}, "
        "${dartTrackpoints[i].cog}, "
        "${dartTrackpoints[i].quaternion[0]}, "
        "${dartTrackpoints[i].quaternion[1]}, "
        "${dartTrackpoints[i].quaternion[2]}, "
        "${dartTrackpoints[i].quaternion[3]}, "
        "${dartTrackpoints[i].magHeading}, "
        "${dartTrackpoints[i].heel}, "
        "${dartTrackpoints[i].pitch}\n";
  }
  Uint8List csvBytes = utf8.encode(stringBytes) as Uint8List;
  return csvBytes;
}

Uint8List generateGpxBytes(List<DartTrackpoint> dartTrackpoints) {
  print('Converting to GPX...');
  final builder = XmlBuilder();
  buildGpx(builder, dartTrackpoints);
  final document = builder.buildDocument();
  String stringByes = document.toXmlString(pretty: true);
  Uint8List gpxBytes = utf8.encode(stringByes) as Uint8List;
  return gpxBytes;
}

String generateCsvAndGpxAsJsonString(csvBytes, gpxBytes) {
  final String csvBytesAsString = String.fromCharCodes(csvBytes);
  final String gpxBytesAsString = String.fromCharCodes(gpxBytes);
  final data = {'csv': csvBytesAsString, 'gpx': gpxBytesAsString};
  final String jsonString = jsonEncode(data);
  return jsonString;
}
