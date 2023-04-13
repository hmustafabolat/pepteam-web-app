import 'dart:developer';

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
import 'package:ss_test/model/alarm_model.dart';
import 'package:ss_test/storage/storage.dart';
import 'package:ss_test/view/user_editing_page.dart';
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
  final DashboardViewModel controller3 = Get.put(DashboardViewModel());
  final DashboardViewModel controller = Get.put(DashboardViewModel());
  final DashboardViewModel controller2 = Get.put(DashboardViewModel());


  final dateFormat = DateFormat('dd.MM.yyyy');

  int _selectedIndex = 0;
  List<String> _buttonNames = ['Dashboard', 'Users'];
  Device? selectedOption;

  String? selectedId;

  void onSelectedIdChanged(String? value) {
    setState(() {
      selectedId = value;
      controller.getPump(selectedId!);
    });
    log('fonksiyon içi');
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
                        : Color.fromARGB(0, 255, 255,
                            255), // seçili olmayan butonların rengi
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
                              DropButton(onSelectedIdChanged: onSelectedIdChanged),
                              MyDropDownButton()
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
                            "${selectedOption ?? ""}",
                            style: ProjectTextStyles().darkBlue_w600_s24,
                          ),
                          ElevatedButton(onPressed: (){

                            print(selectedDevice.id);
                            print(selectedDevice.deviceName);
                            print('sdfsdgs');
                          }, child: Text('elevated')),

                          Text(
                            selectedId ?? 'No device selected',
                            style: ProjectTextStyles().darkBlue_w600_s24,
                          ),
                          SizedBox(
                            height: 60,
                          ),
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
                                        } else if (pumpState == 'decativated') {
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
                                  stream: controller2.alarmModelStream,
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
                                            'decativated') {
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
