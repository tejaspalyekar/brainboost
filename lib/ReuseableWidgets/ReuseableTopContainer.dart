import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReuseableTopContainer extends StatelessWidget {
  ReuseableTopContainer(
      {super.key, required this.title1, this.title2, required this.fun});

  void Function() fun;
  String title1;
  String? title2;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 270,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: fun,
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 35,
                    color: Colors.white,
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 13),
                child: Text(
                  "$title1 \n $title2",
                  style: GoogleFonts.roboto(color: Colors.white, fontSize: 35),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10, top: 40),
            child: Hero(
                tag: "tag",
                child: Image.asset(
                  'Assets/brainboostonlylogo.png',
                  color: const Color.fromARGB(160, 255, 255, 255),
                  width: 100,
                )),
          )
        ],
      ),
    );
  }
}
