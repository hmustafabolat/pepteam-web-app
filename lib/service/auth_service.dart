import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ss_test/model/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final UserModel _userModel = UserModel();

  Future<UserModel?> signIn(String email, String password) async {
    try {
      log("try içi");
      UserCredential user = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(user);
      if (user.user?.uid != null) {
        var doc =
            await _firestore.collection('Users').doc(user.user!.uid).get();
        log("uid : " + doc.id);
        log("cred id: " + user.user!.uid);
        UserModel tempUser =
            UserModel(email: doc["email"], name: doc["name"], id: doc.id);
        log(tempUser.id.toString());
        return tempUser;
      } else {
        print("uid boş");
        return null;
      }
    } catch (e) {
      print('Error: AuthService: signIn: ${e.toString()}');
      return null;
    }
  }

  Future<UserModel> signOut() async {
    await _auth.signOut();
    return UserModel();
  }

  currentUser() async {
    var user = _auth.currentUser;

    return await getUserFromFirestore(user?.uid);
  }

  getUserFromFirestore(String? userId) async {
    try {
      if (userId != null) {
        var doc = await _firestore.collection('Users').doc(userId).get();

        return UserModel.fromJson(doc);
      } else {
        return UserModel();
      }
    } catch (e) {
      print('Error: AuthService: signIn: ${e.toString()}');
      return UserModel();
    }
  }
}
