import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'protobuf/vtk.pb.dart';
import '../converter.dart';
/*
main(List arguments) {
    if (arguments.length != 2) {
      print('Usage: vtk_tool input_file.vtk output_file');
      exit(-1);
    }

    File file = File(arguments.first);
    final Uint8List vtkBytes = file.readAsBytesSync();
    List<Record> records = readVtk(vtkBytes);
    List<DartTrackpoint> dartTrackpoints = vtkRecordsToDartTrackpoints(records);
    for(int i = 0; i < dartTrackpoints.length; i++)
    {
      // print(dartTrackpoints[i]);
    }
    Uint8List csvBytes = generateCsvBytes(dartTrackpoints);
    File csvOut = File('${arguments[1]}.csv');
    csvOut.writeAsBytesSync(csvBytes);

    Uint8List gpxBytes = generateGpxBytes(dartTrackpoints);
    File gpxOut = File('${arguments[1]}.gpx');
    gpxOut.writeAsBytesSync(gpxBytes);

}
*/

main(List arguments) {
    if (arguments.length != 2) {
      print('Usage: vtk_tool input_file.vtk output_file');
      exit(-1);
    }

    File file = File(arguments.first);
    final Uint8List vtkBytes = file.readAsBytesSync();
    final String vtkBytesAsString = String.fromCharCodes(vtkBytes);
    final String csvAndGpxAsJsonString = conversionWorker(vtkBytesAsString);
    dynamic csvAndGpx = jsonDecode(csvAndGpxAsJsonString);

    final String csvBytesAsString = csvAndGpx['csv'];
    Uint8List csvBytes = utf8.encode(csvBytesAsString) as Uint8List;
    File csvOut = File('${arguments[1]}.csv');
    csvOut.writeAsBytesSync(csvBytes);

    final String gpxBytesAsString = csvAndGpx['gpx'];
    Uint8List gpxBytes = utf8.encode(gpxBytesAsString) as Uint8List;
    File gpxOut = File('${arguments[1]}.gpx');
    gpxOut.writeAsBytesSync(gpxBytes);

}

