import 'package:brainboost/UI/Signup/welcomepage.dart';
import 'package:brainboost/UI/StudentUI/screens/Chat.dart';
import 'package:brainboost/UI/StudentUI/screens/Notifications.dart';
import 'package:brainboost/UI/StudentUI/screens/overview.dart';
import 'package:brainboost/data%20model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Dashboard> {
  int idx = 0;
  Color bottomNavClr1 = Colors.black;
  Color bottomNavClr2 = Colors.black;
  Color bottomNavClr3 = Colors.black;
  Color highlight0 = const Color.fromARGB(0, 255, 255, 255);
  Color highlight1 = const Color.fromARGB(0, 255, 255, 255);
  Color highlight2 = const Color.fromARGB(0, 255, 255, 255);

  static final auth = FirebaseAuth.instance;
  static final user = auth.currentUser;
  final _db = FirebaseFirestore.instance;
  String? curr_useremail = user!.email;

  late Map<String, dynamic> retrivedatacolection;
  void currentScreen(int n) {
    setState(() {
      idx = n;
    });
  }

  Future<UserModel> fetchUserData() async {
    String? useremail = auth.currentUser?.email;
    print(auth.currentUser?.email);

    final snapshot = await _db
        .collection("Users")
        .where("useremail", isEqualTo: useremail)
        .get();
    final usermodel =
        snapshot.docs.map((e) => UserModel.fromshapshot(e)).single;
    return usermodel;
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
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25), bottomRight: Radius.circular(25)),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                color: Colors.black,
                width: double.infinity,
                height: 210,
                child: DrawerHeader(
                  decoration: const UnderlineTabIndicator(
                      borderSide:
                          BorderSide(color: Color.fromARGB(195, 255, 235, 59))),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: FutureBuilder(
                          future: fetchUserData(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              if (snapshot.hasData) {
                                UserModel userdata = snapshot.data as UserModel;
                                return Column(
                                  children: [
                                    Image.asset("Assets/demo_profile.png"),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '${userdata.name?.toUpperCase()}',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      '${userdata.email}',
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 10),
                                    )
                                  ],
                                );
                              }
                            } else if (snapshot.hasError) {
                              Fluttertoast.showToast(
                                  msg: "Error while fetching user data",
                                  backgroundColor: Colors.black,
                                  fontSize: 16,
                                  toastLength: Toast.LENGTH_SHORT,
                                  textColor: Colors.white);
                            } else {
                              return Column(
                                children: [
                                  Image.asset("Assets/demo_profile.png"),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {});
                                    },
                                    child: const Column(
                                      children: [
                                        Icon(
                                          Icons.refresh,
                                          color: Colors.yellow,
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          "refresh",
                                          style: TextStyle(color: Colors.white),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              );
                            }
                            return const Center(
                              child: CircularProgressIndicator(
                                  color: Colors.yellow),
                            );
                          },
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
                    GestureDetector(
                      child: const Row(
                        children: [
                          Icon(Icons.settings),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Text(
                              "Settings",
                              style: TextStyle(fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Row(
                        children: [
                          Icon(Icons.help),
                          SizedBox(width: 15),
                          Expanded(
                            child: Text(
                              "Help",
                              style: TextStyle(fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
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
                      child: const Row(
                        children: [
                          Icon(Icons.logout),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Text(
                              "Log out",
                              style: TextStyle(fontSize: 20),
                            ),
                          )
                        ],
                      ),
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
              style: GoogleFonts.openSans(
                  fontSize: 27,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255)),
      body: FutureBuilder(
        future: fetchUserData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return screen;
            }
          } else if (snapshot.hasError) {
            Fluttertoast.showToast(
                msg: "Error while fetching user data",
                backgroundColor: Colors.black,
                fontSize: 16,
                toastLength: Toast.LENGTH_SHORT,
                textColor: Colors.white);
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Color.fromARGB(255, 0, 0, 0),
              strokeWidth: 4,
              backgroundColor: Colors.white,
            ),
          );
        },
      ),

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
    );
  }
}
