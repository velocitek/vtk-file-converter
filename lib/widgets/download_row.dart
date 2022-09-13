import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/download_list.dart';
import 'download_button.dart';
import '../tools/constants.dart';

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
  final int downloadIndex;

  @override
  State<DownloadRow> createState() => _DownloadRowState();
}

class _DownloadRowState extends State<DownloadRow> {
  late String inputValue = widget.name;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
        width: 350.0,
        child: TextFormField(
            initialValue: inputValue,
            style: kTextfieldFont,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(
                left: 20.0,
              ),
              filled: true,
              fillColor: kWhite,
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
      const SizedBox(
        width: 10.0,
      ),
      IconButton(
        icon: const Icon(
          Icons.do_disturb_on,
          color: Colors.white,
        ),
        iconSize: 60.0,
        onPressed: () {
          Provider.of<DownloadList>(context, listen: false)
              .deleteDownload(widget.downloadIndex);
        },
      ),
      const SizedBox(
        width: 50.0,
      ),
      DownloadButton(
        fileName: inputValue,
        fileType: 'CSV',
        fileData: widget.csv,
        fileEXT: 'csv',
        buttonColor: kOrange,
      ),
      const SizedBox(
        width: 20.0,
      ),
      DownloadButton(
        fileName: inputValue,
        fileType: 'GPX',
        fileData: widget.gpx,
        fileEXT: 'gpx',
        buttonColor: kBlue2,
      ),
    ]);
  }
}
