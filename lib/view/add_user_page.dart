import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ss_test/constants/project_custom_colors.dart';
import 'package:ss_test/constants/project_images.dart';
import 'package:ss_test/constants/project_paddings.dart';
import 'package:ss_test/view/dashboard_page.dart';
import 'package:ss_test/view/user_editing_page.dart';
import 'package:ss_test/viewModel/auth_viewModel.dart';

import '../constants/project_text_styles.dart';
import '../constants/text_field_input_decorations.dart';
import 'password_update_page.dart';
import 'users_page.dart';

class UserAddPage extends StatefulWidget {
  UserAddPage({super.key});

  @override
  State<UserAddPage> createState() => _UserAddPageState();
}

class _UserAddPageState extends State<UserAddPage> {
  final AuthViewModel _controller = Get.put(AuthViewModel());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

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
                    Get.back(); //Get.to kullanınca Stream hatası alıyorum!!!
                  },
                  child: Text("Dashboard"),
                ),
                SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                    onPressed: () {
                      Get.to(UsersPage());
                    },
                    child: Text("Users")),
                SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                    onPressed: () {
                      Get.to(PasswordUpdate());
                    },
                    child: Text("Update Password")),
                SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                    onPressed: () {
                      UserEditingPage();
                    },
                    child: Text("Edit User"))
              ],
            ),
            SizedBox(width: 110),
            Form(
                key: _controller.signUpFormGlobalKey,
                child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kullanıcı Düzenle',
                          style: ProjectTextStyles().darkGrey_w500_s14,
                        ),
                        SizedBox(height: 5),
                        Text(
                            'Lütfen düzenlemek istediğiniz kullanıcı bilgilerini girin.',
                            style: ProjectTextStyles().grey_w400_s14),
                        SizedBox(height: 20),
                        Container(
                          height: 1,
                          color: Colors.grey[300],
                        ),
                        SizedBox(height: 25),
                        Text('Adı Soyadı'),
                        SizedBox(height: 5),
                        TextFormField(
                          // onSaved: (value) {
                          //   _viewModel.password = value;
                          // },
                          controller: _nameController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecorators().FullNameInput,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) => value != null && value.length < 1
                              ? 'Ad, soyad giriniz'
                              : null,
                        ),
                        SizedBox(height: 20),
                        Text('Şifre'),
                        SizedBox(height: 5),
                        TextFormField(
                          // onSaved: (value) {
                          //   _viewModel.password = value;
                          // },
                          controller: _passwordController,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecorators().PasswordInput,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) => value != null && value.length < 8
                              ? 'Min. 8 karakter'
                              : null,
                        ),
                        SizedBox(height: 5),
                        Text('Şifre 8 karakterden uzun olmalıdır.',
                            style: ProjectTextStyles().grey_w400_s14),
                        SizedBox(height: 20),
                        Text('Mail Adresi'),
                        SizedBox(height: 5),
                        TextFormField(
                          // onSaved: (value) {
                          //   _viewModel.password = value;
                          // },
                          controller: _emailController,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecorators().EmailInput,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (email) =>
                          email != null && !EmailValidator.validate(email)
                              ? 'Geçerli bir email giriniz'
                              : null,
                        ),
                        SizedBox(height: 45),
                        SizedBox(
                          width: double.maxFinite,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
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
                                      Get.back();
                                      _controller.signUp(
                                        _emailController.text.trim(),
                                        _passwordController.text.trim(),
                                        _nameController.text.trim(),
                                      );
                                    },
                                    child: Text('Kullanıcı Ekle'))
                              ]),
                        )
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
