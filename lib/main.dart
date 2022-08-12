import 'package:flutter/material.dart';
import 'converter_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Velocitek File Converter',
                    style: TextStyle(fontSize: 38.0)),
                ConverterPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*

Below is a working test code on its own for reference

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Velocitek File Converter\n',
                    style: TextStyle(fontSize: 38.0)),
                const Text(
                    'Connect your Velocitek device, select, or drag and drop your VTK file, and use our converter\n\n',
                    style: TextStyle(fontSize: 16.0)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () async {
                    final result = await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ['vtk'],
                    );
                    if (result == null) return;
                    final file = result.files.first;
                    await FileSaver.instance.saveFile(
                      'filename.vtk',
                      file.bytes!,
                      'vtk',
                    );
                  },
                  child: const Text(
                    'UPLOAD',
                    style: TextStyle(
                      fontSize: 26.0,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

*/
