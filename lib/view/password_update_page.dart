import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ss_test/constants/project_custom_colors.dart';
import 'package:ss_test/constants/project_images.dart';
import 'package:ss_test/constants/project_paddings.dart';

import '../constants/project_text_styles.dart';
import '../constants/text_field_input_decorations.dart';
import 'add_user_page.dart';
import 'user_editing_page.dart';
import 'users_page.dart';

class PasswordUpdate extends StatefulWidget {
  const PasswordUpdate({super.key});

  @override
  State<PasswordUpdate> createState() => _PasswordUpdateState();
}

class _PasswordUpdateState extends State<PasswordUpdate> {
  int _selectedIndex = 0;
  List<String> _buttonNames = ['Dashboard', 'Users', 'Kullanıcı Ekle'];
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
          ],
        ),
        actions: [
          ElevatedButton(onPressed: () {}, child: Text("")),
          IconButton(
              onPressed: () {},
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
          )
        ],
      ),
      body: Padding(
        padding: ProjectPaddings().only_lTR_125_50_125,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 40),
                    child: Text("Dashboard"),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                    onPressed: () {
                      Get.to(UserAddPage());
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 45),
                      child: Text("Add User"),
                    )),
                SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                    onPressed: () {
                      Get.to(UserEditingPage());
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 45),
                      child: Text("Edit User"),
                    )),
                SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                    onPressed: () {
                      Get.to(UsersPage());
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 40),
                      child: Text("Users Page"),
                    )),
              ],
            ),
            SizedBox(width: 110),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Şifre',
                  style: ProjectTextStyles().darkGrey_w500_s14,
                ),
                SizedBox(height: 5),
                Text(
                    'Şifrenizi değiştirmek için lütfen mevcut şifrenizi giriniz.',
                    style: ProjectTextStyles().grey_w400_s14),
                SizedBox(height: 20),
                Container(
                  height: 1,
                  color: Colors.grey[300],
                ),
                SizedBox(height: 25),
                Text('Geçerli Şifre'),
                SizedBox(height: 5),
                TextFormField(
                  // onSaved: (value) {
                  //   _viewModel.password = value;
                  // },
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecorators().PasswordInput,
                ),
                SizedBox(height: 20),
                Text('Yeni Şifre'),
                SizedBox(height: 5),
                TextFormField(
                  // onSaved: (value) {
                  //   _viewModel.password = value;
                  // },
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecorators().PasswordInput,
                ),
                SizedBox(height: 5),
                Text('Şifre 8 karakterden uzun olmalıdır.',
                    style: ProjectTextStyles().grey_w400_s14),
                SizedBox(height: 20),
                Text('Yeni Şifre'),
                SizedBox(height: 5),
                TextFormField(
                  // onSaved: (value) {
                  //   _viewModel.password = value;
                  // },
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecorators().PasswordInput,
                ),
                SizedBox(height: 45),
                SizedBox(
                  width: double.maxFinite,
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          'İptal',
                          style: ProjectTextStyles().darkGrey_w500_s14,
                        )),
                    SizedBox(width: 10),
                    ElevatedButton(
                        onPressed: () {}, child: Text('Şifreyi Güncelle'))
                  ]),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
