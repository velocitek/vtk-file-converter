import 'package:flutter/material.dart';
import '../tools/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingSpinner extends StatelessWidget {
  const LoadingSpinner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SpinKitCircle(
      color: kWhite,
      size: 80.0,
    );
  }
}

void loadTime() async {
  await Future.delayed(const Duration(seconds: 3));
}
