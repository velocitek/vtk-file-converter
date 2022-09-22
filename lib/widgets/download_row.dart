import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vtk_converter/widgets/loading_spinner.dart';
import 'download_button.dart';
import '../models/download_list.dart';
import '../tools/constants.dart';

class DownloadRow extends StatefulWidget {
  const DownloadRow({
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
  // @override
  // void initState() {
  //   super.initState();
  //   Provider.of<DownloadList>(context, listen: false)
  //       .convertVTK(widget.downloadIndex);
  // }

  @override
  Widget build(BuildContext context) {
    //This is used instead of passing in data to this widget. It grabs the data from a different object instead of creating a new object.
    var downloadProvider = Provider.of<DownloadList>(context, listen: false);
    int index = widget.downloadIndex;
    String name = widget.name;
    return FutureBuilder(
        //Initiates conversion while displaying the loading spinner.
        future: downloadProvider.convertVTK(index),
        builder: (context, snapshot) {
          //Checks to make sure if both the conversion is done and if it's already occurred so it doesn't reconvert at every state update.
          if (snapshot.connectionState != ConnectionState.done &&
              downloadProvider.downloads[index].isLoading == true) {
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
                  child: Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: TextFormField(
                      initialValue: name,
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                      style: kTextfieldFont,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        downloadProvider.editName(value, index);
                      },
                    ),
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
                    downloadProvider.deleteDownload(index);
                  });
                },
              ),
              const SizedBox(
                width: 50.0,
              ),
              DownloadCSV(
                index: index,
              ),
              const SizedBox(
                width: 20.0,
              ),
              DownloadGPX(
                index: index,
              ),
            ]);
          }
        });
  }
}
