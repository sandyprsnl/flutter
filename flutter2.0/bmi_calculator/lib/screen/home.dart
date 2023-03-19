import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/resuable_card.dart';
import '../components/card_child.dart';
import '../constents.dart';
import 'result_page.dart';
import '../components/resuable_round_icon_button.dart';
import '../components/calculator_brain.dart';

enum Gender {
  male,
  female,
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender? selectedGender;
  int height = 180;
  int weigth = 20;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                        // print(Gender.male.index);
                      });
                    },
                    bgColor: (selectedGender == Gender.male)
                        ? kinactiveCardColor
                        : kactiveCardColor,
                    cardChild: const CardChild(
                      fontIcon: FontAwesomeIcons.mars,
                      label: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                          // print(Gender.male.index);
                        });
                      },
                      bgColor: (selectedGender == Gender.female)
                          ? kinactiveCardColor
                          : kactiveCardColor,
                      cardChild: const CardChild(
                        fontIcon: FontAwesomeIcons.venus,
                        label: 'Female',
                      )),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              bgColor: kactiveCardColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'HEIGHT',
                    style: klabelStyle,
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: knumberLableStyle,
                      ),
                      const Text(
                        ' cm',
                        style: klabelStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: const Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: const Color(0xFFEB1555),
                        overlayColor: const Color(0x29EB1555),
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15.0),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double changedHeight) {
                        setState(() {
                          height = changedHeight.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ReusableRoundIconButton(
                  label: 'WEIGHT',
                  value: weigth,
                  onAdd: () {
                    setState(() {
                      weigth++;
                    });
                  },
                  onMinus: () {
                    setState(() {
                      weigth--;
                    });
                  },
                ),
                ReusableRoundIconButton(
                  label: 'AGE',
                  value: age,
                  onAdd: () {
                    setState(() {
                      age++;
                    });
                  },
                  onMinus: () {
                    setState(() {
                      age--;
                    });
                  },
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calculateBmi =
                  CalculatorBrain(height: height, weight: weigth);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmi: calculateBmi.calculate(),
                    result: calculateBmi.getResult(),
                    interpratation: calculateBmi.getInterpratation(),
                  ),
                ),
              );
            },
            child: Container(
              child: const Center(
                child: Text(
                  'CALCULATE',
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
    );
  }
}
