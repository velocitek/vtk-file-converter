import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/download_list.dart';
import 'download_button.dart';

class DownloadRow extends StatefulWidget {
  DownloadRow({
    required this.name,
    required this.csv,
    required this.gpx,
    required this.downloadIndex,
  });

  late final String name;
  var csv;
  var gpx;
  final DownloadData downloadIndex;

  @override
  State<DownloadRow> createState() => _DownloadRowState();
}

class _DownloadRowState extends State<DownloadRow> {
  late String inputValue = widget.name;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
            }),
      ),
      IconButton(
        icon: const Icon(
          Icons.do_disturb_on,
          color: Colors.black,
        ),
        iconSize: 45.0,
        onPressed: () {
          Provider.of<DownloadList>(context, listen: false)
              .deleteDownload(widget.downloadIndex);
        },
      ),
      DownloadButton(
          fileName: inputValue,
          fileType: 'CSV',
          fileData: widget.csv,
          fileEXT: 'csv'),
      DownloadButton(
          fileName: inputValue,
          fileType: 'GPX',
          fileData: widget.gpx,
          fileEXT: 'gpx'),
    ]);
  }
}
