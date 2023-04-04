import 'dart:developer';

import 'package:ss_test/model/user_model.dart';
import 'package:ss_test/service/auth_service.dart';
import 'package:ss_test/service/firestore_service.dart';

class AuthRepository {
  final AuthService _authService = AuthService();
  final FirestoreService _firestoreService = FirestoreService();

  Future<UserModel?> signIn(String email, String password) async {
    //bu fonksiyon sadece aktarma yapıyor
    log("repository signIn");
    UserModel? signedUser = await _authService.signIn(email, password);
    if (signedUser != null) {
      log("if içi");
      /* return await _firestoreService.signIn(signedUser.id); */
    }
    return signedUser;
  }

  Future<UserModel?> signOut() async {
    return await _authService.signOut();
  }

  currentUser() async {
    return await _authService.currentUser();
  }
}
