import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ss_test/model/user_model.dart';
import 'package:ss_test/repository/auth_repository.dart';

class AuthViewModel extends GetxController {
  final AuthRepository _repository = Get.find();
  final Rx<UserModel?> userModel = UserModel().obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestoreService = FirebaseFirestore.instance;

  final signInFormGlobalKey = GlobalKey<FormState>();
  final signUpFormGlobalKey = GlobalKey<FormState>();

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

  Future<void> signUp(String email, String password, String name) async {
    final isValid = signUpFormGlobalKey.currentState!.validate();
    if (!isValid) return;
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('User created: ${userCredential.user}');
      await _firestoreService
          .collection('Users')
          .doc(userCredential.user!.uid)
          .set({
        'name': name,
        'id': userCredential.user!.uid,
        'email': email,
        'isAdmin': false
      });
    } on FirebaseAuthException catch (e) {
      print('Failed to create user: $e');
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      Get.snackbar(
        'Başarılı',
        'Parola sıfırlama e-postası gönderildi',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'Hata',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> updateUserProfile(String name, String email, String password) async {
    try {
      // Kullanıcının kimlik bilgilerini güncelleme
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.updateEmail(email);
        await user.updatePassword(password);
      }

      // Firestore verilerini güncelleme
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      DocumentReference docRef = firestore.collection('Users').doc(user!.uid);
      Map<String, dynamic> data = {'name': name, 'email': email};
      await docRef.update(data);
    } catch (e) {
      print('Hata oluştu: $e');
    }
  }

  Future signOut() async {
    userModel.value = (await _repository.signOut())!;
  }

  Future currentUser() async {
    userModel.value = await _repository.currentUser();
  }
}
