import 'package:flutter/material.dart';

class notificationcontainer extends StatelessWidget {
  const notificationcontainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 5),
      child: Column(
        children: [
          Container(
            color: const Color.fromARGB(255, 233, 231, 226),
            height: 80,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 250, 241, 162),
                      image: const DecorationImage(
                          image: AssetImage("Assets/teacher1.png"),
                          fit: BoxFit.cover),
                      border: Border.all(color: Colors.black, width: 3),
                      borderRadius: BorderRadius.circular(100)),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Teacher: XYZ"),
                      Text("Message: abcdefg....."),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "1hr ago",
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
