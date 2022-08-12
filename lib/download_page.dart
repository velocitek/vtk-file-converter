import 'package:flutter/material.dart';
import 'package:file_saver/file_saver.dart';

class DownloadPage extends StatefulWidget {
  const DownloadPage({Key? key}) : super(key: key);

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text('File Name', style: TextStyle(fontSize: 24.0)),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DownloadButton('CSV'),
          SizedBox(width: 30.0),
          DownloadButton('GPX'),
        ],
      )
    ]);
  }
}

class DownloadButton extends StatelessWidget {
  DownloadButton(this.fileType);

  final String fileType;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.grey,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: () async {
        // await FileSaver.instance.saveFile('file.csv', file.bytes!, 'csv');
      },
      child: Text(
        'Download $fileType',
        style: TextStyle(
          fontSize: 26.0,
          color: Colors.black,
        ),
      ),
    );
  }
}
