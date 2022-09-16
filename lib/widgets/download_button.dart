import 'package:flutter/material.dart';
import 'package:file_saver/file_saver.dart';
import 'dart:typed_data';
import '../tools/constants.dart';

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
  final Uint8List fileData;
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
            .saveFile('$fileName.$fileType', fileData, fileEXT);
      },
      child: Text(
        'DOWNLOAD $fileType',
        style: kButtonText,
      ),
    );
  }
}
