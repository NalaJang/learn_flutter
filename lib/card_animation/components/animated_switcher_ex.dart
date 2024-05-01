import 'package:flutter/material.dart';

class AnimatedSwitcherEx extends StatefulWidget {
  const AnimatedSwitcherEx({super.key});

  @override
  State<AnimatedSwitcherEx> createState() => _AnimatedSwitcherExState();
}

class _AnimatedSwitcherExState extends State<AnimatedSwitcherEx> {
  bool isCardFlipped = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        // Swipe up
        if (details.delta.dy < -6 && !isCardFlipped) {
          setState(() {
            isCardFlipped = true;
          });
        }
        // Swipe down
        else if (details.delta.dy > 6 && isCardFlipped) {
          setState(() {
            isCardFlipped = false;
          });
        }
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(scale: animation, child: child);
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.width * 0.5,
          decoration: BoxDecoration(
            color: isCardFlipped ? Colors.orange : Colors.yellow,
            borderRadius: BorderRadius.circular(4),
          ),
          key: ValueKey<bool>(isCardFlipped),
        ),
      ),
    );
  }
}
