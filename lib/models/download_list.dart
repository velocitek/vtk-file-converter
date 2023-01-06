import 'dart:collection';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:isolated_worker/js_isolated_worker.dart';
import '../tools/protobuf/vtk.pb.dart';
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
    final String vtkString = bytesToString(vtk);
    dynamic csvAndGpx = jsonDecode(conversionWorker(vtkString));
    csv = jsonToCsv(csvAndGpx);
    gpx = jsonToGpx(csvAndGpx);
    // final bool loaded =
    //     await JsIsolatedWorker().importScripts(['../web/echo.js']);
    // if (loaded) {
    //   debugPrint(await JsIsolatedWorker()
    //       .run(functionName: 'conversionWorker', arguments: vtkString));
    // } else {
    //   debugPrint('Web worker is not available');
    // }
  }

  Uint8List jsonToCsv(dynamic json) {
    final String csvBytesAsString = json['csv'];
    Uint8List csvBytes = utf8.encode(csvBytesAsString) as Uint8List;
    return csvBytes;
  }

  Uint8List jsonToGpx(dynamic json) {
    final String gpxBytesAsString = json['gpx'];
    Uint8List gpxBytes = utf8.encode(gpxBytesAsString) as Uint8List;
    return gpxBytes;
  }

  String bytesToString(Uint8List vtk) {
    final String newString = String.fromCharCodes(vtk!);
    return newString;
  }
//final String uploadString = String.fromCharCodes(uploadBytes!);
}

class DownloadList extends ChangeNotifier {
  // Holds a set of download kits to be displayed in DownloadPage
  final List<DownloadData> _downloads = [];

  UnmodifiableListView<DownloadData> get downloads {
    return UnmodifiableListView(_downloads);
  }

  void addDownload(String name, Uint8List vtk) {
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
