import 'package:brainboost/ReuseableWidgets/ReuseableButton.dart';
import 'package:brainboost/ReuseableWidgets/ReuseableTextinputField.dart';
import 'package:brainboost/ReuseableWidgets/ReuseableTopContainer.dart';
import 'package:brainboost/Signup/loginPage.dart';
import 'package:brainboost/Signup/verifyEmail.dart';
import 'package:brainboost/StudentUI/screens/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  final auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  TextEditingController name = TextEditingController();
  TextEditingController inputemail = TextEditingController();
  TextEditingController phoneno = TextEditingController();
  TextEditingController inputpassword = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  bool validatefields() {
    String password = inputpassword.text.trim();
    String confirmpass = confirmpassword.text.trim();
    if (password == confirmpass) {
      if (password.length >= 6) {
        if (password.contains('@') ||
            password.contains('#') ||
            password.contains('!') ||
            password.contains('%') ||
            password.contains('&') ||
            password.contains('*') ||
            password.contains('(') ||
            password.contains('^') ||
            password.contains(')')) {
          if (password.contains(RegExp(r'[A-Z]'))) {
            if (inputemail.text.isEmail) {
              if (phoneno.text.trim().length == 10 &&
                  phoneno.text.trim().isNumericOnly) {
                return true;
              } else {
                Fluttertoast.showToast(
                    msg: "Phone Number invalid",
                    backgroundColor: Colors.black,
                    fontSize: 16,
                    toastLength: Toast.LENGTH_SHORT,
                    textColor: Colors.white);
                return false;
              }
            } else {
              Fluttertoast.showToast(
                  msg: "Email invalid",
                  backgroundColor: Colors.black,
                  fontSize: 16,
                  toastLength: Toast.LENGTH_SHORT,
                  textColor: Colors.white);
              return false;
            }
          } else {
            Fluttertoast.showToast(
                msg: "Password should contain atleast 1 uppercase character",
                backgroundColor: Colors.black,
                fontSize: 16,
                toastLength: Toast.LENGTH_SHORT,
                textColor: Colors.white);
            return false;
          }
        } else {
          Fluttertoast.showToast(
              msg: "Password should contain atleast 1 special characters",
              backgroundColor: Colors.black,
              fontSize: 16,
              toastLength: Toast.LENGTH_SHORT,
              textColor: Colors.white);
          return false;
        }
      } else {
        Fluttertoast.showToast(
            msg: "Password should contain atleast 6 characters",
            backgroundColor: Colors.black,
            fontSize: 16,
            toastLength: Toast.LENGTH_SHORT,
            textColor: Colors.white);
        return false;
      }
    } else {
      Fluttertoast.showToast(
          msg: "Password Missmatch",
          backgroundColor: Colors.black,
          fontSize: 16,
          toastLength: Toast.LENGTH_SHORT,
          textColor: Colors.white);
      return false;
    }
  }

  bool CheckEmptyFields() {
    String username = name.text;
    String email = inputemail.text;
    String mob = phoneno.text;
    String pass = inputpassword.text;
    String confirmpass = confirmpassword.text;
    if (username.isEmpty ||
        email.isEmpty ||
        mob.isEmpty ||
        pass.isEmpty ||
        confirmpass.isEmpty) {
      Fluttertoast.showToast(
          msg: "Fields cannot be empty",
          backgroundColor: Colors.black,
          fontSize: 16,
          toastLength: Toast.LENGTH_SHORT,
          textColor: Colors.white);
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ReuseableTopContainer(
                title1: "Create",
                title2: "Account.",
                fun: () {
                  Navigator.of(context).pop();
                }),
            Container(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  ReuseableTextInputField(
                      inputController: name,
                      hide: false,
                      label: "Full Name",
                      hint: "Enter your full name"),
                  const SizedBox(
                    height: 20,
                  ),
                  ReuseableTextInputField(
                      inputController: inputemail,
                      hide: false,
                      label: "Email Address",
                      hint: "Enter your email address"),
                  const SizedBox(
                    height: 20,
                  ),
                  ReuseableTextInputField(
                      inputController: phoneno,
                      hide: false,
                      label: "Phone Number",
                      hint: "Enter your phone number"),
                  const SizedBox(
                    height: 20,
                  ),
                  ReuseableTextInputField(
                      inputController: inputpassword,
                      hide: true,
                      label: "Create Password",
                      hint: "Create a new password"),
                  const SizedBox(
                    height: 20,
                  ),
                  ReuseableTextInputField(
                      inputController: confirmpassword,
                      hide: true,
                      label: "Confirm Password",
                      hint: "Confirm Password"),
                  const SizedBox(
                    height: 40,
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
                          if (CheckEmptyFields()) {
                            if (validatefields() == true) {
                              Navigator.of(context).push(DialogRoute(
                                  context: context,
                                  builder: (context) => ValidateEmailAndMob(
                                      email: inputemail,
                                      password: inputpassword,
                                      mobileno: phoneno,
                                      username: name,
                                      changeemail: (){
                                        Navigator.of(context).pop();
                                      },)));
                              
                            }else{
                              Navigator.of(context).pop();
                            }
                          }else{
                            Navigator.of(context).pop();
                          }
                          
                        },
                        btncolor: Colors.yellow,
                        btntitle: "Sign Up"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(PageRouteBuilder(
                            pageBuilder: (context, __, ___) => LoginPage()));
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Already have account? ",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Sign in",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w800),
                          )
                        ],
                      ),
                    ),
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
