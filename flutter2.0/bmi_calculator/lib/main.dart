import 'package:flutter/material.dart';
import 'screen/home.dart';

void main() => runApp(
      const BmiCalculator(),
    );

class BmiCalculator extends StatelessWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.red,
        backgroundColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0A0E21),
        ),
      ),
      title: "BMI Calculator",
      home: const HomePage(),
    );
  }
}
