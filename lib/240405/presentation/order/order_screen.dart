import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OrderScreen'),
      ),
      body: const Center(
        child: Text(
          'OrderScreen',
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }
}
