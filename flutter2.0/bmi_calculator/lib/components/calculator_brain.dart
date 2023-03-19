import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;
  late double _bmi;
  CalculatorBrain({required this.height, required this.weight});

  String calculate() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    String result = "Not found";
    if (_bmi >= 25) {
      result = "Overweight";
    } else if (_bmi >= 18.5) {
      result = "Normal";
    } else {
      result = "UnderWeight";
    }

    return result;
  }

  String getInterpratation() {
    String result = "Not found";
    if (_bmi >= 25) {
      result =
          "You have a heigher then normal body weight. Try to excercise more";
    } else if (_bmi >= 18.5) {
      result = "You have a normal body weight. Good job!";
    } else {
      result =
          "You have a lower then normal body weight. You have a eat bit more";
    }

    return result;
  }
}
