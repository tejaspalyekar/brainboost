import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PO extends StatefulWidget {
  const PO({super.key});

  @override
  State<PO> createState() => _YearToYearState();
}

class _YearToYearState extends State<PO> {
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
          ),
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
