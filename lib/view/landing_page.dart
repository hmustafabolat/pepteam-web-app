import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ss_test/main.dart';
import 'package:ss_test/view/forgot_password.dart';
import 'package:ss_test/viewModel/auth_viewModel.dart';


class LandingPage extends StatelessWidget {
  LandingPage({Key? key}) : super(key: key);
  final AuthViewModel _authViewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_authViewModel.userModel.value?.id == null) {
        return ForgotPassword();
      } else {
        return MyApp();
      }
    });
  }
}
