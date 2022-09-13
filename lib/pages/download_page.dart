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
      child: Container(
        alignment: Alignment.center,
        color: const Color(0xFF10253E),
        child: SizedBox(
          height: 550.0,
          child: Column(
            children: [
              const Text(
                'READY TO DOWNLOAD?',
                style: kTitleText,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 770.0),
                child: Column(
                  children: [
                    const Text(
                      'YOUR SELECTION',
                      style: kSubtitleText,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 4.0,
                      width: 190.0,
                      color: kBlue,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15.0),
              SizedBox(
                height:
                    Provider.of<DownloadList>(context, listen: true).listSize,
                child: DownloadListView(),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 755.0),
                child: ElevatedButton(
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
                  child: const Text(
                    'ADD FILE',
                    style: kButtonText,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
