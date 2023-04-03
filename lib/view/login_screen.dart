import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ss_test/constants/project_custom_colors.dart';
import 'package:ss_test/constants/project_images.dart';
import 'package:ss_test/constants/project_paddings.dart';
import 'package:ss_test/constants/project_text_styles.dart';
import 'package:ss_test/constants/text_field_input_decorations.dart';
import 'package:ss_test/view/home.dart';
import 'package:ss_test/viewModel/auth_viewModel.dart';

import 'forgot_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthViewModel _viewModel = AuthViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: ProjectPaddings().only_top_95,
        child: Center(
          child: SizedBox(
            width: 450,
            child: Column(
              children: [
                Image.asset(PngImage().contentIcon),
                SizedBox(height: 25),
                Text('Giriş', style: ProjectTextStyles().darkBlue_w600_s30),
                SizedBox(height: 15),
                Text('Tekrar hoşgeldiniz! Lütfen bilgilerinizi giriniz.'),
                SizedBox(height: 35),
                Form(
                    key: _viewModel.signInFormGlobalKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email'),
                        SizedBox(height: 5),
                        TextFormField(
                          onSaved: (value) {
                            _viewModel.email = value;
                          },
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecorators().EmailInput,
                        ),
                        SizedBox(height: 20),
                        Text('Şifre'),
                        SizedBox(height: 5),
                        TextFormField(
                          onSaved: (value) {
                            _viewModel.password = value;
                          },
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecorators().EmailInput,
                        ),
                      ],
                    )),
                SizedBox(height: 25),
                SizedBox(
                  width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            Get.to(ForgotPassword());
                          },
                          child: Text('Şifremi Unuttum')),
                      SizedBox(height: 25),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: ProjectCustomColors().customPurple,
                              minimumSize: Size(double.maxFinite, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          onPressed: () {
                            Get.to(Home());
                          },
                          child: Text('Giriş Yap',
                              style: ProjectTextStyles().white_w500_s15)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
