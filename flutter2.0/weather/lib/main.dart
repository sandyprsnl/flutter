import 'package:flutter/material.dart';
import './screens/loading_screen.dart';

void main() => runApp(const Home());

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  void location() async {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: "Weather ",
      home: const LoadingScreen(),
    );
  }
}
