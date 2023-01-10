import 'package:flutter/material.dart';
import '../models/service_list.dart';
import '../tools/constants.dart';
import 'compatibility_widgets.dart';

class CompatibilityChart extends StatelessWidget {
  const CompatibilityChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: kChartBlue,
              height: 60.0,
              width: 180.0,
              child: const Center(
                child: Text(
                  "REPLAY\nSERVICE",
                  style: kChartLabels,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const TopRow(
              widgetText: "ACCEPTS\nVTK",
            ),
            const TopRow(
              widgetText: "ACCEPTS\nGPX",
            ),
            const TopRow(
              widgetText: "ACCEPTS\nCSV",
            ),
            const TopRow(
              widgetText: "PAID\nSERVICE",
            ),
          ],
        ),
        ServiceRow(
          data: ServiceList().getServiceData(0),
        ),
        ServiceRow(
          data: ServiceList().getServiceData(1),
        ),
        ServiceRow(
          data: ServiceList().getServiceData(2),
        ),
        ServiceRow(
          data: ServiceList().getServiceData(3),
        ),
        ServiceRow(
          data: ServiceList().getServiceData(4),
        ),
        ServiceRow(
          data: ServiceList().getServiceData(5),
        ),
        ServiceRow(
          data: ServiceList().getServiceData(6),
        ),
        ServiceRow(
          data: ServiceList().getServiceData(7),
        ),
        ServiceRow(
          data: ServiceList().getServiceData(8),
        ),
        ServiceRow(
          data: ServiceList().getServiceData(9),
        ),
        ServiceRow(
          data: ServiceList().getServiceData(10),
        ),
        ServiceRow(
          data: ServiceList().getServiceData(11),
        ),
        ServiceRow(
          data: ServiceList().getServiceData(12),
        ),
        ServiceRow(
          data: ServiceList().getServiceData(13),
        ),
        ServiceRow(
          data: ServiceList().getServiceData(14),
        ),
        ServiceRow(
          data: ServiceList().getServiceData(15),
        ),
        ServiceRow(
          data: ServiceList().getServiceData(16),
        ),
      ],
    );
  }
}
