import 'dart:async';

import 'package:brainboost/Signup/welcomepage.dart';
import 'package:brainboost/StudentUI/screens/Chat.dart';
import 'package:brainboost/StudentUI/screens/Notifications.dart';
import 'package:brainboost/StudentUI/screens/overview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Dashboard> {
  final auth = FirebaseAuth.instance;
  int idx = 0;
  Color bottomNavClr1 = Colors.black;
  Color bottomNavClr2 = Colors.black;
  Color bottomNavClr3 = Colors.black;
  Color highlight0 = const Color.fromARGB(0, 255, 255, 255);
  Color highlight1 = const Color.fromARGB(0, 255, 255, 255);
  Color highlight2 = const Color.fromARGB(0, 255, 255, 255);
  void currentScreen(int n) {
    setState(() {
      idx = n;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = const Overview();
    //Widget body = const MainBody();
    String title = "Dashboard";

    if (idx == 1) {
      bottomNavClr2 = const Color.fromARGB(255, 252, 255, 76);
      bottomNavClr1 = const Color.fromARGB(255, 0, 0, 0);
      bottomNavClr3 = const Color.fromARGB(255, 0, 0, 0);
      highlight0 = const Color.fromARGB(0, 255, 255, 255);
      highlight1 = const Color.fromARGB(255, 0, 0, 0);
      highlight2 = const Color.fromARGB(0, 255, 255, 255);
      title = "Chat Box";
      screen = const Chat();
    } else if (idx == 2) {
      bottomNavClr3 = const Color.fromARGB(255, 252, 255, 76);
      bottomNavClr1 = const Color.fromARGB(255, 0, 0, 0);
      bottomNavClr2 = const Color.fromARGB(255, 0, 0, 0);
      highlight0 = const Color.fromARGB(0, 255, 255, 255);
      highlight1 = const Color.fromARGB(0, 255, 255, 255);
      highlight2 = const Color.fromARGB(255, 0, 0, 0);
      screen = const Notifications();
      title = "Notifications";
    } else {
      bottomNavClr1 = const Color.fromARGB(255, 252, 255, 76);
      bottomNavClr2 = const Color.fromARGB(255, 0, 0, 0);
      bottomNavClr3 = const Color.fromARGB(255, 0, 0, 0);
      highlight0 = const Color.fromARGB(255, 5, 5, 5);
      highlight1 = const Color.fromARGB(0, 255, 255, 255);
      highlight2 = const Color.fromARGB(0, 255, 255, 255);
    }
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        drawer: Drawer(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(25),
                bottomRight: Radius.circular(25)),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  color: Colors.black,
                  width: double.infinity,
                  height: 260,
                  child: DrawerHeader(
                    decoration: const UnderlineTabIndicator(
                        borderSide: BorderSide(
                            color: Color.fromARGB(195, 255, 235, 59))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset("Assets/demo_profile.png"),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Tejas Vivek Palyekar",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 50,
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.edit,
                                color: Color.fromARGB(150, 255, 255, 255),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.settings),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Settings",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Row(
                        children: [
                          Icon(Icons.help),
                          SizedBox(width: 15),
                          Text(
                            "Help",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.logout),
                          const SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () async {
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
                              await auth.signOut().then((value) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WelcomePage()));
                                Fluttertoast.showToast(
                                    msg: "Logout Sucessfull!",
                                    backgroundColor: Colors.black,
                                    fontSize: 16,
                                    toastLength: Toast.LENGTH_SHORT,
                                    textColor: Colors.white);
                              });
                            },
                            child: const Text(
                              "Log out",
                              style: TextStyle(fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
            leadingWidth: 80,
            leading: Builder(
              builder: (context) {
                return Container(
                  decoration: const BoxDecoration(),
                  child: IconButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: Image.asset(
                      "Assets/demo_profile.png",
                    ),
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
                  ),
                );
              },
            ),
            elevation: 0,
            toolbarHeight: 80,
            title: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                title,
                style: GoogleFonts.openSans(fontSize: 25, color: Colors.black),
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 255, 255, 255)),
        body: screen,

        //bottom navigation
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.elliptical(25, 30)),
            child: Container(
              decoration: const BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Color.fromARGB(133, 122, 122, 122),
                    blurRadius: 15.0,
                  ),
                ],
              ),
              child: BottomNavigationBar(
                elevation: 80,
                backgroundColor: const Color.fromARGB(204, 252, 252, 246),
                currentIndex: idx,
                items: [
                  BottomNavigationBarItem(
                      icon: CircleAvatar(
                        foregroundColor: Colors.amberAccent,
                        maxRadius: 20,
                        backgroundColor: highlight0,
                        child: IconButton(
                            splashRadius: 10,
                            onPressed: () {
                              currentScreen(0);
                            },
                            icon: Image.asset(
                              "Assets/bar-chart.png",
                              color: bottomNavClr1,
                              width: 25,
                            )),
                      ),
                      label: ""),
                  BottomNavigationBarItem(
                      icon: CircleAvatar(
                        maxRadius: 20,
                        backgroundColor: highlight1,
                        child: IconButton(
                            splashRadius: 10,
                            onPressed: () {
                              currentScreen(1);
                              Navigator.push(
                                  context,
                                  DialogRoute(
                                      context: context,
                                      builder: (context) => const Chat()));
                            },
                            icon: Image.asset(
                              "Assets/chat.png",
                              color: bottomNavClr2,
                              width: 25,
                            )),
                      ),
                      label: ""),
                  BottomNavigationBarItem(
                      icon: CircleAvatar(
                        maxRadius: 20,
                        backgroundColor: highlight2,
                        child: IconButton(
                            splashRadius: 10,
                            onPressed: () {
                              currentScreen(2);
                            },
                            icon: Image.asset(
                              "Assets/notification.png",
                              color: bottomNavClr3,
                              width: 25,
                            )),
                      ),
                      label: ""),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

































































/*SafeArea(

          child: Container(
            height: 70,
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: const BoxDecoration(
                color: Color.fromARGB(57, 139, 139, 139),
                borderRadius: BorderRadius.all(Radius.circular(24))),
             */
        /*child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainBody(),
                          ));
                    },
                    highlightColor: Colors.amber,
                    icon: Image.asset("Assets/bar-chart.png")),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => YearToYear()));
                    },
                    highlightColor: Colors.amber,
                    icon: Image.asset("Assets/box.png")),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const YearToYear(),
                          ));
                    },
                    highlightColor: Colors.amber,
                    icon: Image.asset("Assets/chat.png")),
                IconButton(
                    onPressed: () {},
                    highlightColor: Colors.amber,
                    icon: Image.asset("Assets/notification.png"))
              ],
            ),*/



/*
...List.generate(
                    bottomNavs.length,
                    (index) => GestureDetector(
                      onTap: () {
                        bottomNavs[index].input!.change(true);
                        if (bottomNavs[index] != selectedBottomNav) {
                          setState(() {
                            selectedBottomNav = bottomNavs[index];
                          });
                        }
                        Future.delayed(const Duration(seconds: 1), () {
                          bottomNavs[index].input!.change(false);
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AnimatedBar(
                              isActive: bottomNavs[index] == selectedBottomNav),
                          SizedBox(                           
                            height: 45,
                            width: 36,
                            child: Opacity(
                              
                              opacity: bottomNavs[index] == selectedBottomNav
                                  ? 1
                                  : 0.5,
                              child: RiveAnimation.asset(                                
                                bottomNavs.first.src,
                                artboard: bottomNavs[index].artboard,
                                onInit: (artboard) {
                                  StateMachineController controller =
                                      RiveUtils.getRiveController(artboard,
                                          stateMachineName: bottomNavs[index]
                                              .stateMachineName);
                                  bottomNavs[index].input =
                                      controller.findSMI("active") as SMIBool;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
*/
