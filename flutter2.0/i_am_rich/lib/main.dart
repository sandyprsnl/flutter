import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[900],
          title: const Text('I am Rich '),
        ),
        body: const Center(
          child: Image(
            image: AssetImage('images/1.jpg')
            //  NetworkImage(
            //     'https://images.unsplash.com/photo-1648405679817-325c7da58074?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyM3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60')
            ,
          ),
        ),
      ),
    ),
  );
}
