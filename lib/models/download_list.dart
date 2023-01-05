import 'dart:collection';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:xml/xml.dart';
import '../tools/command_line_converter/protobuf/vtk.pb.dart';
import '../tools/converter.dart';

// Map<String, dynamic> convertVTK(Map<String, dynamic> vtkJson){

// }


class DownloadData {

  DownloadData({required this.name, required this.vtk});
  String name;
  // Bytes from a .vtk file.
  final Uint8List vtk;
  // Bytes for a .csv file.
  late Uint8List csv;
  // Bytes for a .gpx file.
  late Uint8List gpx;

  //Sets objects within data as converted.
  Future<void> convertVTK() async {
    List<Record> records = readVtk(vtk);
    List<DartTrackpoint> dartTrackpoints = vtkRecordsToDartTrackpoints(records);
    csv = writeCSV(dartTrackpoints);
    gpx = writeGPX(dartTrackpoints);
  }

  Uint8List writeCSV(List<DartTrackpoint> dartTrackpoints) {
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

  Uint8List writeGPX(List<DartTrackpoint> dartTrackpoints) {
    print('Converting to GPX...');
    final builder = XmlBuilder();
    buildGpx(builder, dartTrackpoints);
    final document = builder.buildDocument();
    String stringByes = document.toXmlString(pretty: true);
    Uint8List gpxBytes = utf8.encode(stringByes) as Uint8List;
    return gpxBytes;

  }

}

class DownloadList extends ChangeNotifier {
  // Holds a set of download kits to be displayed in DownloadPage
  final List<DownloadData> _downloads = [];

  UnmodifiableListView<DownloadData> get downloads {
    return UnmodifiableListView(_downloads);
  }

  void addDownload(String name, var vtk) {
    final newDownload = DownloadData(
      name: name,
      vtk: vtk,
    );
    //Deletes first entry when uploading a fourth file.
    if (downloadCount == 3) {
      deleteDownload(0);
    }
    _downloads.add(newDownload);
    notifyListeners();
  }

  void deleteDownload(int index) {
    print('Deleting file...');
    _downloads.remove(_downloads[index]);
    notifyListeners();
  }

  void editName(String newName, int index) {
    _downloads[index].name = newName;
  }

  Future<void> convertVTK(int index) async {
    return _downloads[index].convertVTK();
  }

  int get downloadCount {
    //Used to set the size of the ListView.
    return _downloads.length;
  }

  double get listSize {
    //Calculates size of ListView container based off of amount of uploaded files.
    int listSize = _downloads.length;
    return listSize * 91.00;
  }

}
