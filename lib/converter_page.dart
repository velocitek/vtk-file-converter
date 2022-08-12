import 'package:flutter/material.dart';
import 'upload_page.dart';
import 'download_page.dart';

class ConverterPage extends StatefulWidget {
  const ConverterPage({Key? key}) : super(key: key);

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  bool fileUploaded = false;

  Widget currentPage() {
    if (fileUploaded == false) {
      return UploadPage();
    } else {
      return DownloadPage();
    }
  }

  void uploadFile() {
    setState(() {
      fileUploaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return currentPage();
  }
}
