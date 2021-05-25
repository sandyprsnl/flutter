import 'package:flutter/material.dart';
import './questions.dart';
import './answer.dart';

void main()=>runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp>{

  var _questionindex=0;

void _answeredquestions(){
  setState(() {
    _questionindex=_questionindex+1;
  });

  print(_questionindex);
}

  var questions=[
    {
      'questionText':'What is Fevrite  Super Hero ?',
      'answers':['Spider Man','Bat Man','Iron Man','Super Man']
    },
    {
      'questionText':'What Is Fevrite  Color ?',
      'answers':['Red','Green','Orange','Purple']
    },
    {
      'questionText':'What Is Fevrite  Pet ?',
      'answers':['Cat','Dog','Bear','Loin']
    },
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App'),
        ),
        body: Column(children: [
          Questions(questions[_questionindex]),
          Answer(_answeredquestions),
          Answer(_answeredquestions),
          Answer(_answeredquestions),
        ],
        ),
      ),
    );
  }
}