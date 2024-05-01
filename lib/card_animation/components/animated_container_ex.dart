import 'package:flutter/material.dart';

class SwipeCardEx extends StatefulWidget {
  const SwipeCardEx({super.key});

  @override
  State<SwipeCardEx> createState() => _SwipeCardExState();
}

class _SwipeCardExState extends State<SwipeCardEx> {
  bool isCardFlipped = false;

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
      child: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.width * 0.5,
          color: Colors.blue,
          child: isCardFlipped
              ? Center(
                  child: Text(
                    'Back of Card',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                )
              : Center(
                  child: Text(
                    'Front of Card',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
