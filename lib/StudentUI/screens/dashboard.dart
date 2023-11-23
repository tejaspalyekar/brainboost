
import 'package:brainboost/StudentUI/screens/Chat.dart';
import 'package:brainboost/StudentUI/screens/Notifications.dart';
import 'package:brainboost/StudentUI/screens/overview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Dashboard> {
  int idx = 0;
  //int bodyidx = 0;
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
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        drawer: const Drawer(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(25),
                bottomRight: Radius.circular(25)),
          ),
          backgroundColor: Color.fromARGB(255, 37, 37, 37),
        ),
        appBar: AppBar(
            //appbar

            leading: Builder(
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    minRadius: 30,
                    backgroundColor: Colors.black,
                    child: IconButton(
                      onPressed: () => Scaffold.of(context).openDrawer(),
                      icon: Image.asset("Assets/menu-bar.png",
                          color: const Color.fromARGB(255, 252, 255, 76)),
                      tooltip: MaterialLocalizations.of(context)
                          .openAppDrawerTooltip,
                    ),
                  ),
                );
              },
            ),
            elevation: 0,
            toolbarHeight: 80,
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 10, top: 16, bottom: 16),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: Color.fromARGB(225, 255, 193, 7)),
                width: 50,
                child: IconButton(
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  icon: Image.asset("Assets/demo_profile.png",
                      filterQuality: FilterQuality.high),
                ),
              ),
            ],
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
        bottomNavigationBar: 

          
         Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 10
            ),
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
