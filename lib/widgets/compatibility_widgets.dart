import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import '../models/service_list.dart';
import '../tools/constants.dart';

class TopRow extends StatelessWidget {
  const TopRow({
    super.key,
    required this.widgetText,
  });
  final String widgetText;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kChartBlue,
      height: 60.0,
      width: 105.0,
      child: Center(
          child: Text(widgetText,
              style: kChartLabels, textAlign: TextAlign.center)),
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
        HyperLink(
          serviceText: data.serviceText,
          serviceLink: data.serviceLink,
        ),
        Container(
          height: 60.0,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: kChartGrid,
                width: 2.0,
              ),
            ),
          ),
          child: Row(children: [
            CheckIcon(
              checkBool: data.vtk,
              iconColor: kBlue,
              iconType: Icons.check_circle,
            ),
            CheckIcon(
              checkBool: data.gpx,
              iconColor: kOrange,
              iconType: Icons.check_circle,
            ),
            CheckIcon(
              checkBool: data.csv,
              iconColor: kBlue2,
              iconType: Icons.check_circle,
            ),
            CheckIcon(
              checkBool: data.paidService,
              iconColor: Colors.green,
              iconType: Icons.monetization_on,
            ),
          ]),
        ),
      ],
    );
  }
}

class HyperLink extends StatelessWidget {
  const HyperLink(
      {super.key, required this.serviceText, required this.serviceLink});
  final String serviceText;
  final String serviceLink;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      child: Container(
        color: kChartBlue,
        width: 180.0,
        height: 60.0,
        child: Center(
          child: SizedBox(
            height: 40.0,
            width: 140.0,
            child: Link(
              target: LinkTarget.blank,
              uri: Uri.parse(serviceLink),
              builder: (context, followLink) => ElevatedButton(
                onPressed: followLink,
                child: Text(
                  serviceText,
                  style: kChartLinks,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CheckIcon extends StatelessWidget {
  const CheckIcon(
      {super.key,
      required this.checkBool,
      required this.iconColor,
      required this.iconType});
  final bool checkBool;
  final Color iconColor;
  final IconData iconType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 105.0,
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (checkBool)
            Icon(
              iconType,
              color: iconColor,
              size: 40.0,
            ),
        ],
      )),
    );
  }
}
