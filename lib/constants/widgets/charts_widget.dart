import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../model/logs_model.dart';
import '../../storage/storage.dart';
import '../project_custom_colors.dart';
import '../project_paddings.dart';
import '../project_text_styles.dart';

class ChartsWidget extends StatelessWidget {
  ChartsWidget({super.key});
  TooltipBehavior? _tooltipBehavior;
  ZoomPanBehavior? _zoomPanBehavior;
  TrackballBehavior? _trackballBehavior;

  @override
  void initState() {
    _trackballBehavior = TrackballBehavior(
        enable: true,
        markerSettings: TrackballMarkerSettings(
            markerVisibility: TrackballVisibilityMode.visible),
        tooltipDisplayMode: TrackballDisplayMode.floatAllPoints,
        tooltipSettings: InteractiveTooltip(enable: true, color: Colors.red),
        activationMode: ActivationMode.singleTap);
    _tooltipBehavior = TooltipBehavior(enable: true);
    _zoomPanBehavior = ZoomPanBehavior(enableDoubleTapZooming: true);
  }

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
                  "Humidity",
                  style: ProjectTextStyles().darkBlue_w600_s24,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(40.0),
                child: SfCartesianChart(
                    trackballBehavior: _trackballBehavior,
                    zoomPanBehavior: _zoomPanBehavior,
                    primaryXAxis: CategoryAxis(),
                    primaryYAxis: NumericAxis(isVisible: true),
                    series: <ChartSeries<Logs, String>>[
                      LineSeries<Logs, String>(
                          dataLabelSettings: DataLabelSettings(isVisible: true),
                          color: ProjectCustomColors().customPurple,
                          dataSource: deviceLogs,
                          markerSettings: MarkerSettings(isVisible: true),
                          xValueMapper: (Logs logs, _) =>
                              logs.time!.toString().split(" ")[0],
                          yValueMapper: (Logs logs, _) => logs.Humidity,
                          sortingOrder: SortingOrder.ascending,
                          sortFieldValueMapper: (Logs logs, _) =>
                              logs.time!.toString(),
                          name: "Humidity"),
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
                  "Water",
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
                        dataLabelSettings: DataLabelSettings(isVisible: true),
                        markerSettings: MarkerSettings(isVisible: true),
                        color: ProjectCustomColors().customPalePurple2,
                        dataSource: deviceLogs,
                        xValueMapper: (Logs logs, _) =>
                            logs.time!.toString().split(" ")[0],
                        yValueMapper: (Logs logs, _) => logs.water,
                        sortingOrder: SortingOrder.ascending,
                        sortFieldValueMapper: (Logs logs, _) =>
                            logs.time!.toString(),
                        name: "Water"),
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
