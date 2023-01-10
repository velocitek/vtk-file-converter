import 'package:flutter/material.dart';

const kBlue = Color(0xFF4890FB);
const kBlue2 = Color(0xFF497CC1);
const kDarkBlue = Color(0xFF10253E);
const kOrange = Color(0xFFD7A500);
const kWhite = Colors.white;
const kBlack = Colors.black;
const kChartBlue = Color(0xFF454F64);
const kChartGrid = Color(0xFF9BA3B4);

//Used for the big titles on the conversion app.
const kTitleText = TextStyle(
  fontSize: 64.0,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w700,
  color: kWhite,
);

//For the 3 files max warning
const kWarningText = TextStyle(
  fontSize: 16.0,
  fontFamily: 'Roboto',
  color: kWhite,
);

const kChartTitle = TextStyle(
  fontSize: 32.0,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w900,
  color: kBlack,
);

const kChartLabels = TextStyle(
  fontSize: 14.0,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w600,
  color: kWhite,
);

const kChartLinks = TextStyle(
  fontSize: 14.0,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w200,
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
  fontSize: 40.0,
  fontWeight: FontWeight.w900,
  fontFamily: 'Roboto',
  color: kBlack,
);

const kDescriptionText = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w500,
  color: kBlack,
);

const kLinkText = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w500,
  decoration: TextDecoration.underline,
  color: kBlue,
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
  backgroundColor: MaterialStateProperty.all(kBlue2),
);

final kButtonGPX = kButtonStyle.copyWith(
  backgroundColor: MaterialStateProperty.all(kOrange),
);
