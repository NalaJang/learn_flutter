import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sensors_plus/sensors_plus.dart';

class Sensor extends StatelessWidget {
  const Sensor({super.key});

  @override
  Widget build(BuildContext context) {
    // 가로 모드 고정
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    // 위치할 이미지의 절반 값을 빼줘야(여기서는 50) 정확히 중앙 값을 얻을 수있다.
    final centerX = MediaQuery.of(context).size.width / 2 - 50;
    final centerY = MediaQuery.of(context).size.height / 2 - 50;

    return Scaffold(
      body: Stack(
        children: [
          StreamBuilder<AccelerometerEvent>(
              stream: accelerometerEventStream(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final event = snapshot.data!;
                // x, y, z 에 대한 의미는 문서 확인
                // List<double> accelerometerValues = [event.x, event.y, event.z];
                // print(accelerometerValues);

                return Positioned(
                    left: centerX + event.x * 20,
                    top: centerY + event.x * 20,
                    child:
                        // Container(
                        //   decoration: const BoxDecoration(
                        //     shape: BoxShape.circle,
                        //     color: Colors.green,
                        //   ),
                        //   width: 100,
                        //   height: 100,
                        // ),
                        Image.asset(
                      'assets/images/img_ski.png',
                      width: 100,
                      height: 100,
                    ));
              })
        ],
      ),
    );
  }
}
