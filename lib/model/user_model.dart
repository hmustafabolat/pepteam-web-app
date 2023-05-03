import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? name;
  String? surname;
  String? email;
  // String? password;

  UserModel({this.email, this.id, this.name, this.surname});

  UserModel.fromJson(DocumentSnapshot<Map<String, dynamic>> document)
      : this.email = document.data()?["email"];
}

class UserModel2 {
  String id;
  String name;
  String email;
  bool isAdmin;
  UserModel2({
    required this.id,
    required this.name,
    required this.email,
    required this.isAdmin,
  });

  factory UserModel2.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    return UserModel2(
      id: snapshot['id'],
      name: snapshot['name'],
      email: snapshot['email'],
      isAdmin: snapshot['isAdmin'],
    );
  }

  // User.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
  //   id = documentSnapshot.id;
  //   name = documentSnapshot['name'];
  //   email = documentSnapshot['email'];
  //   isAdmin: documentSnapshot['isAdmin'];
  // }
}