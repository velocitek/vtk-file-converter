import 'package:flutter/foundation.dart';
import 'dart:collection';

class DownloadData {
  // Contains information needed to build a download kit.
  DownloadData({required this.name, required this.csv, required this.gpx});
  final name;
  final csv;
  final gpx;
}

class DownloadList extends ChangeNotifier {
  // Holds a set of download kits to be displayed in DownloadPage
  final List<DownloadData> _downloads = [];

  UnmodifiableListView<DownloadData> get downloads {
    return UnmodifiableListView(_downloads);
  }

  void addDownload(String name, var vtk) {
    final newDownload = DownloadData(name: name, csv: vtk, gpx: vtk);
    _downloads.add(newDownload);
    notifyListeners();
  }

  void deleteDownload(int index) {
    _downloads.remove(_downloads[index]);
    notifyListeners();
  }

  int get downloadCount {
    return _downloads.length;
  }

  double get listSize {
    int listSize = downloads.length;
    return listSize * 85;
  }
}
