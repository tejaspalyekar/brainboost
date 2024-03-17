import 'package:brainboost/Services/semMarksService.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';

class Sem extends StatefulWidget {
  Sem({super.key, this.currsem});
  String? currsem;
  @override
  State<Sem> createState() => _SemState();
}

class _SemState extends State<Sem> {
  SemMarksService Semmarksservice = SemMarksService();
  bool grapgloading = true;
  final List<FlSpot> points = [
    /*const FlSpot(1,
        55), //ml FlSpot(x,y) x= subject no  y = marks obtained in that subject
    const FlSpot(2, 50), //csl
    const FlSpot(3, 65), //bkc
    const FlSpot(4, 60), //bda
    const FlSpot(5, 64), //nlp*/
  ];
  final List<FlSpot> avg = [
    /*const FlSpot(1, 60), //ml
    const FlSpot(2, 60), //csl
    const FlSpot(3, 60), //bkc
    const FlSpot(4, 60), //bda
    const FlSpot(5, 60), //nlp*/
  ];
  var items = ['Sem 1', 'Sem 2', 'Sem 3', 'Sem 4', 'Sem 5', 'Sem 6', 'Sem 7'];
  String dropdownvalue = 'Sem 1';
  List studentsmarks = [
    ["desalechirag-cmpn@atharvacoe.ac.in", 9.9],
    ["makwanadivya-cmpn@atharvacoe.ac.in", 9.0],
    ["yadavarvind-cmpn@atharvacoe.ac.in", 9.3],
    ["addagatlahrishikesh-cmpn@atharvacoe.ac.in", 9.0],
    ["adenisha-cmpn@atharvacoe.ac.in", 9.2],
    ["agrawalshree-cmpn@atharvacoe.ac.in", 9.2],
    ["khanahezamahewar-cmpn@atharvacoe.ac.in", 9.7],
    ["ankushraoapurva-cmpn@atharvacoe.ac.in", 8.5],
    ["balekarshruti-cmpn@atharvacoe.ac.in", 9.5],
    ["bandivadekardhruvesh-cmpn@atharvacoe.ac.in", 9.7],
    ["bandiwadekarparth-cmpn@atharvacoe.ac.in", 8.3],
    ["bhalekarnupur-cmpn@atharvacoe.ac.in", 9.0],
    ["bhatadedevraj-cmpn@atharvacoe.ac.in", 8.8],
    ["bhattswati-cmpn@atharvacoe.ac.in", 9.1],
    ["bogharanirmal-cmpn@atharvacoe.ac.in", 9.0],
    ["borlikartanishka-cmpn@atharvacoe.ac.in", 9.5],
    ["chandradhaval-cmpn@atharvacoe.ac.in", 9.1],
    ["chaudharivaibhav-cmpn@atharvacoe.ac.in ", 9.4],
    ["Chauhanshlok-cmpn@atharvacoe.ac.in", 9.2],
    ["dhageaditya-cmpn@atharvacoe.ac.in", 8.6],
    ["epilirahul-cmpn@atharvacoe.ac.in", 8.9],
    ["gadeamogh-cmpn@atharvacoe.ac.in", 9.4],
    ["gajorajay-cmpn@atharvacoe.ac.in", 9.6],
    ["gaonkarisha-cmpn@atharvacoe.ac.in", 9.4],
    ["gawadesagar-cmpn@atharvacoe.ac.in", 9.0],
    ["girichanchal-cmpn@atharvacoe.ac.in", 9.5],
    ["guptaprince-cmpn@atharvacoe.ac.in", 8.7],
    ["hadalharshal-cmpn@atharvacoe.ac.in ", 9.0],
    ["guptashivamrajkumar-cmpn@atharvacoe.ac.in", 9.5],
    ["jadhavruchika-cmpn@athavacoe.ac.in", 9.2],
    ["jagtappranav-cmpn@atharvacoe.ac.in", 9.1],
    ["jagtapshruti-cmpn@atharvacoe.ac.in", 9.0],
    ["jethvamitesh-cmpn@atharvacoe.ac.in", 8.9],
    ["Jhalakamlendrasingh-cmpn@atharvacoe.ac.in", 8.8],
    ["joshiaman-cmpn@atharvacoe.ac.in", 8.8],
    ["kadamsakshi-cmpn@atharvacoe.ac.in", 9.4],
    ["kadamshantanu-cmpn@atharvacoe.ac.in", 8.8],
    ["kanganeantara-cmpn@atharvacoe.ac.in", 9.0],
    ["kawletanvi-cmpn@atharvacoe.ac.in", 9.4],
    ["khaleshubham-cmpn@atharvacoe.ac.in", 9.4],
    ["khanaadilnasiruddin-cmpn@atharvacoe.ac.in", 9.7],
    ["kinipranav-cmpn@atharvacoe.ac.in", 9.4],
    ["kotashashank-cmpn@atharvacoe.ac.in", 9.2],
    ["kothariashritha-cmpn@atharvacoe.ac.in", 9.7],
    ["Lohiyakushal-cmpn@atharvacoe.ac.in ", 9.2],
    ["manesiariyaan-cmpn@atharvacoe.ac.in", 8.8],
    ["mishrapushpesh-cmpn@atharvacoe.ac.in ", 8.9],
    ["Mishraswati-cmpn@atharvacoe.ac.in", 9.2],
    ["mistrykunal-cmpn@atharvacoe.ac.in", 9.6],
    ["abdulrehman-cmpn@atharvacoe.ac.in", 9.7],
    ["moresairaj-cmpn@atharvacoe.ac.in", 9.1],
    ["myanagaurav@atharvacoe.ac.in", 9.3],
    ["suhasinigunjite-cmpn@atharvacoe.ac.in", 8.7],
    ["vrushalbhurkud-cmpn@atharvacoe.ac.in", 8.8],
    ["shaikhsanib-cmpn@atharvacoe.ac.in", 8.8],
    ["advaysurve-cmpn@atharvacoe.ac.in", 9.3],
    ["tejaspalyekar-cmpn@atharvacoe.ac.in", 8.9],
    ["kulashreepatil-cmpn@atharvacoe.ac.in", 8.9],
    ["rahulsutar-cmpn@atharvacoe.ac.in", 9.4],
    ["sahiln-cmpn@atharvacoe.ac.in", 9.1],
    ["shrishtisoni-cmpn@atharvacoe.ac.in", 9.5],
    ["chaitrasuvarna-cmpn@atharvacoe.ac.in", 9.1],
    ["ameyabavkar-cmpn@atharvacoe.ac.in", 9.3],
    ["omkarshinde-cmpn@atharvacoe.ac.in", 8.8],
    ["killedaryojana-cmpn@atharvacoe.ac.in", 9.0],
    ["abhishekgoykar-cmpn@atharvacoe.ac.in ", 9.2],
    ["shwetajalgaonkar-cmpn@atharvacoe.ac.in", 9.2],
    ["naikneha-cmpn@atharvacoe.ac.in", 9.0],
    ["nandeshwarriya-cmpn@atharvacoe.ac.in", 9.0],
    ["nikamdevesh-cmpn@atharvacoe.ac.in", 8.5],
    ["nikammanthan-cmpn@atharvacoe.ac.in", 9.5],
    ["nikampranav-cmpn@atharvacoe.ac.in", 9.2],
    ["panandeprachi-cmpn@atharvacoe.ac.in", 9.5],
    ["parabprathmesh-cmpn@atharvacoe.ac.in", 9.1],
    ["parayearyan-cmpn@atharvacoe.ac.in ", 8.7],
    ["patelbobby-cmpn@atharvacoe.ac.in", 9.2],
    ["patelsania-cmpn@atharvacoe.ac.in", 8.6],
    ["patilpavan-cmpn@atharvacoe.ac", 9.1],
    ["patilresham-cmpn@atharvacoe.ac.in", 9.2],
    ["patilsanket-cmpn@atharvacoe.ac.in ", 8.9],
    ["pawarmitali-cmpn@atharvacoe.ac.in", 9.3],
    ["pawarmonali-cmpn@atharvacoe.ac.in", 9.4],
    ["Piseaditya-cmpn@atharvacoe.ac.in ", 9.4],
    ["poriwadeakanksha-cmpn@atharvacoe.ac.in ", 9.7],
    ["prajapatisuraj-cmpn@atharvacoe.ac.in", 9.3],
    ["rathodkeval-cmpn@atharvacoe.ac.in", 9.2],
    ["rathodpriyanshu-cmpn@atharvacoe.ac.in", 9.0],
    ["rathodmihir-cmpn@atharvacoe.ac.in", 9.1],
    ["redkargaurav-cmpn@atharvacoe.ac.in", 9.8],
    ["sahsneha-cmpn@atharvacoe.ac.in", 9.0],
    ["sangarprachi-cmpn@atharvacoe.ac.in", 9.3],
    ["sangleprem-cmpn@atharvacoe.ac.in", 9.2],
    ["sardharasmit-cmpn@atharvacoe.ac.in", 9.6],
    ["saseom-cmpn@atharvacoe.ac.in", 9.0],
    ["satheshubham-cmpn@atharvacoe.ac.in", 8.5],
    ["sawantryan-cmpn@atharvacoe.ac.in", 9.1],
    ["omkarsawant-cmpn@atharvacoe.ac.in", 9.4],
    ["shaikhamir-cmpn@atharvacoe.ac.in", 9.6],
    ["shaikhjamil-cmpn@atharvacoe.ac.in", 9.7],
    ["shaikhsameer-cmpn@atharvacoe.ac.in", 9.2],
    ["sharmaaniket-cmpn@atharvacoe.ac.in", 9.6],
    ["shrmasunil-cmpn@atharvacoe.ac.in", 8.8],
    ["shelkesaurav-cmpn@atharvacoe.ac.in", 9.2],
    ["shettyprajnesh-cmpn@atharvacoe.ac.in", 9.6],
    ["shindedigvijay-cmpn@atharvacoe.ac.in", 9.1],
    ["shinderutuja-cmpn@atharvacoe.ac.in", 9.5],
    ["shingaredevyani-cmpn@atharvacoe.ac.in", 9.1],
    ["singhsoumya-cmpn@atharvacoe.ac.in", 9.4],
    ["singhpriyanshu-cmpn@atharvacoe.ac.in", 9.1],
    ["singhrohan-cmpn@atharvacoe.ac.in", 9.5],
    ["singhsakshi-cmpn@atharvacoe.ac.in", 9.2],
    ["sojitraparth-cmpn@atharvacoe.ac.in", 9.2],
    ["solankidivy-cmpn@atharvacoe.ac.in", 9.5],
    ["solankivenus-cmpn@atharva.coe.ac.in", 9.4],
    ["suvarnagautam-cmpn@atharvacoe.ac.in", 8.4],
    ["tankpratham-cmpn@atharvacoe.ac.in", 8.9],
    ["tayadesiddharth-cmpn@atharvacoe.ac.in ", 8.8],
    ["telikrushna-cmpn@atharvacoe.ac.in", 9.0],
    ["thakurshyam-cmpn@atharvacoe.ac.in", 9.2],
    ["tirlotkarpradnya-cmpn@atharvacoe.ac.in", 9.0],
    ["tripathiadarsh-cmpn@atharvacoe.ac.in", 8.9],
    ["tripathiankush-cmpn@atharvacoe.ac.in", 9.3],
    ["ubalevanshika-cmpn@atharvacoe.ac.in", 9.2],
    ["vannamdeepali-cmpn@atharvacoe.ac.in", 9.2],
    ["vartakvedant-cmpn@atharvacoe.ac.in", 9.7],
    ["wadiaaman-cmpn@atharvacoe.ac.in", 8.8],
    ["waghchaureaayush-cmpn@atharvacoe.ac.in", 9.2],
    ["waradkarsahil-cmpn@atharvacoe.ac.in", 8.9],
    ["yadavudit-cmpn@atharvacoe.ac.in", 8.6],
    ["devresushant-cmpn@atharvacoe.ac.in", 7.9]
  ];
  double avgcgpa = 9.15;
  double currstudentcgpa = 9.2;
  late FlSpot yourperformance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Semmarksservice.getcurrsemmarks("", dropdownvalue);
    mapdatapoints();
  }

  mapdatapoints() {
    print(studentsmarks.length);
    for (int i = 0; i < studentsmarks.length; i++) {
      avg.add(FlSpot(i + 1, avgcgpa));
      points.add(FlSpot(i.toDouble() + 1, studentsmarks[i][1]));
      if (studentsmarks[i][0] == "kotashashank-cmpn@atharvacoe.ac.in") {
        yourperformance = FlSpot(i + 1, studentsmarks[i][1]);
      }
    }
    setState(() {
      grapgloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)]),
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Text(dropdownvalue,
                            style: GoogleFonts.roboto(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                            ))),
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
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.only(bottom: 10),
                  height: 220,
                  width: double.infinity,
                  child: grapgloading
                      ? const Center(
                          child: SizedBox(
                              height: 100,
                              width: 100,
                              child: CircularProgressIndicator()),
                        )
                      : AnimatedPositionedDirectional(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                          child: LineChart(
                              curve: Curves.bounceInOut,
                              LineChartData(
                                maxY: 10,
                                maxX: studentsmarks.length.toDouble(),
                                minY: 0,
                                backgroundColor:
                                    const Color.fromARGB(255, 32, 32, 32),
                                lineBarsData: [
                                  LineChartBarData(
                                      dotData: const FlDotData(show: false),
                                      color:
                                          const Color.fromARGB(255, 24, 204, 0),
                                      spots: avg),
                                  LineChartBarData(
                                      isStrokeCapRound: true,
                                      isStrokeJoinRound: true,
                                      spots: points,
                                      dotData: FlDotData(
                                        getDotPainter:
                                            (spot, percent, barData, index) {
                                          final isYourPerformance =
                                              spot.x == yourperformance.x &&
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
                                      gradient: const LinearGradient(colors: [
                                        Color.fromARGB(255, 111, 18, 218),
                                        Color.fromARGB(255, 119, 0, 255),
                                        Color.fromARGB(255, 145, 49, 255),
                                      ])),
                                ],
                                borderData: FlBorderData(
                                    border: const Border(
                                        bottom: BorderSide(),
                                        left: BorderSide())),
                                gridData: const FlGridData(show: false),
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
                              )),
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
                child: Container(
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  padding: const EdgeInsets.all(10),
                  height: 140,
                  width: 180,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromARGB(255, 31, 31, 31),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Exam Stats:",
                            style: TextStyle(
                                color: Color.fromARGB(244, 255, 255, 255)),
                          ),
                          Icon(
                            Icons.more_horiz_sharp,
                            color: Colors.white,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Avg at:  $avgcgpa",
                        style: const TextStyle(
                            color: Color.fromARGB(214, 255, 255, 255),
                            fontSize: 12),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "You at:  ${currstudentcgpa.toString()}",
                        style: const TextStyle(
                            color: Color.fromARGB(214, 255, 255, 255),
                            fontSize: 12),
                      ),
                    ],
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
    );
    ;
  }
}
