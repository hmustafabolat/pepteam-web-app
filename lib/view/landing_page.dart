import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ss_test/view/dashboard_page.dart';
import 'package:ss_test/view/login_screen.dart';
import 'package:ss_test/viewModel/auth_viewModel.dart';

class LandingPage extends StatelessWidget {
  final AuthViewModel _authViewModel = AuthViewModel();

  LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_authViewModel.userModel.value?.id != null) {
        return DashboardPage();
      } else {
        return LoginScreen();
      }
    });
  }
}
