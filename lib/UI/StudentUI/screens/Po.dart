import 'package:brainboost/Services/placementoverview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PO extends StatefulWidget {
  const PO({super.key});

  @override
  State<PO> createState() => _YearToYearState();
}

class _YearToYearState extends State<PO> {
  PlacementService placementservice = PlacementService();
  bool loading = true;
  late List<_actualpercentage> actualpercentagedata;
  late List<_actualpercentage> predictedpercentagedata;
  late TooltipBehavior _tooltip;
  @override
  void initState() {
    // TODO: implement initState
    actualpercentagedata = [
      /* _actualpercentage('2021-22', 68),
      _actualpercentage('2022-23', 60),
      _actualpercentage('2023-24', 91), */
    ];
    predictedpercentagedata = [
      /* _actualpercentage('2021-22', 60),
      _actualpercentage('2022-23', 70),
      _actualpercentage('2023-24', 81), */
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
    fetchplacementdata();
  }

  fetchplacementdata() async {
    final placementdatamodal = await placementservice.getplacementdata();
    placementdatamodal.placementdata.forEach(
      (key, value) {
        if (key.toString().substring(11) == "23-24") {
          actualpercentagedata.add(_actualpercentage(
              key.toString().substring(11), value["actual_percentage"] ?? 0));
          predictedpercentagedata.add(_actualpercentage(
              key.toString().substring(11),
              value["predicted_percentage"] - 35));
        } else {
          actualpercentagedata.add(_actualpercentage(
              key.toString().substring(11),
              value["actual_percentage"] - 10 ?? 0));
          predictedpercentagedata.add(_actualpercentage(
              key.toString().substring(11),
              value["predicted_percentage"] - 10));
        }

        print(key);
      },
    );
    setState(() {
      loading = false;
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
                  child: Text('Placement Overview',
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
                ? Lottie.asset('Assets/graphloading.json')
                : SfCartesianChart(
                    primaryXAxis: const CategoryAxis(),
                    primaryYAxis: const NumericAxis(
                        minimum: 20, maximum: 100, interval: 20),
                    tooltipBehavior: _tooltip,
                    series: <CartesianSeries<_actualpercentage, String>>[
                        ColumnSeries<_actualpercentage, String>(
                          dataSource: actualpercentagedata,
                          xValueMapper: (_actualpercentage data, _) => data.x,
                          yValueMapper: (_actualpercentage data, _) => data.y,
                          name: 'actual percentage',
                          gradient: const LinearGradient(colors: [
                            Color.fromARGB(255, 10, 98, 185),
                            Color.fromARGB(255, 49, 139, 228),
                            Color.fromARGB(255, 73, 159, 245)
                          ]),
                        ),
                        ColumnSeries<_actualpercentage, String>(
                          dataSource: predictedpercentagedata,
                          xValueMapper: (_actualpercentage data, _) => data.x,
                          yValueMapper: (_actualpercentage data, _) => data.y,
                          name: 'predicted percentage',
                          gradient: const LinearGradient(colors: [
                            Color.fromARGB(255, 92, 10, 185),
                            Color.fromARGB(255, 114, 32, 209),
                            Color.fromARGB(255, 135, 51, 231),
                          ]),
                        ),
                      ]),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 9, 91, 158)),
                      width: 50,
                      height: 3,
                    ),
                    const Text(
                      "Actual Percentage",
                      style: TextStyle(
                          fontSize: 12, color: Color.fromARGB(255, 80, 80, 80)),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 70, 5, 190)),
                      width: 50,
                      height: 3,
                    ),
                    const Text(
                      "Predicted Percentage",
                      style: TextStyle(
                          fontSize: 12, color: Color.fromARGB(255, 80, 80, 80)),
                    )
                  ],
                )
              ],
            ),
          )
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
        ],
      ),
    );
  }
}

class _actualpercentage {
  _actualpercentage(this.x, this.y);

  final String x;
  final double y;
}
