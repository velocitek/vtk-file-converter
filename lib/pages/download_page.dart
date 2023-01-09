import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vtk_converter/widgets/loading_spinner.dart';
import '../models/download_list.dart';
import '../tools/constants.dart';
import '../widgets/download_listview.dart';
import '../widgets/upload_file.dart';

class DownloadPage extends StatefulWidget {
  const DownloadPage({super.key});

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  @override
  Widget build(BuildContext context) {
    bool isConverting =
        Provider.of<DownloadList>(context, listen: true).isConverting;
    return Material(
      child: Container(
        alignment: Alignment.center,
        color: kDarkBlue,
        child: SizedBox(
          height: 550.0,
          child: Column(
            children: [
              const Text(
                'READY TO CONVERT?',
                style: kTitleText,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Column(
                children: [
                  const Text(
                    'YOUR SELECTION',
                    style: kSubtitleText,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 4.0,
                    width: 190.0,
                    color: kBlue,
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              SizedBox(
                height: //Expands the size of the ListView for every new upload, keeps the download button right below the latest upload.
                    Provider.of<DownloadList>(context, listen: true).listSize,
                child: DownloadListView(),
              ),
              if (isConverting)
                SizedBox(
                  child: LoadingSpinner(),
                ),
              SizedBox(
                width: 1005.0,
                child: Row(
                  children: [
                    ElevatedButton(
                      style: kButtonStyle,
                      onPressed: () async {
                        await uploadFile(context);
                      },
                      child: const Text(
                        'ADD FILE',
                        style: kButtonText,
                      ),
                    ),
                    const SizedBox(
                      width: 30.0,
                    ),
                    const Text(
                      'The converter can only hold up to 3 files and will automatically delete the earliest entry when\nuploading a fourth one.',
                      style: kWarningText,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
