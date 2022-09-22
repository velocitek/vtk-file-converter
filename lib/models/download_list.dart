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

  void addDownload(String name, var vtk) {
    print('Uploading file...');
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

  int get downloadCount {
    //Used to set the size of the ListView.
    return _downloads.length;
  }

  double get listSize {
    //Calculates size of ListView container based off of amount of uploaded files.
    int listSize = _downloads.length;
    return listSize * 91;
  }

  //Sets objects within data as converted.
  Future<bool> convertVTK(int index) async {
    if (_downloads[index].isLoading) {
      //await Future.delayed(const Duration(seconds: 1));
      await converter(index);
      _downloads[index].isLoading = false;
      return true;
    } else {
      return false;
    }
  }

  Future<bool> converter(int index) async {
    _downloads[index].csv = vtkToCSV(index);
    _downloads[index].gpx = vtkToGPX(index);
    return true;
  }

  Uint8List vtkToCSV(int index) {
    print('Converting to CSV...');
    List<Record> records = readVtk(_downloads[index].vtk);
    List<DartTrackpoint> dartTrackpoints = vtkRecordsToDartTrackpoints(records);
    String stringBytes = 'time, sog\n';
    for (int i = 0; i < dartTrackpoints.length; i++) {
      stringBytes += '${dartTrackpoints[i].time}, ${dartTrackpoints[i].sog}\n';
    }
    Uint8List csvBytes = utf8.encode(stringBytes) as Uint8List;
    return csvBytes;
  }

//TODO: VTK to GPX converter.
  Uint8List vtkToGPX(int index) {
    print('Converting to GPX...');
    Uint8List gpxBytes = _downloads[index].vtk;
    return gpxBytes;
  }
}
