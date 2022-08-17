import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:file_saver/file_saver.dart';
import 'constants.dart';
import 'converter.dart';

class DownloadPage extends StatelessWidget {
  DownloadPage({required this.file});

  final PlatformFile file;
  late PlatformFile csv = vtk2CSV(file);
  late PlatformFile gpx = vtk2GPX(file);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              file.name,
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
    if (str != null && str.length >= 3) {
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
