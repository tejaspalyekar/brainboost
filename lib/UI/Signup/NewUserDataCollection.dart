import 'package:brainboost/ReuseableWidgets/ReuseableTopContainer.dart';
import 'package:brainboost/UI/Signup/ProfileSetup/StudentorTeacher.dart';
import 'package:flutter/material.dart';

class NewUserDataCollection extends StatelessWidget {
  NewUserDataCollection({super.key,this.email,this.mobileno,this.password,this.username});
  String? email;
  String? password;
  String? mobileno;
  String?  username;
  List<String> questionsTitle = [
    "Let Us Know If You're a Student or Teacher",
    "",
  ];
  int questionNo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ReuseableTopContainer(
                title1: "Profile Setup",
                title2: "",
                fun: () => Navigator.of(context).pop()),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Personalize Your Brain Boost Experience:",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: Column(
               
                children: [
                  Text(
                    questionsTitle[questionNo],
                    softWrap: true,
                    maxLines: 3,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  StudentOrTeacher(
                    email: email,
                    mobileno: mobileno,
                    password: password,
                    username: username,
                  )

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
