import 'package:flutter/material.dart';

class MealsCategory {
  final String id;
  final String title;
  final Color color;

  const MealsCategory(
      {required this.id, this.color = Colors.orange, required this.title});
}
