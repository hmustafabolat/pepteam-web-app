import 'package:ss_test/model/user_model.dart';
import 'package:ss_test/service/auth_service.dart';
import 'package:ss_test/service/firestore_service.dart';

class AuthRepository {
  final AuthService _authService = AuthService();
  final FirestoreService _firestoreService = FirestoreService();

  Future<UserModel?> signIn(UserModel userModel) async {
    //bu fonksiyon sadece aktarma yapıyor
    UserModel? signedUser = await _authService.signIn(userModel);
    if (signedUser != null) {
      return await _firestoreService.signIn(signedUser.id);
    }
  }

  Future<UserModel?> signOut() async {
    return await _authService.signOut();
  }

  currentUser() async {
    return await _authService.currentUser();
  }
}
