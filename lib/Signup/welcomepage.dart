import 'package:brainboost/ReuseableWidgets/ReuseableButton.dart';
import 'package:brainboost/Signup/loginPage.dart';
import 'package:brainboost/Signup/signuppage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.only(top: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Text(
              "Let's get started!",
              style: GoogleFonts.poppins(
                  fontSize: 40, fontWeight: FontWeight.w600),
            ),
          ),
          Hero(
              tag: "tag",
              child: Image.asset('Assets/brainboostlogo.png', width: 300)),
          Container(
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(topRight: Radius.circular(60))),
            padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
            height: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Empowering educators and students on the journey to unlock their full academic potential.",
                    style:
                        GoogleFonts.roboto(color: Colors.white, fontSize: 19),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: ReuseableButton(
                      fun: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                               reverseTransitionDuration: const Duration(milliseconds: 200),
                              opaque: true,
                                pageBuilder: (context, __, ___) =>
                                    SignupPage()));
                      },
                      btncolor: Colors.yellow,
                      btntitle: "Sign Up"),
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                        reverseTransitionDuration: Duration(milliseconds: 200),
                        opaque: true,
                        pageBuilder: (context, __, ___) => LoginPage()));
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have account? ",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Text("Log in",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
