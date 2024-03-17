import 'dart:async';

import 'package:brainboost/Services/semMarksService.dart';
import 'package:brainboost/bloc/students_data_bloc.dart';
import 'package:brainboost/bloc/students_data_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class Sem extends StatefulWidget {
  Sem({super.key, this.currsem});
  String? currsem;
  @override
  State<Sem> createState() => _SemState();
}

class _SemState extends State<Sem> {
  SemMarksService Semmarksservice = SemMarksService();
  static final auth = FirebaseAuth.instance;
  bool grapgloading = true;

  int selectedcategory = 50;
  int len = 50;
  late int studentrank;
  List<FlSpot> points = [
    /*const FlSpot(1,
        55), //ml FlSpot(x,y) x= subject no  y = marks obtained in that subject
    const FlSpot(2, 50), //csl
    const FlSpot(3, 65), //bkc
    const FlSpot(4, 60), //bda
    const FlSpot(5, 64), //nlp*/
  ];
  List<FlSpot> avg = [
    /*const FlSpot(1, 60), //ml
    const FlSpot(2, 60), //csl
    const FlSpot(3, 60), //bkc
    const FlSpot(4, 60), //bda
    const FlSpot(5, 60), //nlp*/
  ];
  var items = [
    'Semester 1',
    'Semester 2',
    'Semester 3',
    'Semester 4',
    'Semester 5',
    'Semester 6',
    'Semester 7'
  ];
  late String dropdownvalue;
  late FlSpot yourperformance;

  @override
  void initState() {
    print("called");
    super.initState();
    dropdownvalue = context.read<StudentsDataBloc>().state.selectedsem;
    if (context.read<StudentsDataBloc>().state.StudentsData.isEmpty) {
      getdataservice();
    } else {
      mapdatapoints();
    }
  }

  getdataservice() async {
    final semdata = await Semmarksservice.getcurrsemmarks(
        auth.currentUser!.email!,
        dropdownvalue == "Semester 1"
            ? "sem1"
            : dropdownvalue == "Semester 2"
                ? "sem2"
                : dropdownvalue == "Semester 3"
                    ? "sem3"
                    : dropdownvalue == "Semester 4"
                        ? "sem4"
                        : dropdownvalue == "Semester 5"
                            ? "sem5"
                            : dropdownvalue == "Semester 6"
                                ? "sem6"
                                : "sem7");
    semdata.allStudentMarksList.sort((a, b) => b[1].compareTo(a[1]));
    context.read<StudentsDataBloc>().add(getnewlist(
        studentsmarks: semdata.allStudentMarksList,
        avg: semdata.semavg,
        cgpa: semdata.currentstudentcgpa,
        selectedsem: dropdownvalue));
    Timer(Duration(seconds: 1), () {
      mapdatapoints();
    });
  }

  mapdatapoints() {
    final mybloc = context.read<StudentsDataBloc>();
    print(mybloc.state.StudentsData.length);
    len = selectedcategory == 150
        ? mybloc.state.StudentsData.length
        : selectedcategory;

    for (int i = 0; i < len; i++) {
      avg.add(FlSpot(i + 1, mybloc.state.avg));

      points.add(FlSpot(i.toDouble() + 1, mybloc.state.StudentsData[i][1]));

      if (mybloc.state.StudentsData[i][0] == auth.currentUser!.email) {
        yourperformance = FlSpot(i + 1, mybloc.state.StudentsData[i][1]);

        setState(() {
          studentrank = i;
        });
      }
    }
    setState(() {
      grapgloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsDataBloc, StudentsDataState>(
      builder: (context, state) => Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 252, 249, 249),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(255, 82, 82, 82), blurRadius: 2)
                  ]),
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DropdownButton(
                        underline: const Text(""),
                        value: dropdownvalue,
                        elevation: 2,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                            points = [];
                            avg = [];
                            grapgloading = true;
                          });
                          getdataservice();
                        },
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.only(bottom: 10, right: 10),
                    height: 250,
                    width: double.infinity,
                    child: grapgloading
                        ? Center(
                            child: SizedBox(
                                height: 100,
                                width: 100,
                                child:
                                    Lottie.asset("Assets/graphloading.json")),
                          )
                        : Column(
                            children: [
                              Expanded(
                                child: LineChart(
                                    curve: Curves.bounceInOut,
                                    LineChartData(
                                      maxY: 10,
                                      maxX: len.toDouble(),
                                      minY: 6,
                                      lineBarsData: [
                                        LineChartBarData(
                                            dotData:
                                                const FlDotData(show: false),
                                            color: const Color.fromARGB(
                                                255, 24, 204, 0),
                                            gradient:
                                                const LinearGradient(colors: [
                                              Color.fromARGB(255, 23, 194, 0),
                                              Color.fromARGB(255, 24, 207, 0),
                                              Color.fromARGB(255, 27, 230, 0),
                                              Color.fromARGB(255, 27, 230, 0),
                                              Color.fromARGB(255, 40, 255, 11),
                                            ]),
                                            spots: avg),
                                        LineChartBarData(
                                            isStrokeCapRound: true,
                                            isStrokeJoinRound: true,
                                            spots: points,
                                            dotData: FlDotData(
                                              getDotPainter: (spot, percent,
                                                  barData, index) {
                                                final isYourPerformance = spot
                                                            .x ==
                                                        yourperformance.x &&
                                                    spot.y == yourperformance.y;

                                                return FlDotCirclePainter(
                                                  radius: 4,
                                                  color: isYourPerformance
                                                      ? Colors.red
                                                      : Colors.blue,
                                                );
                                              },
                                              checkToShowDot: (spot, barData) =>
                                                  spot == yourperformance,
                                            ),
                                            gradient:
                                                const LinearGradient(colors: [
                                              Color.fromARGB(255, 111, 18, 218),
                                              Color.fromARGB(255, 119, 0, 255),
                                              Color.fromARGB(255, 145, 49, 255),
                                            ])),
                                      ],
                                      borderData: FlBorderData(show: false),
                                      //gridData: const FlGridData(show: false),
                                      titlesData: const FlTitlesData(
                                        bottomTitles: AxisTitles(
                                            sideTitles:
                                                SideTitles(showTitles: false)),
                                        topTitles: AxisTitles(
                                            sideTitles:
                                                SideTitles(showTitles: false)),
                                        rightTitles: AxisTitles(
                                            sideTitles: SideTitles(
                                          showTitles: false,
                                        )),
                                      ),
                                      lineTouchData: LineTouchData(
                                          enabled: true,
                                          touchCallback: (FlTouchEvent event,
                                              LineTouchResponse?
                                                  touchResponse) {
                                            // TODO : Utilize touch event here to perform any operation
                                          },
                                          touchTooltipData:
                                              const LineTouchTooltipData(
                                            tooltipBgColor:
                                                Color.fromARGB(255, 36, 36, 36),
                                            tooltipRoundedRadius: 10.0,
                                            showOnTopOfTheChartBoxArea: true,
                                            fitInsideHorizontally: true,
                                            tooltipMargin: 0,
                                          ),
                                          getTouchedSpotIndicator:
                                              (LineChartBarData barData,
                                                  List<int> indicators) {
                                            return indicators.map(
                                              (int index) {
                                                const line = FlLine(
                                                    color: Color.fromARGB(
                                                        255, 145, 145, 145),
                                                    strokeWidth: 1,
                                                    dashArray: [2, 4]);
                                                return const TouchedSpotIndicatorData(
                                                  line,
                                                  FlDotData(show: false),
                                                );
                                              },
                                            ).toList();
                                          },
                                          getTouchLineEnd: (_, __) =>
                                              double.infinity),
                                    )),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedcategory = 10;
                                          points = [];
                                          avg = [];
                                          grapgloading = true;
                                        });
                                        mapdatapoints();
                                      },
                                      child: AnimatedContainer(
                                        padding: const EdgeInsets.all(5),
                                        duration:
                                            const Duration(milliseconds: 300),
                                        decoration: BoxDecoration(
                                            color: selectedcategory == 10
                                                ? Colors.black
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            border: Border.all()),
                                        child: Text(
                                          "Top 10",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: selectedcategory == 10
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedcategory = 50;
                                          points = [];
                                          avg = [];
                                          grapgloading = true;
                                        });
                                        mapdatapoints();
                                      },
                                      child: AnimatedContainer(
                                        padding: const EdgeInsets.all(5),
                                        duration:
                                            const Duration(milliseconds: 300),
                                        decoration: BoxDecoration(
                                            color: selectedcategory == 50
                                                ? Colors.black
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            border: Border.all()),
                                        child: Text(
                                          "Top 50",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: selectedcategory == 50
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedcategory = 100;
                                          points = [];
                                          avg = [];
                                          grapgloading = true;
                                        });
                                        mapdatapoints();
                                      },
                                      child: AnimatedContainer(
                                        padding: const EdgeInsets.all(5),
                                        duration:
                                            const Duration(milliseconds: 300),
                                        decoration: BoxDecoration(
                                            color: selectedcategory == 100
                                                ? Colors.black
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            border: Border.all()),
                                        child: Text(
                                          "Top 100",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: selectedcategory == 100
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedcategory = 150;
                                          points = [];
                                          avg = [];
                                          grapgloading = true;
                                        });
                                        mapdatapoints();
                                      },
                                      child: AnimatedContainer(
                                        padding: const EdgeInsets.all(5),
                                        duration:
                                            const Duration(milliseconds: 300),
                                        decoration: BoxDecoration(
                                            color: selectedcategory == 150
                                                ? Colors.black
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            border: Border.all()),
                                        child: Text(
                                          "All Students",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: selectedcategory == 150
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    padding: const EdgeInsets.all(10),
                    height: 150,
                    width: 190,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color.fromARGB(255, 31, 31, 31),
                    ),
                    child: TweenAnimationBuilder(
                      duration: const Duration(seconds: 1),
                      tween: Tween<double>(begin: 0, end: 1),
                      builder: (context, value, child) => Opacity(
                        opacity: value,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Exam Stats:",
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(244, 255, 255, 255)),
                                ),
                                Icon(
                                  Icons.more_horiz_sharp,
                                  color: Colors.white,
                                )
                              ],
                            ),
                            grapgloading
                                ? Center(
                                    child: Container(
                                      padding: const EdgeInsets.only(top: 20),
                                      height: 60,
                                      width: 60,
                                      child: Lottie.asset(
                                          "Assets/graphloading.json"),
                                    ),
                                  )
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Avg at:  ${state.avg}",
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                214, 255, 255, 255),
                                            fontSize: 12),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "You at:  ${state.cgpa.toString()}",
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                214, 255, 255, 255),
                                            fontSize: 12),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Your Ranking:",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    214, 255, 255, 255),
                                                fontSize: 12),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            decoration: BoxDecoration(
                                                color: Colors.pink[100],
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "$studentrank th",
                                                  style: const TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  height: 170,
                  width: 160,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const Text("Class Performance",
                              style: TextStyle(fontSize: 14)),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 20,
                            height: 5,
                            color: const Color.fromARGB(255, 143, 7, 255),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const Text("Class Average",
                              style: TextStyle(fontSize: 14)),
                          const SizedBox(
                            width: 10,
                          ),
                          const SizedBox(
                            width: 27,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 20,
                            height: 5,
                            color: const Color.fromARGB(255, 7, 255, 40),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const Text("Your Performance",
                              style: TextStyle(fontSize: 14)),
                          const SizedBox(
                            width: 10,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            width: 5,
                            height: 5,
                            color: const Color.fromARGB(255, 255, 7, 7),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
