import 'package:flutter/foundation.dart';
import 'dart:collection';
import 'dart:typed_data';
import '../tools/command_line_converter/protobuf/vtk.pb.dart';
import '../tools/command_line_converter/vtk_tool.dart';
import 'dart:io';

class DownloadData {
  // Contains information needed to build a download kit.
  DownloadData({required this.name, required this.vtk});
  late String name;
  var vtk;
  var csv;
  var gpx;
  bool isLoading = true;
}

class DownloadList extends ChangeNotifier {
  // Holds a set of download kits to be displayed in DownloadPage
  final List<DownloadData> _downloads = [];

  UnmodifiableListView<DownloadData> get downloads {
    return UnmodifiableListView(_downloads);
  }

  Future convertVTK(int index) async {
    await converter(index);
    endLoading(index);
    notifyListeners();
  }

  void addDownload(String name, var vtk) {
    final newDownload = DownloadData(
      name: name,
      vtk: vtk,
    );
    if (downloadCount == 3) {
      deleteDownload(0);
    }
    _downloads.add(newDownload);
    notifyListeners();
  }

  void deleteDownload(int index) {
    _downloads.remove(_downloads[index]);
    notifyListeners();
  }

  void editName(String edit, int index) {
    _downloads[index].name = edit;
    notifyListeners();
  }

  void endLoading(int index) {
    _downloads[index].isLoading = false;
  }

  int get downloadCount {
    return _downloads.length;
  }

  double get listSize {
    int listSize = _downloads.length;
    return listSize * 91;
  }

  //TODO: Converter
  Future converter(int index) async {
    List<Record> records = readVtk(downloads[index].vtk);
    List<DartTrackpoint> dartTrackpoints = vtkRecordsToDartTrackpoints(records);
    downloads[index].csv = downloads[index].vtk;
    downloads[index].gpx = downloads[index].vtk;
    await Future.delayed(const Duration(seconds: 1));
  }
}
