import 'package:flutter/material.dart';
import 'package:learn_fluuter_together/240405/biman/result_screen.dart';

class BimanMainScreen extends StatefulWidget {
  const BimanMainScreen({super.key});

  @override
  State<BimanMainScreen> createState() => _BimanMainScreenState();
}

class _BimanMainScreenState extends State<BimanMainScreen> {
  // 이 키를 통해서 해당 form 의 상태를 알 수 있다.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('비민도 계산기'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '키',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '키를 입력하세요.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '몸무게',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '몸무게를 입력하세요.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () {
                  // null 이 아닐 때는 validate(확인)을 하고, null 이면 false
                  if (_formKey.currentState?.validate() ?? false) {
                    return;
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ResultScreen(height: 0.0, weight: 0.0),
                    ),
                  );
                },
                child: Text('결과'),
              )
            ],
          ),
        ),
      ),
    );
  }
}