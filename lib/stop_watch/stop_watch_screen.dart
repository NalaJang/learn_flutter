import 'dart:async';

import 'package:flutter/material.dart';

class StopWatchScreen extends StatefulWidget {
  const StopWatchScreen({super.key});

  @override
  State<StopWatchScreen> createState() => _StopWatchScreenState();
}

class _StopWatchScreenState extends State<StopWatchScreen> {
  // 처음엔 타이머가 없을테니까 null 로 받는다.
  Timer? _timer;

  int _time = 0;
  bool _isRunning = false;

  List<String> _lapTimes = [];

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('스톱워치'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '0',
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
              Text('00'),
            ],
          ),
          SizedBox(
            width: 100,
            height: 100,
            child: ListView(
              children: [
                Center(
                  child: Text(''),
                )
              ],
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.orange,
                onPressed: () {},
                child: const Icon(Icons.refresh),
              ),
              FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.play_arrow),
              ),
              FloatingActionButton(
                backgroundColor: Colors.green,
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
