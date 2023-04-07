import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../project_custom_colors.dart';
import '../project_paddings.dart';
import '../project_text_styles.dart';

class ChartData {
  ChartData(this.x, this.y, this.y2);
  final int? x;
  final int? y;
  final int? y2;
}

class ChartData2 {
  ChartData2(this.x, this.y1, this.y2);
  final String? x;
  final int? y1;
  final int? y2;
}

final List<ChartData> chartData = [
  ChartData(01, 35, 30),
  ChartData(02, 13, 10),
  ChartData(03, 34, 30),
  ChartData(04, 27, 20),
  ChartData(05, 40, 30),
  ChartData(06, 35, 28),
  ChartData(07, 13, 8),
  ChartData(08, 34, 28),
  ChartData(09, 27, 20),
  ChartData(10, 40, 32),
  ChartData(11, 35, 28),
  ChartData(12, 13, 8),
];
final List<ChartData2> chartData2 = [
  ChartData2('Jan', 12, 10),
  ChartData2(
    'Feb',
    14,
    11,
  ),
  ChartData2(
    'Mar',
    16,
    10,
  ),
  ChartData2(
    'Apr',
    18,
    16,
  ),
  ChartData2(
    'May',
    18,
    16,
  ),
  ChartData2(
    'Jun',
    18,
    16,
  ),
  ChartData2(
    'Jul',
    18,
    16,
  ),
  ChartData2(
    'Aug',
    18,
    16,
  ),
  ChartData2(
    'Sep',
    18,
    16,
  ),
  ChartData2(
    'Oct',
    18,
    16,
  ),
  ChartData2(
    'Nov',
    18,
    16,
  ),
  ChartData2(
    'Dec',
    18,
    16,
  ),
];

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
                    primaryXAxis: NumericAxis(
                      isVisible: true,
                      minimum: 1,
                      maximum: 12,
                    ),
                    primaryYAxis: NumericAxis(isVisible: false),
                    series: <ChartSeries>[
                      SplineSeries<ChartData, int>(
                          dataSource: chartData,
                          color: ProjectCustomColors().customPurple,
                          splineType: SplineType.cardinal,
                          cardinalSplineTension: 0.9,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y),
                      SplineSeries<ChartData, int>(
                          dataSource: chartData,
                          color: ProjectCustomColors().customPalePurple2,
                          splineType: SplineType.cardinal,
                          cardinalSplineTension: 0.9,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y2),
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
                  series: <ChartSeries>[
                    StackedColumnSeries<ChartData2, String>(
                      dataSource: chartData2,
                      color: ProjectCustomColors().customPurple,
                      xValueMapper: (ChartData2 data, _) => data.x!,
                      yValueMapper: (ChartData2 data, _) => data.y2!,
                    ),
                    StackedColumnSeries<ChartData2, String>(
                      dataSource: chartData2,
                      color: ProjectCustomColors().customPalePurple2,
                      xValueMapper: (ChartData2 data, _) => data.x!,
                      yValueMapper: (ChartData2 data, _) => data.y1!,
                    ),
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
