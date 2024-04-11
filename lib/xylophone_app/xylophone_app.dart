import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('실로폰'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: gunban('도', Colors.red),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: gunban('레', Colors.green),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: gunban('미', Colors.orange),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: gunban('파', Colors.deepOrangeAccent),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 46.0),
            child: gunban('솔', Colors.purple),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 54.0),
            child: gunban('라', Colors.amber),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 60.0),
            child: gunban('시', Colors.blue),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 69.0),
            child: gunban('도', Colors.lightBlueAccent),
          ),
        ],
      ),
    );
  }

  Widget gunban(String text, Color color) {
    return Container(
      width: 50,
      height: double.infinity,
      color: color,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
