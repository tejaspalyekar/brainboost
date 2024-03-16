
import 'package:brainboost/UI/StudentUI/model/semlist.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SemMenu extends StatefulWidget {
  SemMenu({super.key, this.changesem});

  final Function? changesem;
  @override
  State<SemMenu> createState() => _SemMenuState();
}

class _SemMenuState extends State<SemMenu> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Semester Menu",
            style: GoogleFonts.openSans(
                fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(
          height: 500,
          width: double.infinity,
          child: ListView.builder(
            itemCount: sem.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Ink(
                  height: 120,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        sem.add(previoussem);
                        previoussem = sem[index];
                        print(sem.remove(previoussem));
                        sem.sort();
                        widget.changesem!(previoussem);
                        print(sem);
                      });
                    },
                    splashColor: Colors.amber,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 59, 59, 59),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      margin: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10, top: 10),
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          sem[index],
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            color: const Color.fromARGB(255, 255, 230, 0),
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
