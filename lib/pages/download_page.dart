import 'package:flutter/material.dart';
import '../tools/constants.dart';
import '../widgets/download_listview.dart';
import 'package:provider/provider.dart';
import '../models/download_list.dart';
import 'package:file_picker/file_picker.dart';

class DownloadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'READY TO DOWNLOAD?',
              style: kTitleText,
            ),
            const SizedBox(height: 75.0),
            Container(
              height: 300.0,
              child: DownloadListView(),
            ),
            ElevatedButton(
              style: kButtonStyle,
              onPressed: () async {
                final result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['vtk'],
                );
                if (result == null) return;
                var upload = result.files.first;
                final String fileName =
                    upload.name.substring(0, upload.name.length - 4);
                Provider.of<DownloadList>(context, listen: false)
                    .addDownload(fileName, upload);
              },
              child: const Text('Upload Button'),
            ),
          ],
        ),
      ),
    );
  }
}
