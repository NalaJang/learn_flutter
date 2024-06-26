import 'package:flutter/material.dart';

import 'biman/biman_main_screen.dart';
import 'starbuks/presentation/main/main_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BimanMainScreen(),
    );
  }
}
