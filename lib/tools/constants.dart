import 'package:flutter/material.dart';

const kBlue = Color(0xFF4890FB);
const kBlue2 = Color(0xFF497CC1);
const kDarkBlue = Color(0xFF10253E);
const kOrange = Color(0xFFD7A500);
const kWhite = Colors.white;
const kBlack = Colors.black;

const kTitleText = TextStyle(
  fontSize: 64.0,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.bold,
  color: kWhite,
);
const kWarningText = TextStyle(
  fontSize: 16.0,
  fontFamily: 'Roboto',
  color: kWhite,
);

const kSubtitleText = TextStyle(
  fontSize: 24.0,
  color: kWhite,
);

const kButtonText = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.w600,
  color: kWhite,
);

const kTextfieldFont = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.w600,
  color: kBlack,
);

const kDescriptionTitle = TextStyle(
  fontSize: 36.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'Roboto',
  color: kBlack,
);

const kDescriptionText = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.normal,
  color: kBlack,
);

const kReupload = TextStyle(
  fontSize: 16.0,
  color: kBlue,
);

final kButtonStyle = ElevatedButton.styleFrom(
  elevation: 0.0,
  padding: const EdgeInsets.symmetric(vertical: 28),
  fixedSize: const Size.fromWidth(250.0),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(45),
  ),
);

final kButtonCSV = kButtonStyle.copyWith(
  backgroundColor: MaterialStateProperty.all(kOrange),
);

final kButtonGPX = kButtonStyle.copyWith(
  backgroundColor: MaterialStateProperty.all(kBlue2),
);

// final kCancelButtonStyle = ElevatedButton.styleFrom(
//   side: const BorderSide(color: kBlue, width: 3.0),
//   backgroundColor: kWhite,
//   elevation: 0.0,
//   padding: const EdgeInsets.symmetric(vertical: 30),
//   fixedSize: const Size.fromWidth(250.0),
//   shape: RoundedRectangleBorder(
//     borderRadius: BorderRadius.circular(30),
//   ),
// );
