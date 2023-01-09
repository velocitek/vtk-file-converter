import 'package:flutter/material.dart';
import '../tools/constants.dart';
import '../models/service_list.dart';

class CompatibilityChart extends StatelessWidget {
  const CompatibilityChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: kDarkBlue,
          child: const Text(
            "REPLAY\nSERVICE",
            style: kWarningText,
            textAlign: TextAlign.center,
          ),
        ),
        const TopRow(
          widgetText: "ACCEPTS VTK",
        ),
        const TopRow(
          widgetText: "ACCEPTS GPX",
        ),
        const TopRow(
          widgetText: "ACCEPTS CSV",
        ),
        const TopRow(
          widgetText: "PAID SERVICE",
        ),
      ],
    );
  }
}

class TopRow extends StatelessWidget {
  const TopRow({
    super.key,
    required this.widgetText,
  });
  final String widgetText;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kDarkBlue,
      width: 70.0,
      child: Text(widgetText, style: kWarningText, textAlign: TextAlign.center),
    );
  }
}

class ServiceRow extends StatelessWidget {
  const ServiceRow({super.key, required this.data});
  final ServiceData data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: kBlue,
          child: Text(data.serviceText),
        )
      ],
    );
  }
}
