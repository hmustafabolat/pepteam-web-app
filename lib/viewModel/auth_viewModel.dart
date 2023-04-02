import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ss_test/model/user_model.dart';
import 'package:ss_test/repository/auth_repository.dart';
import 'package:ss_test/view/landing_page.dart';


class AuthViewModel extends GetxController {
  final AuthRepository _repository = Get.find();
  final Rx<UserModel?> userModel = UserModel().obs;

  final signInFormGlobalKey = GlobalKey<FormState>();
  String? email, password;

  Future<UserModel?> signIn() async {
    if (signInFormGlobalKey.currentState!.validate()) {
      signInFormGlobalKey.currentState!.save();
      userModel.value =
          await _repository.signIn(UserModel(email: email, password: password));
    Get.to(LandingPage());
    }
  }

  Future signOut() async {
    userModel.value = (await _repository.signOut())!;
  }

  Future currentUser() async {
    userModel.value = await _repository.currentUser();
  }
}
