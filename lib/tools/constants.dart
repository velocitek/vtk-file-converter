import 'package:flutter/material.dart';

const kTitleText = TextStyle(
  fontSize: 64.0,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w900,
  color: Colors.black,
);

const kSubtitleText = TextStyle(
  fontSize: 22.0,
  color: Colors.black,
);

const kButtonText = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w700,
  color: Colors.white,
);

const kCancelButtonText = TextStyle(
  fontSize: 15.0,
  fontWeight: FontWeight.w700,
  color: Colors.blue,
);

const kReupload = TextStyle(
  fontSize: 16.0,
  color: Colors.blue,
);

final kButtonStyle = ElevatedButton.styleFrom(
  elevation: 0.0,
  padding: const EdgeInsets.symmetric(vertical: 30),
  fixedSize: const Size.fromWidth(230.0),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(45),
  ),
);

final kCancelButtonStyle = ElevatedButton.styleFrom(
  side: const BorderSide(color: Colors.blue, width: 3.0),
  backgroundColor: Colors.white,
  elevation: 0.0,
  padding: const EdgeInsets.symmetric(vertical: 30),
  fixedSize: const Size.fromWidth(250.0),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30),
  ),
);
