import 'package:brainboost/ReuseableWidgets/ReuseableButton.dart';
import 'package:brainboost/ReuseableWidgets/ReuseableTextinputField.dart';
import 'package:brainboost/ReuseableWidgets/ReuseableTopContainer.dart';
import 'package:brainboost/Signup/loginPage.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneno = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  validatePassword() {
    if (password.text == confirmpassword.text) {
      print(password.text);
    } else {
      print("password miss match");
    }
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
                      inputController: email,
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
                      inputController: password,
                      hide: true,
                      label: "Password",
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
                          print(name.text);
                          print(email.text);
                          validatePassword();
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
