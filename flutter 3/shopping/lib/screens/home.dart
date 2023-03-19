import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  static String routeName = "/home";
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('data'),
    );
  }
}
