import 'package:flutter/material.dart';
import 'package:file_saver/file_saver.dart';
import 'package:provider/provider.dart';
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
        Provider.of<DownloadList>(context, listen: true).downloads[index];
    return ElevatedButton(
      style: kButtonCSV,
      onPressed: () async {
        String name = downloadProvider.name;
        print('Downloading $name...');
        await FileSaver.instance
            .saveFile('$name.csv', downloadProvider.csv, 'CSV');
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
        Provider.of<DownloadList>(context, listen: true).downloads[index];
    return ElevatedButton(
      style: kButtonGPX,
      onPressed: () async {
        String name = downloadProvider.name;
        print('Downloading $name...');
        await FileSaver.instance
            .saveFile('$name.gpx', downloadProvider.gpx, 'GPX');
      },
      child: const Text(
        'DOWNLOAD GPX',
        style: kButtonText,
      ),
    );
  }
}
