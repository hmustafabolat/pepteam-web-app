import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ss_test/constants/project_custom_colors.dart';
import 'package:ss_test/constants/project_images.dart';
import 'package:ss_test/constants/project_paddings.dart';
import 'package:ss_test/constants/widgets/card_widget.dart';
import 'package:ss_test/constants/widgets/charts_widget.dart';
import 'package:ss_test/constants/widgets/dropDown_widget.dart';
import 'package:ss_test/constants/widgets/filter_widget.dart';
import 'package:ss_test/model/alarm_model.dart';
import 'package:ss_test/storage/storage.dart';
import 'package:ss_test/view/login_screen.dart';
import 'package:ss_test/view/user_editing_page.dart';
import 'package:ss_test/view/users_page.dart';
import 'package:ss_test/viewModel/auth_viewModel.dart';
import 'package:ss_test/viewModel/dashboard_viewModel.dart';
import '../constants/project_text_styles.dart';
import '../model/device_model.dart';
import '../model/pump_model.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final DashboardViewModel controller = Get.find();
  final dateFormat = DateFormat('dd.MM.yyyy');

  Device? selectedOption;
  String? selectedName;

  onSelectedIdChanged(Device? deviceValue) async {
    selectedOption = deviceValue;
    controller.getPump(selectedOption!.id);
    controller.getAlarm(selectedOption!.id);
    controller.getLogs(selectedOption!.id, selectedStartTime, selectedEndTime);

    selectedName = selectedOption!.deviceName;

    await Future.delayed(Duration(seconds: 1), () {
      setState(() {});
    });
  }

  void onSelectedTimeChanged(Device? deviceValue) async {
    selectedOption = deviceValue;
    controller.getLogs(selectedOption!.id, selectedStartTime, selectedEndTime);

    await Future.delayed(Duration(seconds: 1), () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Dashboard"),
                style: ElevatedButton.styleFrom(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    Get.offAll(() => UsersPage());
                  },
                  child: Text("Users")),
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
          CircleAvatar(
            child: IconButton(
              onPressed: () async {
                final AuthViewModel _viewModel = Get.find();
                await _viewModel.signOut();
                Get.to(LoginScreen());
              },
              icon: Icon(Icons.person),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: ProjectPaddings().only_lTR_125_50_125,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Analysis",
                                style: ProjectTextStyles().darkBlue_w600_s30,
                              ),
                              MyDropDownButton(
                                  selectedFunction: onSelectedIdChanged)
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Sensor Datas",
                            style: ProjectTextStyles().grey_w400_s12,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            selectedName ?? "Lütfen bir cihaz seçiniz!",
                            style: ProjectTextStyles().darkBlue_w600_s24,
                          ),
                          FilterPage(
                            selectedFunction: () =>
                                onSelectedTimeChanged(selectedOption),
                          ),
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CardWidget(),
                              CardWidgets(
                                itemTextState: "Pompa Durumu",
                                containerChildState: StreamBuilder<List<Pump>>(
                                  stream: controller.pumpModelStream,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    }

                                    if (!snapshot.hasData) {
                                      return Center(
                                          child: CircularProgressIndicator());
                                    }
                                    List<Pump> pumps = snapshot.data!;

                                    return ListView.builder(
                                      itemCount: pumps.length,
                                      itemBuilder: (context, index) {
                                        String pumpState =
                                            pumps[index].pumpState;
                                        DateTime time = pumps[index].time;

                                        if (pumpState == 'activated') {
                                          pumpState = 'Aktif';
                                        } else if (pumpState == 'deactivated') {
                                          pumpState = 'Pasif';
                                        }

                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              pumpState,
                                              style: ProjectTextStyles()
                                                  .darkBlue_w600_s30,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: ProjectCustomColors()
                                                      .customGreen,
                                                ),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        dateFormat.format(time),
                                                        style: TextStyle(
                                                            color: ProjectCustomColors()
                                                                .customGreenText),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                              CardWidgets(
                                itemTextState: "Alarm Durumu",
                                containerChildState: StreamBuilder<List<Alarm>>(
                                  stream: controller.alarmModelStream,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    }

                                    if (!snapshot.hasData) {
                                      return Center(
                                          child: CircularProgressIndicator());
                                    }
                                    List<Alarm> alarm = snapshot.data!;

                                    return ListView.builder(
                                      itemCount: alarm.length,
                                      itemBuilder: (context, index) {
                                        String? alarmState =
                                            alarm[index].alarmState;
                                        DateTime time = alarm[index].time;
                                        if (alarmState == 'activated') {
                                          alarmState = 'Aktif';
                                        } else if (alarmState ==
                                            'deactivated') {
                                          alarmState = 'Pasif';
                                        }

                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              alarm[index]
                                                  .alarmState
                                                  .toString(),
                                              style: ProjectTextStyles()
                                                  .darkBlue_w600_s30,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: ProjectCustomColors()
                                                        .customRed,
                                                  ),
                                                  child: Row(children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        dateFormat.format(time),
                                                      ),
                                                    )
                                                  ])),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          ChartsWidget(),
                        ]),
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
