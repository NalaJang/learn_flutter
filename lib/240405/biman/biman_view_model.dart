import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BimanViewModel with ChangeNotifier {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  String _bmiResult = '저체중';
  IconData _icon = Icons.sentiment_dissatisfied;

  TextEditingController get heightController => _heightController;

  TextEditingController get weightController => _weightController;

  String get bmiResult => _bmiResult;

  IconData get icon => _icon;

  void load() async {
    final prefs = await SharedPreferences.getInstance();
    // getDouble 은 Future 가 아님.
    final double? height = prefs.getDouble('height');
    final double? weight = prefs.getDouble('weight');

    if (height != null && weight != null) {
      _heightController.text = '$height';
      _weightController.text = '$weight';
    }

    notifyListeners();
  }

  void save() async {
    final prefs = await SharedPreferences.getInstance();
    Future.wait([
      prefs.setDouble('height', double.parse(_heightController.text)),
      prefs.setDouble('weight', double.parse(_weightController.text))
    ]);

    notifyListeners();
  }

  double calcBmi() {
    final height = double.parse(_heightController.text);
    final weight = double.parse(_weightController.text);
    final bmi = weight / ((height / 100) * (height / 100));

    return bmi;
  }

  void bmiGrade() {
    final double bmi = calcBmi();

    if (bmi >= 35) {
      _bmiResult = '고도 비만';
    } else if (bmi >= 30) {
      _bmiResult = '2단계 비만';
    } else if (bmi >= 25) {
      _bmiResult = '1단계 비만';
    } else if (bmi >= 23) {
      _bmiResult = '과체중';
    } else if (bmi >= 18.5) {
      _bmiResult = '정상';
    } else {
      _bmiResult = '저체중';
    }

    notifyListeners();
  }

  void buildIcon() {
    final double bmi = calcBmi();
    if (bmi >= 23) {
      _icon = Icons.sentiment_very_dissatisfied;
    } else if (bmi >= 18.5) {
      _icon = Icons.sentiment_satisfied;
    }
    notifyListeners();
  }
}
