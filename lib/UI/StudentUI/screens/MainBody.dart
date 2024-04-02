import 'package:brainboost/UI/StudentUI/screens/SWO.dart';
import 'package:brainboost/UI/StudentUI/screens/Sem.dart';
import 'package:flutter/material.dart';

// for Colorful Icons
class MainBody extends StatefulWidget {
  const MainBody({super.key});

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  final _controller = PageController();
  String currsem = "Sem Test - 7";
  void changesem(String currsems) {
    _controller.animateToPage(0, //brings to start page
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn);
    setState(() {
      currsem = currsems;
      print(currsem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height - 300,
          child: PageView(
            controller: _controller,
            children: [
              Sem(currsem: currsem),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        /* SmoothPageIndicator(
            onDotClicked: (index) {
              _controller.animateToPage(index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn);
            },
            controller: _controller,
            count: 2,
            effect: const ScaleEffect(
                activeStrokeWidth: 0.1,
                dotWidth: 8,
                dotHeight: 8,
                activeDotColor: Colors.black,
                dotColor: Color.fromARGB(255, 156, 156, 156))) */
      ],
    );
  }
}
