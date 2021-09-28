// ignore_for_file: unnecessary_const, avoid_print

import 'package:flutter/material.dart';

void main() {
  runApp(const LearningFlutter());
}

class LearningFlutter extends StatefulWidget {
  const LearningFlutter({Key? key}) : super(key: key);

  @override
  State<LearningFlutter> createState() => _LearningFlutterState();
}

class _LearningFlutterState extends State<LearningFlutter> {
  bool themeType = false;
  @override
  Widget build(BuildContext context) {
    void changetheme() {
      setState(() {
        themeType = !themeType;
        print(themeType);
        // themeType ? print(Brightness.dark) : print(Brightness.light);
      });
    }

    return MaterialApp(
        theme: ThemeData(
            brightness: themeType ? Brightness.dark : Brightness.light),
        home: SafeArea(
          child: Scaffold(
            body: Column(
              children: <Widget>[
                TextButton(
                    onPressed: changetheme,
                    child: Text(themeType ? 'light theme' : 'dark theme')),
              ],
            ),
          ),
        ));
  }
}
