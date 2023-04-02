import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ss_test/model/user_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  signIn(String? uid) async {
    try {
      var user = await _firestore.collection('Users').doc('User1').get();
      return UserModel.fromJson(user);
    } catch (e) {
      print('Error: FirestoreService: signIn: ${e.toString()}');
      return null;
    }
  }
}
