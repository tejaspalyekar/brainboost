// ignore_for_file: avoid_unnecessary_containers
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/border/gf_border.dart';
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
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('Sem1', 9),
      _ChartData('Sem2', 8),
      _ChartData('Sem3', 7.5),
      _ChartData('Sem4', 6),
      _ChartData('Sem5', 8.5),
      _ChartData(
        'Sem6',
        9,
      ),
      _ChartData('Sem7', 6.9)
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
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
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black, blurRadius: 2)],
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: SfCartesianChart(
                  primaryXAxis: const CategoryAxis(
                    minimum: 0,
                  ),
                  primaryYAxis:
                      const NumericAxis(minimum: 5, maximum: 10, interval: 1),
                  tooltipBehavior: _tooltip,
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
                    )
                  ])),
          const SizedBox(height: 20),
          SmoothPageIndicator(
              onDotClicked: (index) {
                _pcontroller.animateToPage(index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              },
              controller: _pcontroller,
              count: 3,
              effect: const ScaleEffect(
                  activeStrokeWidth: 0.1,
                  dotWidth: 8,
                  dotHeight: 8,
                  activeDotColor: Colors.black,
                  dotColor: Color.fromARGB(255, 156, 156, 156))),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            height: 200,
            width: double.infinity,
            child: GFBorder(
              radius: const Radius.circular(20),
              type: GFBorderType.rRect,
              dashedLine: const [10, 8],
              child: PageView(
                controller: _pcontroller,
                children: [
                  Center(
                    child: Container(
                      child: const Text("Weak Subject 1"),
                    ),
                  ),
                  Center(
                    child: Container(
                      child: const Text("Weak Subject 2"),
                    ),
                  ),
                  Center(
                    child: Container(
                      child: const Text("Weak Subject 3"),
                    ),
                  )
                ],
              ),
            ),
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
