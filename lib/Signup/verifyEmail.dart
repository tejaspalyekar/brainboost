import 'dart:async';
import 'package:brainboost/ReuseableWidgets/ReuseableButton.dart';
import 'package:brainboost/ReuseableWidgets/ReuseableTextinputField.dart';
import 'package:brainboost/ReuseableWidgets/ReuseableTopContainer.dart';
import 'package:brainboost/StudentUI/screens/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';

class ValidateEmailAndMob extends StatefulWidget {
  ValidateEmailAndMob(
      {super.key,
      required this.email,
      required this.password,
      this.changeemail});
  TextEditingController email;
  TextEditingController password;
  void Function()? changeemail;

  @override
  State<ValidateEmailAndMob> createState() => _ValidateEmailAndMobState();
}

class _ValidateEmailAndMobState extends State<ValidateEmailAndMob> {
  final auth = FirebaseAuth.instance;
  bool timeexpire = false;
  bool emailverified = false;
  TextEditingController resetemail = TextEditingController();
  Duration myDuration = const Duration(minutes: 1);
  Timer? time;

  void startTimer() {
    final user = auth.currentUser;
    user!.sendEmailVerification();
    time = Timer.periodic(const Duration(seconds: 1), (_) {
      setCountDown();
      verifyEmail();
    });
  }

  void resetTimer() {
    setState(() {
      timeexpire = false;
      myDuration = const Duration(minutes: 1);
    });
    startTimer();
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        timeexpire = true;
        time!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  verifyEmail() async {
    final user = auth.currentUser;
    await user!.reload();
    if (user.emailVerified) {
      setState(() {
        time!.cancel();
        myDuration = const Duration(minutes: 1);
      });
      timeexpire = true;
      Navigator.of(context).push(PageRouteBuilder(
          pageBuilder: (context, __, ___) => const Dashboard()));
      Fluttertoast.showToast(
          msg: "Sign Up Sucessfull",
          backgroundColor: Colors.black,
          fontSize: 16,
          toastLength: Toast.LENGTH_SHORT,
          textColor: Colors.white);
    }
  }

  @override
  void initState() {
    super.initState();
    signupUser(context);
  }

  signupUser(BuildContext context) async {
    await auth
        .createUserWithEmailAndPassword(
            email: widget.email.text.trim(),
            password: widget.password.text.trim())
        .then((value) async {
      startTimer();
    }).onError((error, stackTrace) {
      Fluttertoast.showToast(
          msg: error.toString().trimLeft(),
          backgroundColor: Colors.black,
          fontSize: 16,
          toastLength: Toast.LENGTH_SHORT,
          textColor: Colors.white);
      Navigator.of(context).pop();
      widget.changeemail!();
    });
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ReuseableTopContainer(
                title1: "Email",
                title2: "Verification",
                fun: () {
                  final user = auth.currentUser;
                  user!.delete();   
                  Navigator.of(context).pop();
                  widget.changeemail!();
                }),
            Container(
              padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
              child: Text(
                'Email Verification Link has been sent to your email address  ${widget.email.text}',
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Container(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                children: [
                  const Text(
                    "Didn't get it?",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 120,
                    height: 35,
                    child: OutlinedButton(
                        style: ButtonStyle(
                            side: MaterialStatePropertyAll(BorderSide(
                                color: timeexpire
                                    ? const Color.fromARGB(255, 0, 0, 0)
                                    : const Color.fromARGB(172, 88, 88, 88),
                                width: 1.5)),
                            elevation: const MaterialStatePropertyAll(5),
                            backgroundColor: MaterialStatePropertyAll(
                              timeexpire
                                  ? Colors.yellow
                                  : Color.fromARGB(172, 255, 255, 255),
                            )),
                        onPressed: () {
                          if (timeexpire) {
                            resetTimer();
                          }
                        },
                        child: Text(
                          "Resend code",
                          style: TextStyle(
                            color: timeexpire
                                ? const Color.fromARGB(255, 0, 0, 0)
                                : const Color.fromARGB(172, 88, 88, 88),
                            fontSize: 12,
                          ),
                        )),
                  ),
                  const Spacer(),
                  Text(
                    '$minutes:$seconds',
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: GestureDetector(
                onTap: () {
                  final user = auth.currentUser;
                  user!.delete();
                  widget.changeemail!();
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Change the email address",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 0, 60, 255),
                      decoration: TextDecoration.underline,
                      decorationColor: Color.fromARGB(255, 0, 60, 255),
                      decorationThickness: 2),
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            !timeexpire
                ? const SizedBox(
                    height: 100,
                    width: 100,
                    child: CircularProgressIndicator(
                      backgroundColor: Color.fromARGB(255, 0, 0, 0),
                      color: Color.fromARGB(255, 175, 158, 0),
                      strokeWidth: 5,
                    ),
                  )
                : const Text(""),
          ],
        ),
      ),
    );
  }
}
