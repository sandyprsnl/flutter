import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LearningFirebase extends StatelessWidget {
  static const routName = "LearningFirebase";
  const LearningFirebase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase'),
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.white),
      ),
    );
  }
}
