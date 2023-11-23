import 'dart:async';
import 'package:brainboost/ReuseableWidgets/ReuseableButton.dart';
import 'package:brainboost/ReuseableWidgets/ReuseableTextinputField.dart';
import 'package:brainboost/ReuseableWidgets/ReuseableTopContainer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PasswordReset extends StatelessWidget {
  PasswordReset({super.key});
  final auth = FirebaseAuth.instance;
  TextEditingController resetemail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ReuseableTopContainer(
                title1: "Reset",
                title2: "Password.",
                fun: () {
                  Navigator.of(context).pop();
                }),
            Container(
              padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
              child: const Text(
                "Send a link to your email to reset your password",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
              child: Column(
                children: [
                  ReuseableTextInputField(
                      inputController: resetemail,
                      hide: false,
                      label: "Email Address",
                      hint: "Enter Registered Email Id"),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ReuseableButton(
                        fun: () {
                          auth
                              .sendPasswordResetEmail(email: resetemail.text)
                              .then({
                                Navigator.of(context).pop(),
                                Fluttertoast.showToast(
                                        msg: "Reset Link Send to Registered Email Id",
                                        backgroundColor: Colors.black,
                                        fontSize: 16,
                                        toastLength: Toast.LENGTH_SHORT,
                                        textColor: Colors.white)
                                } as FutureOr Function(void value));
                        },
                        btncolor: Colors.yellow,
                        btntitle: "Send Link"),
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
