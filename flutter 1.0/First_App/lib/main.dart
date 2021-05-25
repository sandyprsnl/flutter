
import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(FirstApp());

class FirstApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstAppState();
  }
}

class FirstAppState extends State<FirstApp> {

   final _questions = const [
      {
        'questionText': '1. How many days do we have in a week?',
        'answers': [
          {'text':'5','score':0},
          {'text':'6','score':0},
          {'text':'7','score':1},
          {'text':'4','score':0},
          ]
      },
      {
        'questionText': '2. How many days are there in a year?',
        'answers': [
          {'text':'365','score':1},
          {'text':'364','score':0},
          {'text':'363','score':0},
          {'text':'367','score':0},
          ]
      },
      {
        'questionText': '3. How many colors are there in a rainbow?',
        'answers': [
          {'text':'5','score':0},
          {'text':'6','score':0},
          {'text':'7','score':1},
          {'text':'4','score':0},
          ]
      },
      {
        'questionText': '4. Which animal is known as the ‘Ship of the Desert?’',
        'answers': [
          {'text':'Snake','score':0},
          {'text':'Camel','score':1},
          {'text':'Dog','score':0},
          {'text':'Cat','score':0},
          ]
      },
      {
        'questionText': '5. How many letters are there in the English alphabet?',
        'answers': [
          {'text':'27','score':0},
          {'text':'24','score':0},
          {'text':'25','score':0},
          {'text':'26','score':1},
          ]
      },
      {
        'questionText': '6. Which month of the year has the least number of days?',
        'answers': [
          {'text':'December','score':0},
          {'text':'February','score':1},
          {'text':'October','score':0},
          {'text':'January','score':0},
          ]
      },
      {
        'questionText': '7. How many consonants are there in the English alphabet?',
        'answers': [
          {'text':'21','score':1},
          {'text':'5','score':0},
          {'text':'7','score':0},
          {'text':'4','score':0},
          ]
      },
      {
        'questionText': '8. How many sides are there in a triangle?',
        'answers': [
          {'text':'5','score':0},
          {'text':'6','score':0},
          {'text':'3','score':1},
          {'text':'4','score':0},
          ]
      },
      {
        'questionText': '9. In which direction does the sun rise?',
        'answers': [
          {'text':'West','score':0},
          {'text':'South','score':0},
          {'text':'East','score':1},
          {'text':'North','score':0},
          ]
      },
      {
        'questionText': '10. What is a baby frog called?',
        'answers': [
          {'text':'Padpole','score':0},
          {'text':'Tadpole','score':1},
          {'text':'Sadpole','score':0},
          {'text':'Vadpole','score':0},
          ]
      },
    ];
  var _questionsIndex = 0;
  var _score = 0;
  void _resetQuiz(){
    setState(() {
     _questionsIndex = 0;
     _score = 0;
      
    });
  }


  void _answeredQuestions(int score) {
    
    setState(() {
      _questionsIndex = _questionsIndex + 1;
    });
     _score = _score+score;
    if(_questionsIndex < _questions.length){
      print('we have more questions');

    }
    else{
      print('we have no more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz APP'),
        ),
        body: _questionsIndex < _questions.length ?
        Quiz(
          answerQuestion: _answeredQuestions,
          questionsIndex: _questionsIndex,
          questions: _questions,)
         : Result(_score,_resetQuiz),
      ),
    );
  }
}
