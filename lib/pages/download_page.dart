import 'package:flutter/material.dart';
import '../tools/constants.dart';
import '../tools/widget_downloader.dart';
import '../tools/widget_uploader.dart';

class DownloadPage extends StatefulWidget {
  const DownloadPage({super.key, required this.csv, required this.gpx});
  final csv;
  final gpx;

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
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
            Column(
              children: [
                DownloadRow(csv: widget.csv, gpx: widget.gpx),
                const SizedBox(
                  height: 35.0,
                ),
                UploadButton(buttonText: 'UPLOAD ANOTHER VTK FILE'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
