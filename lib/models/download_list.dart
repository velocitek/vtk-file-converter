import 'dart:collection';
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
  final String vtk;
  // Bytes for a .csv file.
  late Uint8List csv;
  // Bytes for a .gpx file.
  late Uint8List gpx;

  //Sets objects within data as converted.
  Future<void> convertVTK() async {
    final bool loaded =
        await JsIsolatedWorker().importScripts(['../web/echo.js']);
    if (loaded) {
      debugPrint(await JsIsolatedWorker()
          .run(functionName: 'conversionWorker', arguments: vtk));
    } else {
      debugPrint('Web worker is not available');
    }
    // List<Record> records = readVtk(vtk);
    // List<DartTrackpoint> dartTrackpoints = vtkRecordsToDartTrackpoints(records);
    // csv = generateCsvBytes(dartTrackpoints);
    // gpx = generateGpxBytes(dartTrackpoints);
  }
}

class DownloadList extends ChangeNotifier {
  // Holds a set of download kits to be displayed in DownloadPage
  final List<DownloadData> _downloads = [];

  UnmodifiableListView<DownloadData> get downloads {
    return UnmodifiableListView(_downloads);
  }

  void addDownload(String name, String vtk) {
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
