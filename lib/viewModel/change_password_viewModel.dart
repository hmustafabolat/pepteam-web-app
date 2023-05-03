import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordViewModel extends GetxController {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  RxBool isLoading = false.obs;

  void changePassword() async {
    isLoading.value = true;
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        AuthCredential credential = EmailAuthProvider.credential(
            email: user.email!, password: currentPasswordController.text);
        await user.reauthenticateWithCredential(credential);

        if (newPasswordController.text == confirmPasswordController.text) {
          await user.updatePassword(newPasswordController.text);
          Get.snackbar('Success', 'Password updated successfully');
        } else {
          Get.snackbar('Error', 'Passwords do not match');
        }
      } else {
        Get.snackbar('Error', 'User not found');
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'The current password provided is incorrect';
      } else {
        errorMessage = 'An error occurred while changing password';
      }
      Get.snackbar('Error', errorMessage);
    } finally {
      isLoading.value = false;
    }
  }
}
