import 'package:flutter/material.dart';
import '../tools/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingSpinner extends StatelessWidget {
  const LoadingSpinner({super.key});

  @override
  Widget build(BuildContext context) {
    return const SpinKitCircle(
      color: kWhite,
      size: 80.0,
    );
  }
}
