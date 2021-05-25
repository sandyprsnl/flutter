import 'package:flutter/rendering.dart';

import 'package:flutter/material.dart';
class Answer extends StatelessWidget {
  final Function slecteHandler;
  final String answerText;
  Answer(this.slecteHandler , this.answerText);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: RaisedButton(
          child: Text(answerText, style: TextStyle(color: Colors.white),),
          color: Colors.blue,
          onPressed:slecteHandler
          ),
    );
  }
}