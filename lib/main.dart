import 'package:flutter/material.dart';
import 'package:learn_fluuter_together/business_card.dart';
import 'package:learn_fluuter_together/birthday_card.dart';

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
