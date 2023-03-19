import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'resuable_card.dart';
import '../constents.dart';
import 'round_icon_botton.dart';

class ReusableRoundIconButton extends StatelessWidget {
  final int value;
  final String label;
  final VoidCallback onAdd;
  final VoidCallback onMinus;
  const ReusableRoundIconButton(
      {required this.label,
      required this.onAdd,
      required this.onMinus,
      required this.value,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ReusableCard(
        bgColor: const Color(0xFF101E33),
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              label,
              style: klabelStyle,
            ),
            Text(
              value.toString(),
              style: knumberLableStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RoundIconButton(
                  icon: FontAwesomeIcons.minus,
                  onPressed: onMinus,
                ),
                RoundIconButton(
                  icon: FontAwesomeIcons.plus,
                  onPressed: onAdd,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
