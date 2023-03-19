import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color color;
  final String text;
  final BorderRadiusGeometry borderRadius;
  final VoidCallback onpressed;
  const RoundedButton({
    required this.color,
    required this.text,
    required this.borderRadius,
    required this.onpressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      color: color,
      borderRadius: borderRadius,
      child: MaterialButton(
        minWidth: 200.0,
        height: 42.0,
        onPressed: onpressed,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
