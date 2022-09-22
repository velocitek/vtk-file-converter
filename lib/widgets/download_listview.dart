import 'package:flutter/material.dart';
import '../models/download_list.dart';
import '../widgets/download_row.dart';
import 'package:provider/provider.dart';

class DownloadListView extends StatelessWidget {
  const DownloadListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DownloadList>(
      builder: (context, downloadList, child) {
        // Creates a ListView out of a list.
        return ListView.builder(
          // Index is the count for the list.
          itemBuilder: (context, index) {
            final downloadElement = downloadList.downloads[index];
            return Column(
              children: [
                DownloadRow(
                  //Passes only the name and index. The name is required otherwise it wouldn't update properly upon deletion.
                  key: Key(downloadElement.name),
                  name: downloadElement.name,
                  downloadIndex: index,
                ),
                const SizedBox(
                  height: 10.0,
                )
              ],
            );
          },
          // This is required to set the number of items for ListView.
          itemCount: downloadList.downloadCount,
        );
      },
    );
  }
}
