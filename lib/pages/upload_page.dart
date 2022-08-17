import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'loading_page.dart';
import 'download_page.dart';
import '../tools/constants.dart';
import '../tools/converter.dart';

class UploadPage extends StatelessWidget {
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
                final file = result.files.first;
                String fileName = file.name;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoadingPage(
                      fileName: fileName,
                    ),
                  ),
                );
                final csv = vtk2CSV(file);
                final gpx = vtk2GPX(file);
                await Future.delayed(
                  const Duration(seconds: 3),
                );
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DownloadPage(
                      fileName: fileName,
                      csv: csv,
                      gpx: gpx,
                    ),
                  ),
                );
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
