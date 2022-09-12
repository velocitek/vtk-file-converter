import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/upload_page.dart';
import 'models/download_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // Creates a global object for all children to refer back to
      create: (context) => DownloadList(),
      child: MaterialApp(
        home: UploadPage(),
      ),
    );
  }
}

//TODO: Use mixins for widgets
