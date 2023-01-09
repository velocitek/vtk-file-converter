import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/download_list.dart';
import 'pages/upload_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // Creates a global object for all children to refer back to
      // In this case, the global object stores data for the converter and its conversions.
      create: (context) => DownloadList(),
      child: const MaterialApp(
        home: UploadPage(),
      ),
    );
  }
}
