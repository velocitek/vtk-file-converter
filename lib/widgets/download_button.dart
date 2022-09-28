import 'package:flutter/material.dart';
import 'package:file_saver/file_saver.dart';
import 'package:provider/provider.dart';
import 'dart:typed_data';
import '../models/download_list.dart';
import '../tools/constants.dart';

class DownloadCSV extends StatelessWidget {
  const DownloadCSV({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    final downloadProvider =
        Provider.of<DownloadList>(context, listen: false).downloads[index];
    Uint8List fileData = downloadProvider.csv;
    return ElevatedButton(
      style: kButtonCSV,
      onPressed: () {
        String name = downloadProvider.name;
        print('Downloading $name...');
        FileSaver.instance.saveFile('$name.csv', fileData, 'CSV');
      },
      child: const Text(
        'DOWNLOAD CSV',
        style: kButtonText,
      ),
    );
  }
}

class DownloadGPX extends StatelessWidget {
  const DownloadGPX({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    final downloadProvider =
        Provider.of<DownloadList>(context, listen: false).downloads[index];
    Uint8List fileData = downloadProvider.vtk;
    return ElevatedButton(
      style: kButtonGPX,
      onPressed: () {
        String name = downloadProvider.name;
        print('Downloading $name...');
        FileSaver.instance.saveFile('$name.gpx', fileData, 'GPX');
      },
      child: const Text(
        'DOWNLOAD GPX',
        style: kButtonText,
      ),
    );
  }
}
