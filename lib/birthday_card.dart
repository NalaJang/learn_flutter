import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BirthdayCard extends StatelessWidget {
  const BirthdayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Lottie.asset('assets/images/lottie_blur.json')
          // Lottie.network(
          //     'https://lottie.host/d166e944-e817-4dbd-95f2-17ef57958e59/bEN4xHnhnn.json'),
          // const Text(
          //   'HAPPY BIRTHDAY',
          //   style: TextStyle(
          //     color: Colors.white,
          //     fontSize: 30.0,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          // const Text(
          //   'MY SWEET 💗',
          //   style: TextStyle(
          //     color: Colors.white,
          //     fontSize: 30.0,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
        ],
      ),
    );
  }
}
