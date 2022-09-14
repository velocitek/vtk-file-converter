import 'package:flutter/foundation.dart';
import 'dart:collection';

class DownloadData {
  // Contains information needed to build a download kit.
  DownloadData({required this.name, required this.csv, required this.gpx});
  late String name;
  final csv;
  final gpx;
  bool isLoading = false;
}

class DownloadList extends ChangeNotifier {
  // Holds a set of download kits to be displayed in DownloadPage
  final List<DownloadData> _downloads = [];

  UnmodifiableListView<DownloadData> get downloads {
    return UnmodifiableListView(_downloads);
  }

  void addDownload(String name, var vtk) {
    final newDownload = DownloadData(name: name, csv: vtk, gpx: vtk);
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

  void endLoading(int index) async {
    _downloads[index].isLoading = false;
    notifyListeners();
  }

  int get downloadCount {
    return _downloads.length;
  }

  double get listSize {
    int listSize = _downloads.length;
    return listSize * 91;
  }
}
