import 'package:brainboost/UI/StudentUI/screens/MainBody.dart';
import 'package:brainboost/UI/StudentUI/screens/Po.dart';
import 'package:brainboost/UI/StudentUI/screens/YearToYearAssesment.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Overview extends StatefulWidget {
  const Overview({
    super.key,
  });
  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  int bodyidx = 0;
  double iconsize = 30;
  double textsize = 18;
  Color iconcolour = Colors.black;
  FontWeight fontWeight = FontWeight.normal;

  double iconsize1 = 30;
  double textsize1 = 18;
  Color iconcolour1 = Colors.black;
  FontWeight fontWeight1 = FontWeight.normal;

  double iconsize2 = 30;
  double textsize2 = 18;
  Color iconcolour2 = Colors.black;
  FontWeight fontWeight2 = FontWeight.normal;

  Color dot1 = const Color.fromARGB(255, 255, 255, 255);
  Color dot2 = Colors.white;
  Color dot3 = Colors.white;
  void currentBody(int no) {
    setState(() {
      bodyidx = no;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget body = const MainBody();

    if (bodyidx == 1) {
      iconsize = 30;
      textsize = 18;
      iconcolour = const Color.fromARGB(211, 97, 97, 97);
      fontWeight = FontWeight.normal;

      iconsize1 = 33;
      textsize1 = 20;
      iconcolour1 = Colors.black;
      fontWeight1 = FontWeight.bold;

      iconsize2 = 30;
      textsize2 = 18;
      iconcolour2 = const Color.fromARGB(209, 97, 97, 97);
      fontWeight2 = FontWeight.normal;
      body = const PO();
    } else if (bodyidx == 2) {
      iconsize = 30;
      textsize = 18;
      iconcolour = const Color.fromARGB(207, 97, 97, 97);
      fontWeight = FontWeight.normal;

      iconsize1 = 30;
      textsize1 = 18;
      iconcolour1 = const Color.fromARGB(202, 97, 97, 97);
      fontWeight1 = FontWeight.normal;

      iconsize2 = 33;
      textsize2 = 20;
      iconcolour2 = Colors.black;
      fontWeight2 = FontWeight.bold;
      body = const YearToYear();
    } else {
      iconsize = 33;
      textsize = 20;
      iconcolour = Colors.black;
      fontWeight = FontWeight.bold;

      iconsize1 = 30;
      textsize1 = 18;
      iconcolour1 = Color.fromARGB(186, 97, 97, 97);
      fontWeight1 = FontWeight.normal;

      iconsize2 = 30;
      textsize2 = 18;
      iconcolour2 = Color.fromARGB(211, 97, 97, 97);
      fontWeight2 = FontWeight.normal;
    }
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    currentBody(0);
                  },
                  child: Row(
                    children: [
                      Icon(
                        FluentIcons.number_circle_1_48_regular,
                        size: iconsize,
                        color: iconcolour,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        "Overview",
                        style: GoogleFonts.roboto(
                            color: iconcolour, //same clr for text
                            fontSize: textsize,
                            fontWeight: fontWeight),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    currentBody(1);
                  },
                  child: Row(
                    children: [
                      Icon(
                        FluentIcons.number_circle_2_48_regular,
                        size: iconsize1,
                        color: iconcolour1,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        "PO",
                        style: GoogleFonts.roboto(
                            color: iconcolour1,
                            fontSize: textsize1,
                            fontWeight: fontWeight1),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    currentBody(2);
                  },
                  child: Row(
                    children: [
                      Icon(
                        FluentIcons.number_circle_3_48_regular,
                        size: iconsize2,
                        color: iconcolour2,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        "YTY Assesment",
                        style: GoogleFonts.roboto(
                            color: iconcolour2,
                            fontSize: textsize2,
                            fontWeight: fontWeight2),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        body,
      ],
    );
  }
}
