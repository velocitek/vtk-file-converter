import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../pages/loading_page.dart';
import 'constants.dart';

class UploadButton extends StatelessWidget {
  const UploadButton({
    Key? key,
    required this.buttonText,
  }) : super(key: key);
  final buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: kButtonStyle,
      onPressed: () async {
        final result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['vtk'],
        );
        if (result == null) return;
        var file = result.files.first;
        var fileData = file.bytes;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoadingPage(file: fileData),
          ),
        );
      },
      child: Text(
        buttonText,
        style: kButtonText,
      ),
    );
  }
}
