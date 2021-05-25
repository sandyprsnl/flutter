import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int socre;
  final Function resetHandler;

  Result(this.socre,this.resetHandler);
  
  String get scoreResult{
    return socre.toString();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children:<Widget> [
         Text(
        'You did it!\n Your score is : '+scoreResult,
        style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      FlatButton(onPressed:resetHandler ,
       child: Text('Restart Quiz!'),
       textColor: Colors.blue,
       )
      ],
      ),
    );
  }
}
