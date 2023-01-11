import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/download_list.dart';
import '../tools/constants.dart';
import '../widgets/compatibility_chart.dart';
import '../widgets/description_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                Container(
                  color: kDarkBlue,
                  height: 650.0,
                  width: 1200.0,
                  child: Provider.of<DownloadList>(context, listen: true)
                      .pageSelector,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 600.0,
                      child: Center(
                        child: SizedBox(
                          width: 500.0,
                          child: DescriptionBlock(),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 600.0,
                      child: Center(
                        child: Column(
                          children: const [
                            SizedBox(
                              height: 120.0,
                              child: Center(
                                child: Text(
                                  "REPLAY COMPATIBILITY CHART",
                                  style: kChartTitle,
                                ),
                              ),
                            ),
                            Material(
                              elevation: 12,
                              child: CompatibilityChart(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
