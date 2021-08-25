import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFevorite;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.imageUrl,
      this.isFevorite = false});

  void toggleFevoriteStatus() {
    isFevorite = !isFevorite;
    notifyListeners();
  }
}
