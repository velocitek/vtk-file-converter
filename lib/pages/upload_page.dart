import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'loading_page.dart';
import '../tools/constants.dart';

class UploadPage extends StatelessWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'VTK FILE CONVERTER',
              style: kTitleText,
            ),
            const SizedBox(
              height: 60.0,
            ),
            const Text(
              '\nLet\'s get Started!',
              style: kSubtitleText,
            ),
            const SizedBox(
              height: 30.0,
            ),
            const SizedBox(
              width: 720.0,
              child: Text(
                'Connect your Velocitek device via USB to your computer. Then select or drop your VTK file to this window to use our converter.',
                style: kSubtitleText,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            ElevatedButton(
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
              child: const Text(
                'UPLOAD VTK FILE',
                style: kButtonText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
