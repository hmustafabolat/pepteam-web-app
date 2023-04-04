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

  // Map<String, dynamic> toJson() {
  //   return {
  //     if (this.email != null) 'email': this.email,
  //     if (this.password != null) 'password': this.password,
  //   };
  // }
}
