import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/download_list.dart';
import '../widgets/download_row.dart';

class DownloadListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DownloadList>(
      builder: (context, downloadList, child) {
        return ListView.builder(
          // Index is the count for the list.
          itemBuilder: (context, index) {
            final downloadElement = downloadList.downloads[index];
            return DownloadRow(
              name: downloadElement.name,
              csv: downloadElement.csv,
              gpx: downloadElement.gpx,
              downloadIndex: downloadElement,
            );
          },
          // This is required to set the number of items for ListView.
          itemCount: downloadList.downloadCount,
        );
      },
    );
  }
}
