import 'package:flutter/material.dart';

class TeacherDashboard extends StatelessWidget {
  var currbatch = "20-24";

  var batchcount = 150;

  TeacherDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(20),
                  splashColor: Color.fromARGB(255, 85, 46, 255),
                  child: Ink(
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 87, 0, 250),
                              blurRadius: 5),
                        ],
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 124, 95, 255),
                          Color.fromARGB(255, 204, 193, 253),
                        ]),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    width: double.infinity,
                    height: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: const Icon(
                            Icons.calendar_month,
                            color: Color.fromARGB(255, 111, 0, 255),
                            size: 35,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Batch of \n $currbatch',
                            style: const TextStyle(
                                fontSize: 19,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {},
                  splashColor: Color.fromARGB(197, 0, 121, 143),
                  child: Ink(
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(197, 0, 121, 143),
                              blurRadius: 5),
                        ],
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(197, 0, 225, 255),
                          Color.fromARGB(197, 212, 253, 255),
                        ]),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    width: double.infinity,
                    height: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: const Icon(
                            Icons.school_sharp,
                            color: Color.fromARGB(255, 0, 164, 170),
                            size: 35,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Total Count \n $batchcount',
                            style: const TextStyle(
                                fontSize: 19,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),

        ],
      ),
    );
  }
}
