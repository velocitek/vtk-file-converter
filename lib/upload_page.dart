import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text(
          '\nConnect your Velocitek device, select, or drag and drop your VTK file, and use our converter\n\n',
          style: TextStyle(fontSize: 16.0)),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.grey,
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () async {
          final result = await FilePicker.platform.pickFiles(
            type: FileType.custom,
            allowedExtensions: ['vtk'],
          );
          if (result == null) return;
          final file = result.files.first;
        },
        child: const Text(
          'UPLOAD',
          style: TextStyle(
            fontSize: 26.0,
            color: Colors.black,
          ),
        ),
      )
    ]);
  }
}
