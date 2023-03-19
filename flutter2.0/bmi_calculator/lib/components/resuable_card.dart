import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color bgColor;
  final Widget? cardChild;
  final VoidCallback? onPress;
  const ReusableCard({
    required this.bgColor,
    this.cardChild,
    this.onPress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardChild,
      ),
    );
  }
}
