import 'package:flutter/material.dart';

import 'buttons.dart';

void main() {
  runApp(MaterialApp(
    title: 'Calculator',
    home: MyApp(),
    theme: ThemeData(primarySwatch: Colors.red),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int firstnum = 0;
  int secondnum = 0;
  String texttoDisplay = '';
  String res = '';
  String operatortoperform = '';
  String operations = '';
  void btnClicked(String btnval) {
    operations += btnval.toString();

    if (btnval == "C") {
      texttoDisplay = '';
      firstnum = 0;
      secondnum = 0;
      res = '';
    } else if (btnval == "+" ||
        btnval == "-" ||
        btnval == "*" ||
        btnval == "/") {
      firstnum = int.parse(texttoDisplay);
      res = '';
      operatortoperform = btnval;
    } else if (btnval == "=") {
      secondnum = int.parse(texttoDisplay);
      if (operatortoperform == '+') {
        res = (firstnum + secondnum).toString();
      }
      if (operatortoperform == '-') {
        res = (firstnum - secondnum).toString();
      }
      if (operatortoperform == '*') {
        res = (firstnum * secondnum).toString();
      }
      if (operatortoperform == '/') {
        res = (firstnum / secondnum).toString();
      }
    } else {
      res = (int.parse(texttoDisplay + btnval)).toString();
    }
    setState(() {
      texttoDisplay = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
                child: Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.bottomRight,
              child: Text(
                '$texttoDisplay',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            )),
            Row(
              children: <Widget>[
                ButttonLayout(
                  buttonclicked: () => btnClicked('9'),
                  buttonVal: '9',
                ),
                ButttonLayout(
                  buttonclicked: () => btnClicked('8'),
                  buttonVal: '8',
                ),
                ButttonLayout(
                  buttonclicked: () => btnClicked('7'),
                  buttonVal: '7',
                ),
                ButttonLayout(
                  buttonclicked: () => btnClicked('+'),
                  buttonVal: '+',
                ),
              ],
            ),
            Row(
              children: <Widget>[
                ButttonLayout(
                  buttonclicked: () => btnClicked('6'),
                  buttonVal: '6',
                ),
                ButttonLayout(
                  buttonclicked: () => btnClicked('5'),
                  buttonVal: '5',
                ),
                ButttonLayout(
                  buttonclicked: () => btnClicked('4'),
                  buttonVal: '4',
                ),
                ButttonLayout(
                  buttonclicked: () => btnClicked('-'),
                  buttonVal: '-',
                ),
              ],
            ),
            Row(
              children: <Widget>[
                ButttonLayout(
                  buttonclicked: () => btnClicked('3'),
                  buttonVal: '3',
                ),
                ButttonLayout(
                  buttonclicked: () => btnClicked('2'),
                  buttonVal: '2',
                ),
                ButttonLayout(
                  buttonclicked: () => btnClicked('1'),
                  buttonVal: '1',
                ),
                ButttonLayout(
                  buttonclicked: () => btnClicked('*'),
                  buttonVal: '*',
                ),
              ],
            ),
            Row(
              children: <Widget>[
                ButttonLayout(
                  buttonclicked: () => btnClicked('C'),
                  buttonVal: 'C',
                ),
                ButttonLayout(
                  buttonclicked: () => btnClicked('0'),
                  buttonVal: '0',
                ),
                ButttonLayout(
                  buttonclicked: () => btnClicked('='),
                  buttonVal: '=',
                ),
                ButttonLayout(
                  buttonclicked: () => btnClicked('/'),
                  buttonVal: '/',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
