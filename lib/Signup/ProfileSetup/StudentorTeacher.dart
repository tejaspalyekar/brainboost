import 'package:brainboost/ReuseableWidgets/ReuseableButton.dart';
import 'package:brainboost/data%20model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class StudentOrTeacher extends StatefulWidget {
  StudentOrTeacher({super.key});

  @override
  State<StudentOrTeacher> createState() => _StudentOrTeacherState();
}

class _StudentOrTeacherState extends State<StudentOrTeacher> {
  String? currvalue = "Student";
  String currimage = "Assets/student.gif";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text("Student"),
          leading: Radio(
              value: "Student",
              groupValue: currvalue,
              onChanged: (value) => setState(() {
                    currvalue = value;
                    currimage = "Assets/student.gif";
                  })),
        ),
        ListTile(
          title: Text("Teacher"),
          leading: Radio(
              value: "Teacher",
              groupValue: currvalue,
              onChanged: (value) => setState(() {
                    currimage = "Assets/teacher.webp";
                    currvalue = value;
                  })),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 130,
          child: Image.asset(
            currimage,
          ),
        ),
        SizedBox(height: 15,),
            Container(
               padding: EdgeInsets.symmetric(horizontal: 20),
               width: double.infinity,
               height: 50,
               child: ReuseableButton(fun: (){
                UserModel;
               }, btncolor: Colors.yellow, btntitle: "Next"))
      ],
    );
  }
}
