import 'package:flutter/material.dart';
import 'package:learn_fluuter_together/constants/texts.dart';

class EFrequency extends StatelessWidget {
  const EFrequency({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image.asset(
              'assets/images/star_bucks/img_frequency.png',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        const Positioned(
          top: 20,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Texts.startBucksEventTitle,
                style: TextStyle(
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(Texts.startBucksEventDate),
            ],
          ),
        ),
        const Positioned(
          bottom: 20,
          left: 10,
          right: 60,
          child: Text(
            Texts.starBucksEventDescription,
          ),
        ),
      ],
    );
  }
}
