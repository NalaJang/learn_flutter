import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ShopScreen'),
      ),
      body: const Center(
        child: Text(
          'ShopScreen',
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }
}
