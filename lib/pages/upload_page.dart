import 'package:flutter/material.dart';
import '../tools/constants.dart';
import '../tools/widget_uploader.dart';

class UploadPage extends StatelessWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'VTK FILE CONVERTER',
                style: kTitleText,
              ),
              SizedBox(
                height: 60.0,
              ),
              Text(
                '\nLet\'s get Started!',
                style: kSubtitleText,
              ),
              SizedBox(
                height: 30.0,
              ),
              SizedBox(
                width: 720.0,
                child: Text(
                  'Connect your Velocitek device via USB to your computer. Then select or drop your VTK file to this window to use our converter.',
                  style: kSubtitleText,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              UploadButton(buttonText: 'UPLOAD VTK FILE'),
            ],
          ),
        ),
      ),
    );
  }
}
