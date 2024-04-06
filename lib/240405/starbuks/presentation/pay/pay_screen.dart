import 'package:flutter/material.dart';

class PayScreen extends StatelessWidget {
  const PayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PayScreen'),
      ),
      body: const Center(
        child: Text(
          'PayScreen',
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }
}
