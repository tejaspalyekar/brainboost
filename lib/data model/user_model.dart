import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? password;
  final String? studentTeacher;

  UserModel(
      {this.id,
      this.studentTeacher,
      this.name,
      this.email,
      this.phone,
      this.password});

  toJson() {
    return {
      "username": name,
      "useremail": email,
      "userphoneno": phone,
      "userpassword": password,
      "student/teacher": studentTeacher,
    };
  }


  factory UserModel.fromshapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return UserModel(
        id: document.id,
        name: data?["username"],
        email: data?["useremail"],
        phone: data?["userphoneno"],
        studentTeacher: data?["student/teacher"],
        password: data?["userpassword"]);
  }
}
