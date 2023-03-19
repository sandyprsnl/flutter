import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blueAccent,
          appBar: AppBar(
            title: const Text('Ask me anything '),
          ),
          body: const AskMeAnything(),
        ),
      ),
    ));

class AskMeAnything extends StatefulWidget {
  const AskMeAnything({Key? key}) : super(key: key);

  @override
  State<AskMeAnything> createState() => _AskMeAnythingState();
}

class _AskMeAnythingState extends State<AskMeAnything> {
  int ballNumber = 1;

  void _changeFace() {
    setState(() {
      ballNumber = Random().nextInt(4) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
          onPressed: _changeFace,
          child: Image(
            image: AssetImage('images/ball$ballNumber.png'),
          )),
    );
  }
}
