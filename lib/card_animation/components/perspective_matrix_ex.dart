import 'package:flutter/material.dart';

class PerspectiveMatrixEx extends StatefulWidget {
  const PerspectiveMatrixEx({super.key});

  @override
  State<PerspectiveMatrixEx> createState() => _PerspectiveMatrixExState();
}

class _PerspectiveMatrixExState extends State<PerspectiveMatrixEx> {
  double x = 0;
  double y = 0;
  double z = 0;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4(
        1,0,0,0,
        0,1,0,0,
        0,0,1,0,
        0,0,0,1,
      )..rotateX(x),
        // ..rotateX(x)..rotateY(y)..rotateZ(z),
      alignment: FractionalOffset.center,
      child: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            // y = y - details.delta.dx / 100;

            // x 축을 따라 세로로 스와이프한다.
            x = x + details.delta.dy / 100;
          });
        },
        child: Container(
          color: Colors.red,
          height: 200.0,
          width: 200.0,
        ),
      ),
    );
  }
}
