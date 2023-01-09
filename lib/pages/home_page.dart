import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/download_list.dart';
import '../tools/constants.dart';
import '../widgets/compatibility_chart.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          SizedBox(
            height: 650.0,
            width: 1200.0,
            child:
                Provider.of<DownloadList>(context, listen: true).pageSelector,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 600.0,
                child: Center(
                    child: SizedBox(
                  width: 550.0,
                  child: Column(
                    children: const [
                      Text(".VTK, .GPX, AND .CSV?\nWHICH IS BEST FOR ME?",
                          style: kDescriptionTitle),
                      SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        "Utilizing a VTK file(s) or converting your files to GPX or CSV gives you the flexibility to view your data on many paid and unpaid platforms.",
                        style: kDescriptionText,
                      )
                    ],
                  ),
                )),
              ),
              SizedBox(
                width: 600.0,
                child: Center(
                  child: Column(
                    children: const [
                      Text(
                        "REPLAY COMPATIBILITY CHART",
                        style: kDescriptionTitle,
                      ),
                      CompatibilityChart(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
