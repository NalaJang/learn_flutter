import 'package:flutter/material.dart';
import 'package:learn_flutter_together/card_animation/components/animated_container_ex.dart';
import 'package:learn_flutter_together/card_animation/components/animated_switcher_ex.dart';
import 'package:learn_flutter_together/card_animation/components/flip_card_ex.dart';
import 'package:learn_flutter_together/card_animation/components/perspective_matrix_ex.dart';

class CardAnimation extends StatefulWidget {
  const CardAnimation({super.key});

  @override
  State<CardAnimation> createState() => _CardAnimationState();
}

class _CardAnimationState extends State<CardAnimation> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SwipeCardEx(),
            SizedBox(height: 30),
            AnimatedSwitcherEx(),
            SizedBox(height: 30),
            PerspectiveMatrixEx(),
            SizedBox(height: 30),
            FlipCardEx(),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
