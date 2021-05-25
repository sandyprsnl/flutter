import 'package:flutter/material.dart';

class ButttonLayout extends StatelessWidget {
  final String buttonVal;
  final Function buttonclicked;

  ButttonLayout({required this.buttonVal, required this.buttonclicked});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: OutlinedButton(
          onPressed: () => buttonclicked(),
          child: Align(
            alignment: Alignment.center,
            heightFactor: 3,
            child: Text(
              '$buttonVal',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
