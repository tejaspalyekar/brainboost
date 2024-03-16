import 'dart:async';
import 'package:brainboost/ReuseableWidgets/ReuseableButton.dart';
import 'package:brainboost/ReuseableWidgets/ReuseableTextinputField.dart';
import 'package:brainboost/ReuseableWidgets/ReuseableTopContainer.dart';
import 'package:brainboost/UI/Signup/passwordReset.dart';
import 'package:brainboost/UI/StudentUI/screens/dashboard.dart';
import 'package:brainboost/UI/TeachersUI/TeachersHomepage.dart';
import 'package:brainboost/data%20model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final auth = FirebaseAuth.instance;
  TextEditingController inputEmail = TextEditingController();
  TextEditingController inpuutPassword = TextEditingController();

  Future<UserModel> fetchUserData() async {
    String? useremail = auth.currentUser?.email;
    final _db = FirebaseFirestore.instance;

    final snapshot = await _db
        .collection("Users")
        .where("useremail", isEqualTo: useremail)
        .get();
    final usermodel =
        snapshot.docs.map((e) => UserModel.fromshapshot(e)).single;
    return usermodel;
  }

  UserLogin(BuildContext context) async {
    String? teacher = "";
    await auth
        .signInWithEmailAndPassword(
            email: inputEmail.text.trim(), password: inpuutPassword.text.trim())
        .then((value) {
      Navigator.of(context).push(DialogRoute(
        context: context,
        builder: (context) => FutureBuilder(
          future: fetchUserData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel userdata = snapshot.data as UserModel;
                  print(userdata.studentTeacher);
                  if (userdata.studentTeacher == "Teacher") {
                    return TeachersHomepage();
                  }
                } 
              } 
              return Dashboard();
          },
        ),
      ));

      Fluttertoast.showToast(
          msg: 'Sign in $teacher',
          backgroundColor: Colors.black,
          fontSize: 16,
          toastLength: Toast.LENGTH_SHORT,
          textColor: Colors.white);
    }).onError((error, stackTrace) {
      Fluttertoast.showToast(
          msg: error.toString(),
          backgroundColor: Colors.black,
          fontSize: 16,
          toastLength: Toast.LENGTH_SHORT,
          textColor: Colors.white);
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ReuseableTopContainer(
                title1: "Welcome",
                title2: "Back!",
                fun: () {
                  Navigator.of(context).pop();
                }),
            Container(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 100),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ReuseableTextInputField(
                        inputController: inputEmail,
                        hide: false,
                        label: "Email Address",
                        hint: "enter email address"),
                    const SizedBox(
                      height: 30,
                    ),
                    ReuseableTextInputField(
                        inputController: inpuutPassword,
                        hide: true,
                        label: "Password",
                        hint: "enter password"),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ReuseableButton(
                          fun: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.black,
                                      backgroundColor: Colors.yellow,
                                    ),
                                  );
                                });
                            UserLogin(context);
                          },
                          btncolor: Colors.yellow,
                          btntitle: "Sign in"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(PageRouteBuilder(
                                  pageBuilder: (context, __, ___) =>
                                      PasswordReset()));
                            },
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.right,
                            )))
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
