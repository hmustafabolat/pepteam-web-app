import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ss_test/constants/project_custom_colors.dart';
import 'package:ss_test/constants/project_images.dart';
import 'package:ss_test/constants/project_paddings.dart';
import 'package:ss_test/view/admin_detail_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  List<String> _buttonNames = [
    'Home',
    'Dashboard',
    'Projects',
    'Tasks',
    'Reporting',
    'Users'
  ];

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
              onPressed: (){},
              icon: SvgPicture.asset(SvgImage().settingsIcon, color: Colors.white,)),
          IconButton(
              onPressed: (){},
              icon: SvgPicture.asset(SvgImage().alarmIcon, color: Colors.white,)),

          GestureDetector(
            onTap: () {

            },
            child: CircleAvatar(
              backgroundImage: NetImage().userImage,
              radius: 25,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: ProjectPaddings().only_lTR_125_50_125,
        child: AdminDetailPage(),
      ),
    );
  }

}