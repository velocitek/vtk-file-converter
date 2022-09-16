import 'dart:collection';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../tools/command_line_converter/protobuf/vtk.pb.dart';
import '../tools/converter.dart';

class DownloadData {
  // Contains information needed to build a download kit.
  DownloadData({required this.name, required this.vtk});
  late String name;
  final Uint8List vtk;
  late Uint8List csv;
  late Uint8List gpx;
  bool isLoading = true;
}

class DownloadList extends ChangeNotifier {
  // Holds a set of download kits to be displayed in DownloadPage
  final List<DownloadData> _downloads = [];

  UnmodifiableListView<DownloadData> get downloads {
    return UnmodifiableListView(_downloads);
  }

  void convertVTK(int index) {
    converter(index);
    _downloads[index].isLoading = false;
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

  int get downloadCount {
    return _downloads.length;
  }

  double get listSize {
    int listSize = _downloads.length;
    return listSize * 91;
  }

  void converter(int index) {
    downloads[index].csv = vtkToCSV(index);
    downloads[index].gpx = downloads[index].vtk;
  }

  Uint8List vtkToCSV(int index) {
    List<Record> records = readVtk(downloads[index].vtk);
    List<DartTrackpoint> dartTrackpoints = vtkRecordsToDartTrackpoints(records);
    String stringBytes = 'time, sog\n';
    for (int i = 0; i < dartTrackpoints.length; i++) {
      stringBytes += '${dartTrackpoints[i].time}, ${dartTrackpoints[i].sog}\n';
    }
    Uint8List csvBytes = utf8.encode(stringBytes) as Uint8List;
    return csvBytes;
  }
}
