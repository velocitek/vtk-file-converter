import 'package:flutter/material.dart';
import '../tools/constants.dart';
import '../widgets/upload_file.dart';

class UploadPage extends StatelessWidget {
  const UploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        child: Container(
          color: const Color(0xFF10253E),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40.0,
              ),
              const Text(
                'VELOCITEK',
                style: kTitleText,
                textAlign: TextAlign.center,
              ),
              const Text(
                '.VTK FILE CONVERTER',
                style: kTitleText,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30.0,
              ),
              Container(
                height: 4.0,
                width: 128.0,
                color: kBlue,
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                '\nLet\'s get Started!',
                style: kSubtitleText,
              ),
              const SizedBox(
                height: 30.0,
              ),
              const SizedBox(
                width: 900.0,
                child: Text(
                  'Connect your Velocitek device via USB to your computer. Then select or drop your VTK file to this window to use our converter.',
                  style: kSubtitleText,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              ElevatedButton(
                style: kButtonStyle,
                onPressed: () async {
                  //File upload widget.
                  await uploadFile(context);
                },
                child: const Text('UPLOAD VTK FILE', style: kButtonText),
              ),
              const SizedBox(
                height: 80.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
