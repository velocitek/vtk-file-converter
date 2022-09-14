import 'package:flutter/material.dart';
import 'download_page.dart';
import '../models/download_list.dart';
import '../tools/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';

class UploadPage extends StatelessWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: const Color(0xFF10253E),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'VELOCITEK',
              style: kTitleText,
            ),
            const Text(
              '.VTK FILE CONVERTER',
              style: kTitleText,
            ),
            const SizedBox(
              height: 30.0,
            ),
            Container(
              height: 4.0,
              width: 128.0,
              color: kBlue,
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              '\nLet\'s get Started!',
              style: kSubtitleText,
            ),
            const SizedBox(
              height: 30.0,
            ),
            const SizedBox(
              width: 900.0,
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
                var upload = result.files.first;
                final String fileName =
                    upload.name.substring(0, upload.name.length - 4);
                Provider.of<DownloadList>(context, listen: false)
                    .addDownload(fileName, upload);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DownloadPage(),
                  ),
                );
              },
              child: const Text('UPLOAD VTK FILE', style: kButtonText),
            ),
            const SizedBox(
              height: 80.0,
            )
          ],
        ),
      ),
    );
  }
}
