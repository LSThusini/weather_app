import 'package:flutter/material.dart';

class NextDays extends StatefulWidget {
  const NextDays({super.key});

  @override
  State<NextDays> createState() => _NextDaysState();
}

class _NextDaysState extends State<NextDays> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Row(children: [
        Icon(
          Icons.calendar_month_outlined,
          size: 36,
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          "This Week",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ]),
    );
  }
}
