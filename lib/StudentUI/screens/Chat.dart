import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _YearToYearState();
}

class _YearToYearState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("chats")
      ],
    );
  }
}
