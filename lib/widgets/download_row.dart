import 'package:flutter/material.dart';
import 'package:vtk_converter/widgets/loading_spinner.dart';
import 'download_button.dart';
import '../models/download_list.dart';
import '../tools/constants.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class DownloadRow extends StatefulWidget {
  DownloadRow({
    super.key,
    required this.name,
    required this.csv,
    required this.gpx,
    required this.downloadIndex,
  });

  final String name;
  var csv;
  var gpx;
  final int downloadIndex;

  @override
  State<DownloadRow> createState() => _DownloadRowState();
}

class _DownloadRowState extends State<DownloadRow> {
  @override
  Widget build(BuildContext context) {
    if (Provider.of<DownloadList>(context, listen: true)
        .downloads[widget.downloadIndex]
        .isLoading) {
      return const LoadingSpinner();
    } else {
      return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            padding: const EdgeInsets.symmetric(vertical: 28),
            fixedSize: const Size.fromWidth(350.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(45),
            ),
          ),
          onPressed: null,
          child: Text(
            widget.name,
            style: kButtonText,
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        IconButton(
          icon: const Icon(
            Icons.do_disturb_on,
            color: kWhite,
          ),
          iconSize: 60.0,
          onPressed: () {
            setState(() {
              Provider.of<DownloadList>(context, listen: false)
                  .deleteDownload(widget.downloadIndex);
            });
          },
        ),
        const SizedBox(
          width: 50.0,
        ),
        DownloadButton(
          fileName: widget.name,
          fileType: 'CSV',
          fileData: widget.csv,
          fileEXT: 'csv',
          buttonColor: kOrange,
        ),
        const SizedBox(
          width: 20.0,
        ),
        DownloadButton(
          fileName: widget.name,
          fileType: 'GPX',
          fileData: widget.gpx,
          fileEXT: 'gpx',
          buttonColor: kBlue2,
        ),
      ]);
    }
  }
}

// SizedBox(
// width: 350.0,
// // Allows for renaming of downloads.
// child: TextFormField(
// initialValue: widget.name,
// style: kTextfieldFont,
// decoration: const InputDecoration(
// contentPadding: EdgeInsets.only(
// left: 20.0,
// ),
// filled: true,
// fillColor: kWhite,
// border: OutlineInputBorder(
// borderRadius: BorderRadius.all(
// Radius.circular(30.0),
// ),
// borderSide: BorderSide.none,
// ),
// ),
// onChanged: (value) {
// setState(() {
// Provider.of<DownloadList>(context, listen: false)
//     .editName(value, widget.downloadIndex);
// });
// }),
// ),
