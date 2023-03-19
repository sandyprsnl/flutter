import 'package:flutter/material.dart';
import '../constents.dart';

class CardChild extends StatelessWidget {
  final IconData fontIcon;
  final String label;
  const CardChild({
    required this.fontIcon,
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          fontIcon,
          size: 80.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: klabelStyle,
        )
      ],
    );
  }
}
