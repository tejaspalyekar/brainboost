import 'package:brainboost/ReuseableWidgets/ReuseableButton.dart';
import 'package:brainboost/ReuseableWidgets/ReuseableTextinputField.dart';
import 'package:brainboost/ReuseableWidgets/ReuseableTopContainer.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
 LoginPage({super.key});
  TextEditingController inputEmail = TextEditingController();
  TextEditingController inpuutPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ReuseableTopContainer(
              title1: "Welcome",
              title2: "Back!",
              fun: () {
                Navigator.of(context).pop();
              }),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
              ),
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
                        hide: true, label: "Password", hint: "enter password"),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ReuseableButton(
                          fun: () {},
                          btncolor: Colors.yellow,
                          btntitle: "Sign in"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: GestureDetector(
                            onTap: () {},
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.right,
                            )))
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
