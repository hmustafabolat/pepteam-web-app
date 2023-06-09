import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ss_test/constants/project_custom_colors.dart';
import 'package:ss_test/constants/project_images.dart';
import 'package:ss_test/constants/project_paddings.dart';
import 'package:ss_test/view/dashboard_page.dart';
import 'package:ss_test/viewModel/change_password_viewModel.dart';

import '../constants/project_text_styles.dart';
import '../constants/text_field_input_decorations.dart';
import '../viewModel/auth_viewModel.dart';
import 'add_user_page.dart';
import 'login_screen.dart';
import 'user_editing_page.dart';
import 'users_page.dart';

class PasswordUpdate extends StatefulWidget {
  const PasswordUpdate({super.key});

  @override
  State<PasswordUpdate> createState() => _PasswordUpdateState();
}

class _PasswordUpdateState extends State<PasswordUpdate> {
  final ChangePasswordViewModel _changePasswordViewModel =
  Get.put(ChangePasswordViewModel());
  int _selectedIndex = 0;
  List<String> _buttonNames = ['Dashboard', 'Users', 'Kullanıcı Ekle'];
  @override
  Widget build(BuildContext context) {
    return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Şifre',
                  style: ProjectTextStyles().darkBlue_w600_s24,
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
                  controller: _changePasswordViewModel.currentPasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecorators().PasswordInput,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                  value != null && value.length < 8
                      ? 'Minimum 8 karakter giriniz'
                      : null,
                ),
                SizedBox(height: 20),
                Text('Yeni Şifre'),
                SizedBox(height: 5),
                TextFormField(
                  controller: _changePasswordViewModel.newPasswordController,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecorators().PasswordInput,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                  value != null && value.length < 8
                      ? 'Minimum 8 karakter giriniz'
                      : null,
                ),
                SizedBox(height: 5),
                Text('Şifre 8 karakterden uzun olmalıdır.',
                    style: ProjectTextStyles().grey_w400_s14),
                SizedBox(height: 20),
                Text('Yeni Şifre'),
                SizedBox(height: 5),
                TextFormField(
                  obscureText: true,
                  controller: _changePasswordViewModel.confirmPasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecorators().PasswordInput,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                  value != null && value.length < 8
                      ? 'Minimum 8 karakter giriniz'
                      : null,
                ),
                SizedBox(height: 45),
                SizedBox(
                  width: double.maxFinite,
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    OutlinedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          'İptal',
                          style: ProjectTextStyles().darkGrey_w500_s14,
                        )),
                    SizedBox(width: 10),
                    ElevatedButton(
                        onPressed: () {
                          _changePasswordViewModel.changePassword();
                        }, child: Text('Şifreyi Güncelle'))
                  ]),
                )
              ],

    );
  }
}

class RouteButtons extends StatelessWidget {
  const RouteButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            Get.to(DashboardPage());
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40),
            child: Text("Dashboard",style: TextStyle(color: Colors.grey[600])),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        TextButton(
            onPressed: () {
              Get.to(UserAddPage());
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 45),
              child: Text("Add User",style: TextStyle(color: Colors.grey[600])),
            )),
        SizedBox(
          height: 25,
        ),
        TextButton(
            onPressed: () {
              Get.to(UserEditingPage());
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 45),
              child: Text("Edit User",style: TextStyle(color: Colors.grey[600])),
            )),
        SizedBox(
          height: 25,
        ),
        TextButton(
            onPressed: () {
              Get.to(UsersPage());
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40),
              child: Text("Users Page",style: TextStyle(color: Colors.grey[600])),
            )),
      ],
    );
  }
}
