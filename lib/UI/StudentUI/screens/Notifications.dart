import 'package:brainboost/UI/StudentUI/widgets/notification.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _YearToYearState();
}

class _YearToYearState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return notificationcontainer();
    },
    
    itemCount: 10,);
  }
}
