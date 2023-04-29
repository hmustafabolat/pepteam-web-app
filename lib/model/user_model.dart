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

class User {
  String id;
  String name;
  String email;
  bool isAdmin;
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.isAdmin,
  });

  factory User.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    return User(
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