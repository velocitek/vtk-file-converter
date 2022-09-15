import 'package:flutter/material.dart';
import 'package:vtk_converter/widgets/loading_spinner.dart';
import 'download_button.dart';
import '../models/download_list.dart';
import '../tools/constants.dart';
import 'package:provider/provider.dart';

class DownloadRow extends StatefulWidget {
  DownloadRow({
    super.key,
    required this.name,
    required this.downloadIndex,
  });

  final String name;
  final int downloadIndex;

  @override
  State<DownloadRow> createState() => _DownloadRowState();
}

class _DownloadRowState extends State<DownloadRow> {
  void endLoading() async {
    await Provider.of<DownloadList>(context, listen: false)
        .convertVTK(widget.downloadIndex);
  }

  @override
  Widget build(BuildContext context) {
    endLoading();
    if (Provider.of<DownloadList>(context, listen: true)
        .downloads[widget.downloadIndex]
        .isLoading) {
      return const LoadingSpinner();
    } else {
      return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          height: 60.0,
          width: 350.0,
          decoration: const BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.all(Radius.circular(45)),
          ),
          child: Center(
            child: Text(
              widget.name,
              style: kFileText,
            ),
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
          fileData: Provider.of<DownloadList>(context, listen: false)
              .downloads[widget.downloadIndex]
              .csv,
          fileEXT: 'csv',
          buttonColor: kOrange,
        ),
        const SizedBox(
          width: 20.0,
        ),
        DownloadButton(
          fileName: widget.name,
          fileType: 'GPX',
          fileData: Provider.of<DownloadList>(context, listen: false)
              .downloads[widget.downloadIndex]
              .gpx,
          fileEXT: 'gpx',
          buttonColor: kBlue2,
        ),
      ]);
    }
  }
}
