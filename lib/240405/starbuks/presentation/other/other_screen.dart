import 'package:flutter/material.dart';

class OtherScreen extends StatelessWidget {
  const OtherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OtherScreen'),
      ),
      body: const Center(
        child: Text(
          'OtherScreen',
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }
}
