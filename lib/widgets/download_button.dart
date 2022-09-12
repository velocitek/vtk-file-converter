import 'package:flutter/material.dart';
import '../tools/constants.dart';
import 'package:file_saver/file_saver.dart';

class DownloadButton extends StatelessWidget {
  DownloadButton({
    required this.fileName,
    required this.fileType,
    required this.fileData,
    required this.fileEXT,
  });
  final String fileName;
  final String fileType;
  var fileData;
  final String fileEXT;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: kButtonStyle,
      onPressed: () async {
        await FileSaver.instance
            .saveFile('$fileName.$fileType', fileData.bytes!, fileEXT);
      },
      child: Text(
        'DOWNLOAD $fileType',
        style: kButtonText,
      ),
    );
  }
}
