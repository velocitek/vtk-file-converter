import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'constants.dart';
import 'download_page.dart';

class UploadPage extends StatelessWidget {
  late PlatformFile file;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Velocitek File Converter',
              style: kTitleText,
            ),
            const Text(
              '\nConnect your Velocitek device, select, or drag and drop your VTK file, and use our converter\n\n',
              style: kSubtitleText,
            ),
            ElevatedButton(
              style: kButtonStyle,
              onPressed: () async {
                final result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['vtk'],
                );
                if (result == null) return;
                file = result.files.first;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DownloadPage(file: file)));
              },
              child: const Text(
                'UPLOAD',
                style: kButtonText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
