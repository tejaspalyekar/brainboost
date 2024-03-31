// ignore_for_file: avoid_unnecessary_containers
import 'package:brainboost/Services/semMarksService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class YearToYear extends StatefulWidget {
  const YearToYear({super.key});

  @override
  State<YearToYear> createState() => _YearToYearState();
}

class _YearToYearState extends State<YearToYear> {
  PageController _pcontroller = PageController();
  late List<_ChartData> data = [];
  late TooltipBehavior _tooltip;
  String lowestscoredsem = "";
  double lowestcgpa = 0;
  String highestscoredsem = "";
  double highestcgpa = 0;
  SemMarksService Semmarksservice = SemMarksService();
  static final auth = FirebaseAuth.instance;
  List semlist = ['sem1', 'sem2', 'sem3', 'sem4', 'sem5', 'sem6', 'sem7'];
  bool loading = true;
  @override
  void initState() {
    fetchallsemdata();
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  fetchallsemdata() async {
    String lowestsem = "";
    double lowcgpa = 11;
    String highsem = "";
    double highcgpa = 0;
    for (int i = 0; i < semlist.length; i++) {
      final marksmodel = await Semmarksservice.getcurrsemmarks(
          auth.currentUser!.email!, semlist[i]);
      data.add(_ChartData(semlist[i], marksmodel.currentstudentcgpa));
      if (marksmodel.currentstudentcgpa < lowcgpa) {
        lowcgpa = marksmodel.currentstudentcgpa;
        lowestsem = semlist[i];
      }
      if (marksmodel.currentstudentcgpa > highcgpa) {
        highcgpa = marksmodel.currentstudentcgpa;
        highsem = semlist[i];
      }
    }
    print(lowcgpa);
    print(highcgpa);
    setState(() {
      loading = false;
      highestcgpa = highcgpa;
      lowestcgpa = lowcgpa;
      highestscoredsem = highsem;
      lowestscoredsem = lowestsem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 35,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text('Year To Year Assesment ',
                      style: GoogleFonts.roboto(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                      ))),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              height: 250,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black, blurRadius: 2)],
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: loading
                  ? Lottie.asset("Assets/graphloading.json")
                  : SfCartesianChart(
                      primaryXAxis: const CategoryAxis(
                        minimum: 0,
                      ),
                      primaryYAxis: const NumericAxis(
                          minimum: 5, maximum: 10, interval: 1),
                      tooltipBehavior: _tooltip,
                      enableAxisAnimation: true,
                      enableMultiSelection: true,
                      series: <CartesianSeries<_ChartData, String>>[
                          AreaSeries<_ChartData, String>(
                            dataSource: data,
                            xValueMapper: (_ChartData data, _) => data.x,
                            yValueMapper: (_ChartData data, _) => data.y,
                            name: 'Performance',
                            borderGradient: const LinearGradient(colors: [
                              Color.fromARGB(255, 255, 191, 0),
                              Color.fromARGB(255, 255, 196, 19),
                            ]),
                            gradient: const LinearGradient(colors: [
                              Color.fromARGB(255, 255, 220, 114),
                              Color.fromARGB(255, 255, 227, 144),
                              Color.fromARGB(198, 255, 235, 174),
                              Color.fromARGB(198, 255, 241, 198)
                            ]),
                          ),
                        ])),
          /* const SizedBox(height: 20),
          SmoothPageIndicator(
              onDotClicked: (index) {
                _pcontroller.animateToPage(index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              },
              controller: _pcontroller,
              count: 2,
              effect: const ScaleEffect(
                  activeStrokeWidth: 0.1,
                  dotWidth: 8,
                  dotHeight: 8,
                  activeDotColor: Colors.black,
                  dotColor: Color.fromARGB(255, 156, 156, 156))), */
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            height: 200,
            width: double.infinity,
            child: GFBorder(
                radius: const Radius.circular(20),
                type: GFBorderType.rRect,
                dashedLine: const [10, 8],
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Lottie.asset(
                                  repeat: false,
                                  'Assets/increment.json',
                                  fit: BoxFit.cover,
                                  width: 50,
                                  height: 50),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Highest Scored Semester:",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "$highestscoredsem ",
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  '${highestcgpa.toString()} CGPA',
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Lottie.asset(
                                  repeat: false,
                                  'Assets/decrement.json',
                                  fit: BoxFit.cover,
                                  width: 50,
                                  height: 50),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Lowest Scored Semester:",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  " $lowestscoredsem",
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  '${lowestcgpa.toString()} CGPA',
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
