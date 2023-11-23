import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Swo extends StatefulWidget {
  const Swo({super.key});

  @override
  State<Swo> createState() => _SwoState();
}

class _SwoState extends State<Swo> {
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
                  child: Text('Subject Wise Observation ',
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
                    image: AssetImage("Assets/graph2.png"), fit: BoxFit.cover),
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
                  margin: const EdgeInsets.only(left: 20, right: 10),
                  height: 170,
                  width: 210,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromARGB(255, 31, 31, 31),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text("Your Performance",
                          style: TextStyle(fontSize: 14)),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 25,
                        height: 5,
                        color: const Color.fromARGB(255, 107, 2, 194),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Text("Predicted \nPerformance",
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
                        width: 25,
                        height: 5,
                        color: const Color.fromARGB(255, 255, 7, 201),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Text("Avg in Subject",
                          style: TextStyle(fontSize: 14)),
                      const SizedBox(
                        width: 10,
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Container(
                        width: 25,
                        height: 5,
                        color: const Color.fromARGB(255, 228, 176, 5),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
    
  }
}
