import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../model/logs_model.dart';
import '../../storage/storage.dart';
import '../project_custom_colors.dart';
import '../project_paddings.dart';
import '../project_text_styles.dart';

class ChartsWidget extends StatelessWidget {
  const ChartsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProjectPaddings().only_rL,
      child: Column(
        children: [
          Card(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: ProjectPaddings().only_lT_45_30,
                child: Text(
                  "Sales Report",
                  style: ProjectTextStyles().darkBlue_w600_s24,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(40.0),
                child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    primaryYAxis: NumericAxis(isVisible: false),
                    series: <ChartSeries<Logs, String>>[
                      SplineSeries<Logs, String>(
                          color: ProjectCustomColors().customPurple,
                          // Bind data source
                          dataSource: deviceLogs,
                          xValueMapper: (Logs logs, _) =>
                              logs.time!.day.toString(),
                          yValueMapper: (Logs logs, _) => logs.humidity,
                          name: "Humidity"),
                      SplineSeries<Logs, String>(
                          color: ProjectCustomColors().customPalePurple2,
                          // Bind data source
                          dataSource: deviceLogs,
                          xValueMapper: (Logs logs, _) =>
                              logs.time!.day.toString(),
                          yValueMapper: (Logs logs, _) => logs.water,
                          name: "Water"),
                    ]),
              ),
            ],
          )),
          SizedBox(
            height: 100,
          ),
          Card(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: ProjectPaddings().only_lT_45_30,
                child: Text(
                  "Store Traffic",
                  style: ProjectTextStyles().darkBlue_w600_s24,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(40.0),
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(isVisible: true),
                  primaryYAxis: CategoryAxis(isVisible: false),
                  series: <ChartSeries<Logs, String>>[
                    StackedColumnSeries(
                        color: ProjectCustomColors().customPurple,
                        dataSource: deviceLogs,
                        xValueMapper: (Logs logs, _) =>
                            logs.time!.day.toString(),
                        yValueMapper: (Logs logs, _) => logs.humidity,
                        name: 'Humidity'),
                    StackedColumnSeries(
                        color: ProjectCustomColors().customPalePurple2,
                        dataSource: deviceLogs,
                        xValueMapper: (Logs logs, _) =>
                            logs.time!.day.toString(),
                        yValueMapper: (Logs logs, _) => logs.water,
                        name: 'Water'),
                  ],
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
