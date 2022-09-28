import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../tools/constants.dart';

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
