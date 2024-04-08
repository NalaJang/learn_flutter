import 'package:flutter/material.dart';
import 'package:learn_fluuter_together/240405/biman/biman_view_model.dart';

class BimanMainScreen extends StatefulWidget {
  const BimanMainScreen({super.key});

  @override
  State<BimanMainScreen> createState() => _BimanMainScreenState();
}

class _BimanMainScreenState extends State<BimanMainScreen> {
  // 이 키를 통해서 해당 form 의 상태를 알 수 있다.
  final _formKey = GlobalKey<FormState>();
  final viewModel = BimanViewModel();

  void updateUI() => setState(() {});

  @override
  void initState() {
    super.initState();

    viewModel.addListener(updateUI);

    viewModel.load();
  }

  @override
  void dispose() async {
    viewModel.removeListener(updateUI);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('비민도 계산기'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _inputInfo(),
              _resultButton(),
              _resultImage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputInfo() {
    return Column(
      children: [
        TextFormField(
          controller: viewModel.heightController,
          decoration: const InputDecoration(
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
        const SizedBox(height: 16.0),
        TextFormField(
          controller: viewModel.weightController,
          decoration: const InputDecoration(
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
        const SizedBox(height: 8.0),
      ],
    );
  }

  Widget _resultButton() {
    return ElevatedButton(
      onPressed: () {
        // null 이 아닐 때는 validate(확인)을 하고, null 이면 false
        if (_formKey.currentState?.validate() == false) {
          return;
        }
        // viewModel 에서 아래 세 개의 메서드를 처리하고, 추상화한 메서드를 불러오는. => 캡슐화!
        // '결과'에 대한 결과만 호출하면 됨.
        // viewModel.save();
        // viewModel.bmiGrade();
        // viewModel.buildIcon();

        viewModel.showResult();
      },
      child: const Text('결과'),
    );
  }

  Widget _resultImage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            viewModel.bmiResult,
            style: const TextStyle(
              fontSize: 36,
            ),
          ),
          Icon(
            viewModel.icon,
            color: Colors.green,
            size: 100,
          ),
        ],
      ),
    );
  }
}
