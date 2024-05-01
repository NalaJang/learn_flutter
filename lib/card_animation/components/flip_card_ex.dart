import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class FlipCardEx extends StatelessWidget {
  const FlipCardEx({super.key});

  _renderAppBar(context) {
    return MediaQuery.removePadding(
      context: context,
      removeBottom: true,
      child: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0x00FFFFFF),
      ),
    );
  }

  _renderContent(context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.5,
      child: Card(
        elevation: 0.0,
        margin:
            const EdgeInsets.only(left: 32.0, right: 32.0, top: 20.0, bottom: 0.0),
        color: const Color(0x00000000),
        child: FlipCard(
          // direction: FlipDirection.HORIZONTAL,
          direction: FlipDirection.VERTICAL,
          side: CardSide.FRONT,
          speed: 1000,
          onFlipDone: (status) {
            print(status);
          },
          front: Container(
            decoration: const BoxDecoration(
              color: Color(0xFF006666),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Front',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                Text('Click here to flip back',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),),
              ],
            ),
          ),
          back: Container(
            decoration: const BoxDecoration(
              color: Color(0xFF006666),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Back',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),),
                Text('Click here to flip front',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _renderContent(context),
      ],
    );
  }
}
