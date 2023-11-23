// ignore_for_file: avoid_unnecessary_containers

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
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 210,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("Assets/yty.png"), fit: BoxFit.cover),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
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
                dotWidth: 13,
                dotHeight: 13,
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
