import 'package:flutter/material.dart';
import '../tools/constants.dart';
import 'package:file_saver/file_saver.dart';

class DownloadButton extends StatelessWidget {
  DownloadButton({
    required this.fileName,
    required this.fileType,
    required this.fileData,
    required this.fileEXT,
    required this.buttonColor,
  });
  final String fileName;
  final String fileType;
  var fileData;
  final String fileEXT;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        elevation: 0.0,
        padding: const EdgeInsets.symmetric(vertical: 28),
        fixedSize: const Size.fromWidth(250.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(45),
        ),
      ),
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
