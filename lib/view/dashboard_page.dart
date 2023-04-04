import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ss_test/constants/project_custom_colors.dart';
import 'package:ss_test/constants/project_images.dart';
import 'package:ss_test/constants/project_paddings.dart';
import 'package:ss_test/view/user_editing_page.dart';
import 'package:ss_test/viewModel/dashboard_viewModel.dart';
import '../constants/project_text_styles.dart';
import '../constants/text_field_input_decorations.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final DashboardViewModel _dashboardViewModel = DashboardViewModel();
  int _selectedIndex = 0;
  List<String> _buttonNames = ['Dashboard', 'Users'];

  @override
  Widget build(BuildContext context) {
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
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(PngImage().contentIcon),
            SizedBox(width: 10),
            SvgPicture.asset(
              SvgImage().untitledUiText,
              color: Colors.white,
            ),
            SizedBox(width: 30),
            ToggleButtons(
              selectedColor: Colors.white,
              renderBorder: false,
              children: _buttonNames.map((name) {
                return ElevatedButton(
                  onPressed: () {
                    int index = _buttonNames.indexOf(name);
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  child: Text(name),
                  style: ElevatedButton.styleFrom(
                    primary: _selectedIndex == _buttonNames.indexOf(name)
                        ? ProjectCustomColors()
                            .customPalePurple // seçili butonun rengi
                        : Colors.transparent, // seçili olmayan butonların rengi
                    elevation: 0,
                  ),
                );
              }).toList(),
              isSelected: List.generate(_buttonNames.length, (index) {
                return _selectedIndex == index;
              }),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(UserEditingPage());
              },
              icon: SvgPicture.asset(
                SvgImage().settingsIcon,
                color: Colors.white,
              )),
          GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              backgroundImage: NetImage().userImage,
              radius: 25,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _dasboardPageWidget(),
            Padding(
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
                                  color:
                                      ProjectCustomColors().customPalePurple2,
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
            )
          ],
        ),
      ),
    );
  }

  Padding _dasboardPageWidget() {
    return Padding(
      padding: ProjectPaddings().only_lTR_125_50_125,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Analysis",
                style: ProjectTextStyles().darkBlue_w600_s30,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Sensor Datas",
                style: ProjectTextStyles().grey_w400_s12,
              ),
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _containerWidget1(),
                  _containerWidget2(),
                  _containerWidget3(),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    print("test");
                    _dashboardViewModel.getAlarms();
                  },
                  child: Text("Buna bas")),
            ]),
          ),
        ],
      ),
    );
  }

  Container _containerWidget3() {
    return Container(
      width: 450,
      height: 130,
      decoration: BoxDecoration(
          border:
              Border.all(width: 2, color: ProjectCustomColors().customGrey2),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: ProjectPaddings().only_lT,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Avg. Order Value",
                  style: ProjectTextStyles().black_w400_s12,
                ),
                Text(
                  "91,42",
                  style: ProjectTextStyles().darkBlue_w600_s30,
                ),
              ],
            ),
            Padding(
              padding: ProjectPaddings().only_rT,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ProjectCustomColors().customRed,
                    ),
                    width: 55,
                    height: 25,
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_drop_up,
                          color: ProjectCustomColors().customRedText,
                        ),
                        Text(
                          "20%",
                          style: TextStyle(
                              color: ProjectCustomColors().customRedText),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _containerWidget2() {
    return Container(
      width: 450,
      height: 130,
      decoration: BoxDecoration(
          border:
              Border.all(width: 2, color: ProjectCustomColors().customGrey2),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: ProjectPaddings().only_lT,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Today's Orders",
                  style: ProjectTextStyles().black_w400_s12,
                ),
                Text(
                  "14",
                  style: ProjectTextStyles().darkBlue_w600_s30,
                ),
              ],
            ),
            Padding(
              padding: ProjectPaddings().only_rT,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ProjectCustomColors().customGreen,
                    ),
                    width: 55,
                    height: 25,
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_drop_up,
                          color: ProjectCustomColors().customGreenText,
                        ),
                        Text(
                          "12%",
                          style: TextStyle(
                              color: ProjectCustomColors().customGreenText),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _containerWidget1() {
    return Container(
      width: 450,
      height: 130,
      decoration: BoxDecoration(
          border:
              Border.all(width: 2, color: ProjectCustomColors().customGrey2),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: ProjectPaddings().only_lT,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Today's Revenue",
                  style: ProjectTextStyles().black_w400_s12,
                ),
                Text(
                  "1,290",
                  style: ProjectTextStyles().darkBlue_w600_s30,
                ),
              ],
            ),
            Padding(
              padding: ProjectPaddings().only_rT,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ProjectCustomColors().customGreen,
                    ),
                    width: 55,
                    height: 25,
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_drop_up,
                          color: ProjectCustomColors().customGreenText,
                        ),
                        Text(
                          "20%",
                          style: TextStyle(
                              color: ProjectCustomColors().customGreenText),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
