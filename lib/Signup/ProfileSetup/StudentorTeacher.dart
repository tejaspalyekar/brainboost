import 'package:brainboost/ReuseableWidgets/ReuseableButton.dart';
import 'package:brainboost/StudentUI/screens/dashboard.dart';
import 'package:brainboost/TeachersUI/TeachersHomepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StudentOrTeacher extends StatefulWidget {
  StudentOrTeacher(
      {super.key, this.email, this.mobileno, this.password, this.username});

  String? email;
  String? password;
  String? mobileno;
  String? username;

  @override
  State<StudentOrTeacher> createState() => _StudentOrTeacherState();
}

class _StudentOrTeacherState extends State<StudentOrTeacher> {
  String? currvalue = "Student";
  String currimage = "Assets/student.gif";
  double begin = 0;
  double end = 1;
  final _firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  void storeUserData() async {
    await _firestore.collection("Users").add({
      "username": widget.username,
      "useremail": widget.email,
      "userphoneno": widget.mobileno,
      "userpassword": widget.password,
      "student/teacher": currvalue,
    }).then((value) {
      Navigator.of(context).push(
          PageRouteBuilder(pageBuilder: (context, __, ___) => currvalue=="Student"? const Dashboard():const TeachersHomepage()));
      Fluttertoast.showToast(
          msg: "User Account Created",
          backgroundColor: Colors.black,
          fontSize: 16,
          toastLength: Toast.LENGTH_SHORT,
          textColor: Colors.white);
    }).onError((error, stackTrace) {
      final user = auth.currentUser;
      user!.delete();
      Fluttertoast.showToast(
          msg: "unable to create account..try again",
          backgroundColor: Colors.black,
          fontSize: 16,
          toastLength: Toast.LENGTH_SHORT,
          textColor: Colors.white);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text("Student"),
          leading: Radio(
              value: "Student",
              groupValue: currvalue,
              onChanged: (value) => setState(() {
                    currvalue = value;
                    currimage = "Assets/student.gif";
                  })),
        ),
        ListTile(
          title: const Text("Teacher"),
          leading: Radio(
              value: "Teacher",
              groupValue: currvalue,
              onChanged: (value) => setState(() {
                    currimage = "Assets/teacher.webp";
                    currvalue = value;
                    begin = 0.1;
                    end = 0.9;
                  })),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 150,
          child: Image.asset(
            currimage,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: 50,
            child: ReuseableButton(
                fun: (){
                  storeUserData();
                },
                btncolor: Colors.yellow,
                btntitle: "Next"))
      ],
    );
  }
}