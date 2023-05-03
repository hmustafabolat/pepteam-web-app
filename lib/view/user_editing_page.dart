import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ss_test/constants/project_custom_colors.dart';
import 'package:ss_test/constants/project_images.dart';
import 'package:ss_test/constants/project_paddings.dart';
import 'package:ss_test/view/add_user_page.dart';
import 'package:ss_test/view/dashboard_page.dart';
import 'package:ss_test/view/users_page.dart';
import 'package:ss_test/viewModel/auth_viewModel.dart';

import '../constants/project_text_styles.dart';
import '../constants/text_field_input_decorations.dart';
import 'login_screen.dart';
import 'password_update_page.dart';

class UserEditingPage extends StatefulWidget {
  const UserEditingPage({super.key});

  @override
  State<UserEditingPage> createState() => _UserEditingPageState();
}

class _UserEditingPageState extends State<UserEditingPage> {
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
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                child: IconButton(
                  onPressed: () async {
                    final AuthViewModel _viewModel = Get.find();
                    await _viewModel.signOut();
                    Get.to(LoginScreen());
                  },
                  icon: Icon(Icons.person),
                ),
              ))
        ],
      ),
      body: Padding(
        padding: ProjectPaddings().only_lTR_125_50_125,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RouteButtons(),
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
                                  _controller.updateUserProfile(
                                    _nameController.text.trim(),
                                    _emailController.text.trim(),
                                    _passwordController.text.trim(),
                                  );
                                },
                                child: Text('Kullanıcı Bilgilerini Güncelle'))
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

class RouteButtons extends StatelessWidget {
  const RouteButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Get.to(DashboardPage());
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40),
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
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 45),
              child: Text("Add User"),
            )),
        SizedBox(
          height: 25,
        ),
        ElevatedButton(
            onPressed: () {
              Get.to(PasswordUpdate());
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 17),
              child: Text("Update Password"),
            )),
        SizedBox(
          height: 25,
        ),
        ElevatedButton(
            onPressed: () {
              Get.to(UsersPage());
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40),
              child: Text("Users Page"),
            )),
      ],
    );
  }
}
