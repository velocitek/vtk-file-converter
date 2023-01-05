import 'package:isolated_worker/isolated_worker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:isolated_worker/js_isolated_worker.dart';
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

Future<void> futureFunction(DownloadList downloadList, int index) async {
  print('Begin computation...');
  return ;
}

class _DownloadRowState extends State<DownloadRow> {
  late Future<void> dataFuture;

  @override
  void initState() {
    super.initState();
    print('Init state');
    DownloadList downloadList =
        Provider.of<DownloadList>(context, listen: false);
    dataFuture = downloadList.convertVTK(widget.downloadIndex);
  }

  @override
  Widget build(BuildContext context) {
    //This is used instead of passing in data to this widget. It grabs the data from a different object instead of creating a new object.
    final downloadProvider = Provider.of<DownloadList>(context, listen: false);
    final int index = widget.downloadIndex;
    final String name = widget.name;
    print('Loading widget...');
    return FutureBuilder<void>(
      //Initiates conversion while displaying the loading spinner.
      future: dataFuture,
      builder: (context, snapshot) {
        print('Loading builder...');
        //Checks to make sure if both the conversion is done and if it's already occurred so it doesn't reconvert at every state update.
        if (snapshot.connectionState != ConnectionState.done) {
          print('Loading Spinner');
          return const LoadingSpinner();
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60.0,
                width: 350.0,
                decoration: const BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.all(Radius.circular(45)),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2.0),
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
            ],
          );
        }
      },
    );
  }
}
