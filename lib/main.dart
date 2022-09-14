import 'package:flutter/material.dart';
import 'models/download_list.dart';
import 'pages/upload_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // Creates a global object for all children to refer back to
      create: (context) => DownloadList(),
      child: const MaterialApp(
        home: UploadPage(),
      ),
    );
  }
}

//TODO: Use mixins for widgets
