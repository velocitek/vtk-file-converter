import 'package:flutter/material.dart';
import 'dart:collection';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:isolated_worker/js_isolated_worker.dart';
import '../pages/download_page.dart';
import '../pages/upload_page.dart';

class DownloadData {
  DownloadData({
    required this.name,
    required this.csv,
    required this.gpx,
  });
  String name;
  // Bytes for a .csv file.
  final Uint8List csv;
  // Bytes for a .gpx file.
  final Uint8List gpx;
}

class DownloadList extends ChangeNotifier {
  // Holds a set of download kits to be displayed in DownloadPage
  final List<DownloadData> _downloads = [];
  Widget pageSelector = const UploadPage();
  bool isConverting = false;

  UnmodifiableListView<DownloadData> get downloads {
    return UnmodifiableListView(_downloads);
  }

  Future<void> addDownload(String name, Uint8List vtk) async {
    print('Adding download...');
    pageSelector = const DownloadPage();
    if (downloadCount == 3) {
      deleteDownload(0);
    }
    isConverting = true;
    notifyListeners();
    final String vtkString = bytesToString(vtk);
    final bool loaded =
        await JsIsolatedWorker().importScripts(['../web/converter.js']);
    if (loaded) {
      final String csvAndGpxString = await JsIsolatedWorker()
          .run(functionName: 'conversionWorker', arguments: vtkString);
      dynamic csvAndGpx = jsonDecode(csvAndGpxString);
      final newDownload = DownloadData(
        name: name,
        csv: jsonToCsv(csvAndGpx),
        gpx: jsonToGpx(csvAndGpx),
      );
      _downloads.add(newDownload);
    } else {
      debugPrint('Web worker is not available');
    }
    //Deletes first entry when uploading a fourth file.

    print('Download added');
    isConverting = false;
    notifyListeners();
  }

  String bytesToString(Uint8List vtk) {
    final String newString = String.fromCharCodes(vtk!);
    return newString;
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

  void deleteDownload(int index) {
    print('Deleting file...');
    _downloads.remove(_downloads[index]);
    notifyListeners();
  }

  void editName(String newName, int index) {
    _downloads[index].name = newName;
  }

  // Future<void> convertVTK(int index) async {
  //   return _downloads[index].convertVTK();
  // }

  bool getConversion() {
    return isConverting;
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
