import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sensor extends StatelessWidget {
  const Sensor({super.key});

  @override
  Widget build(BuildContext context) {
    // 위치할 이미지의 절반 값을 빼줘야(여기서는 50) 정확히 중앙 값을 얻을 수있다.
    final centerX = MediaQuery.of(context).size.width / 2 - 50;
    final centerY = MediaQuery.of(context).size.height / 2 - 50;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: centerX,
            top: centerY,
            child: Container(
              color: Colors.red,
              width: 100,
              height: 100,
            ),
          )
        ],
      ),
    );
  }
}
