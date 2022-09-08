import 'package:flutter/material.dart';
import '../tools/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'download_page.dart';
import '../tools/converter.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key, required this.file});
  final file;

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    convertVTK();
  }

  void convertVTK() async {
    var csv = await vtk2CSV(widget.file);
    var gpx = await vtk2GPX(widget.file);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return DownloadPage(csv: csv, gpx: gpx);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'FILE IS CONVERTING',
              style: kTitleText,
            ),
            const SizedBox(height: 50.0),
            const SpinKitThreeBounce(
              color: Colors.blue,
              size: 50.0,
            ),
            const SizedBox(height: 50.0),
            const Text(
              'Utilizing VTK file(s) or converting your files to GPX or CSV gives you the flexibility to view your data on many free and paid platforms',
              textAlign: TextAlign.center,
              style: kSubtitleText,
            ),
            const SizedBox(height: 50.0),
            ElevatedButton(
              style: kCancelButtonStyle,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'CANCEL',
                style: kCancelButtonText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
