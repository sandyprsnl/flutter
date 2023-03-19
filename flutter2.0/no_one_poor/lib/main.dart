import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[300],
        appBar: AppBar(
          backgroundColor: Colors.cyanAccent[300],
          title: const Text('No One Poor'),
        ),
        body: const Center(
          child: Image(image: AssetImage('images/business-man.png')),
        ),
      ),
    ),
  );
}
