import 'package:flutter/material.dart';
import '../constents.dart';
import '../components/resuable_card.dart';

class ResultPage extends StatelessWidget {
  final String bmi;
  final String result;
  final String interpratation;
  const ResultPage(
      {required this.result,
      required this.bmi,
      required this.interpratation,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "Your Result",
                style: ktitleStyle,
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: ReusableCard(
                bgColor: kactiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      result,
                      style: const TextStyle(
                          fontSize: 22.0,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bmi,
                      style: const TextStyle(
                          fontSize: 100.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      interpratation,
                      style: klabelStyle,
                    )
                  ],
                ),
              )),
          GestureDetector(
            onTap: () {
              Navigator.pop(
                context,
              );
            },
            child: Container(
              child: const Center(
                child: Text(
                  'RE-CALCULATE',
                  textAlign: TextAlign.center,
                  style: klargeButtonStyle,
                ),
              ),
              color: kbottomContainerColor,
              height: kbottomContainerHeight,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 15.0),
              padding: const EdgeInsets.only(bottom: 10.0),
            ),
          ),
        ],
      ),
    ));
  }
}
