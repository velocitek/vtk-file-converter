import 'package:flutter/material.dart';
import '../tools/constants.dart';

class LoadingPage extends StatelessWidget {
  LoadingPage({required this.fileName});

  final String fileName;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Converting $fileName into CSV and GPX format...\n',
              style: kTitleText,
            ),
            const SizedBox(
              height: 30.0,
              width: 30.0,
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
