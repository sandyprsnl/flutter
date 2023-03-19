import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.red,
          appBar: AppBar(
            title: const Text('Dicee'),
            backgroundColor: Colors.red,
          ),
          body: const DiceePage(),
        ),
      ),
    ));

class DiceePage extends StatefulWidget {
  const DiceePage({Key? key}) : super(key: key);

  @override
  State<DiceePage> createState() => _DiceePageState();
}

class _DiceePageState extends State<DiceePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void _changeDiceeFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: TextButton(
              onPressed: _changeDiceeFace,
              child: SvgPicture.asset(
                'images/dice$leftDiceNumber.svg',
                height: 180.0,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextButton(
              onPressed: _changeDiceeFace,
              child: SvgPicture.asset(
                'images/dice$rightDiceNumber.svg',
                height: 180.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
