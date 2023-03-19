import 'package:flutter/material.dart';
import './question_bank.dart';

void main() => runApp(
      const MaterialApp(
        home: Quizzler(),
      ),
    );

class Quizzler extends StatefulWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  State<Quizzler> createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  List<Widget> scoreKeeper = [];

  QuestionBank questionBank = QuestionBank();

  int questionIndex = 0;

  Widget createButton(
      {required String text,
      required Color bgcolor,
      required BuildContext context}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          style: TextButton.styleFrom(backgroundColor: bgcolor),
          onPressed: () {
            updateScoreKeeper(
                userAnswer: (text == "true ") ? true : false, context: context);
          },
          child: Text(
            text[0].toUpperCase() + text.substring(1),
            style: const TextStyle(fontSize: 25.0, color: Colors.white),
          ),
        ),
      ),
    );
  }

  void updateScoreKeeper(
      {required bool userAnswer, required BuildContext context}) {
    if (questionBank.isFinished() == true) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Center(
            child: Text(
              questionBank.getScore().toString(),
              style:
                  const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
          ),
          content: const Text('Your Score',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'OK');
                setState(() {
                  questionBank.refresh();
                  scoreKeeper = [];
                });
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }
    IconData icon;
    Color iconColor;
    if (questionBank.getAnswer() == userAnswer) {
      icon = Icons.check;
      iconColor = Colors.green;
    } else {
      icon = Icons.close;
      iconColor = Colors.red;
    }
    scoreKeeper.add(
      Icon(
        icon,
        color: iconColor,
      ),
    );
    setState(
      () {
        questionBank.nextQuestion();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey.shade900,
          appBar: AppBar(
            title: const Text(
              'Quizzler',
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      questionBank.getQuestion(),
                      style:
                          const TextStyle(fontSize: 25.0, color: Colors.white),
                    ),
                  ),
                ),
              ),
              createButton(
                  text: "true", bgcolor: Colors.green, context: context),
              createButton(
                  text: "false", bgcolor: Colors.red, context: context),
              Row(
                children: scoreKeeper,
              )
            ],
          ),
        ),
      ),
    );
  }
}
