import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:file_saver/file_saver.dart';
import '../tools/constants.dart';

class DownloadPage extends StatelessWidget {
  DownloadPage({required this.fileName, required this.csv, required this.gpx});

  final String fileName;
  late PlatformFile csv;
  late PlatformFile gpx;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              fileName,
              style: kTitleText,
            ),
            Column(
              children: [
                const Text(
                    '\nSelect the appropriate file type you want to download.\n\n',
                    style: kSubtitleText),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DownloadButton(fileType: 'CSV', fileEXT: 'csv', file: csv),
                    const SizedBox(width: 30.0),
                    DownloadButton(fileType: 'GPX', fileEXT: 'gpx', file: gpx),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                  ),
                  child: const Text(
                    '\n\nClick here to return to the Upload page',
                    style: kReUpload,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DownloadButton extends StatelessWidget {
  DownloadButton(
      {required this.fileType, required this.fileEXT, required this.file});

  final String fileType;
  final String fileEXT;
  final PlatformFile file;
  late String newName = removeEXT(file.name);

  String removeEXT(String str) {
    if (str.length >= 3) {
      str = str.substring(0, str.length - 3);
      return str;
    }
    return str;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: kButtonStyle,
      onPressed: () async {
        await FileSaver.instance
            .saveFile('$newName$fileEXT', file.bytes!, fileEXT);
      },
      child: Text(
        'Download $fileType',
        style: kButtonText,
      ),
    );
  }
}
