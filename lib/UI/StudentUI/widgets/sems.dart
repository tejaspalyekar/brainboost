import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SemsContainer extends StatelessWidget {
  SemsContainer({super.key, this.currsem});
  String? currsem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Ink(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 46, 46, 46),
        ),
        height: 120,
        width: double.infinity,
        child: InkWell(
          onTap: () {},
          splashColor: const Color.fromARGB(169, 250, 193, 21),
          child: Text(currsem!,
              style: GoogleFonts.roboto(
                color: Colors.amberAccent,
                fontSize: 10,
              ),
              textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
