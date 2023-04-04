import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ss_test/model/user_model.dart';
import 'package:ss_test/repository/auth_repository.dart';

class AuthViewModel extends GetxController {
  final AuthRepository _repository = Get.find();
  final Rx<UserModel?> userModel = UserModel().obs;

  final signInFormGlobalKey = GlobalKey<FormState>();
  String? email, password;

  Future<bool> signIn() async {
    bool flag = false;
    if (signInFormGlobalKey.currentState!.validate()) {
      signInFormGlobalKey.currentState!.save();
      userModel.value = await _repository.signIn(email!, password!);
      if (userModel.value?.id != null) {
        log("sign in başarılı true dönüyor");
        flag = true;
      }
    }
    return flag;
  }

  Future signOut() async {
    userModel.value = (await _repository.signOut())!;
  }

  Future currentUser() async {
    userModel.value = await _repository.currentUser();
  }
}
