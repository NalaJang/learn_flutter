import 'package:flutter/material.dart';
import 'package:learn_fluuter_together/240403/business_card.dart';
import 'package:learn_fluuter_together/240403/birthday_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BirthdayCard(),
    );
  }
}
