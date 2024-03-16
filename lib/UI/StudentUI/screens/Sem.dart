import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sem extends StatefulWidget {
  Sem({super.key, this.currsem});
  String? currsem;
  @override
  State<Sem> createState() => _SemState();
}

class _SemState extends State<Sem> {
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
          SizedBox(
            height: 35,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(widget.currsem!,
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
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("Assets/grapheg.png"), fit: BoxFit.cover),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  height: 170,
                  width: 200,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromARGB(255, 31, 31, 31),
                  ),
                ),
              ),
              Container(
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
