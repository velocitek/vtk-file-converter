import 'package:flutter/material.dart';
import 'package:file_saver/file_saver.dart';
import 'package:file_picker/file_picker.dart';
import '../tools/constants.dart';

class DownloadPage extends StatefulWidget {
  const DownloadPage({super.key, required this.csv, required this.gpx});
  final csv;
  final gpx;

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'READY TO DOWNLOAD?',
              style: kTitleText,
            ),
            const SizedBox(height: 75.0),
            Column(
              children: [
                DownloadRow(csv: widget.csv, gpx: widget.gpx),
                const SizedBox(
                  height: 35.0,
                ),
                ElevatedButton(
                  onPressed: () {
//Two pops to bypass the loading page.
                  },
                  style: kButtonStyle,
                  child: const Text(
                    'REUPLOAD',
                    style: kButtonText,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DownloadRow extends StatefulWidget {
  const DownloadRow({
    Key? key,
    required this.csv,
    required this.gpx,
  }) : super(key: key);

  final csv;
  final gpx;

  @override
  State<DownloadRow> createState() => _DownloadRowState();
}

class _DownloadRowState extends State<DownloadRow> {
  String inputValue = 'session_1';
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 30),
          width: 250.0,
          child: TextFormField(
            initialValue: inputValue,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[300],
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (value) {
              setState(() {
                inputValue = value;
              });
            },
          ),
        ),
        const IconButton(
          icon: Icon(
            Icons.edit,
            color: Colors.black,
          ),
          iconSize: 45.0,
          onPressed: null,
        ),
        const IconButton(
          icon: Icon(
            Icons.do_disturb_on,
            color: Colors.black,
          ),
          iconSize: 45.0,
          onPressed: null,
        ),
        const SizedBox(width: 100.0),
        DownloadButton(
          fileType: 'CSV',
          fileEXT: 'csv',
          file: widget.csv,
          inputValue: inputValue,
        ),
        const SizedBox(width: 30.0),
        DownloadButton(
          fileType: 'GPX',
          fileEXT: 'gpx',
          file: widget.gpx,
          inputValue: inputValue,
        ),
      ],
    );
  }
}

class DownloadButton extends StatelessWidget {
  const DownloadButton(
      {Key? key,
      required this.fileType,
      required this.fileEXT,
      required this.file,
      required this.inputValue})
      : super(key: key);

  final String fileType;
  final String fileEXT;
  final file;
  final String inputValue;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: kButtonStyle,
      onPressed: () async {
        await FileSaver.instance
            .saveFile('$inputValue.$fileEXT', file.bytes!, fileEXT);
      },
      child: Text(
        'DOWNLOAD $fileType',
        style: kButtonText,
      ),
    );
  }
}
