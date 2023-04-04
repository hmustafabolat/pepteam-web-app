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
      body: _dasboardPageWidget(),
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
                  ElevatedButton(
                      onPressed: () {
                        print("test");
                        _dashboardViewModel.getAlarms();
                      },
                      child: Text("Buna bas")),
                  _containerWidget1(),
                  _containerWidget2(),
                  _containerWidget3(),
                ],
              ),
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
