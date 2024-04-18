import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _YearToYearState();
}

class _YearToYearState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: Row(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width - 70,
                child: TextField(
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.attach_file_rounded),
                      filled: true,
                      fillColor: Color.fromARGB(143, 187, 187, 187),
                      hintText: "Message..",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                )),
            const SizedBox(
              width: 10,
            ),
            CircleAvatar(
              backgroundColor: Color.fromARGB(255, 34, 34, 34),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 18,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
