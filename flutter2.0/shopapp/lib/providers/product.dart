import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

  void _setfevorit(newFevoritsval) {
    isFevorite = newFevoritsval;
    notifyListeners();
  }

  Future<void> toggleFevoriteStatus() async {
    final oldFevoriteStatus = isFevorite;
    isFevorite = !isFevorite;
    final url = Uri.https(
        'shop-app-6bf9f-default-rtdb.firebaseio.com', '/products/$id.json');
    try {
      final response = await http.patch(url,
          body: jsonEncode({
            'isFevorits': isFevorite,
          }));
      _setfevorit(isFevorite);
      if (response.statusCode >= 400) {
        _setfevorit(oldFevoriteStatus);
      }
    } catch (error) {
      _setfevorit(oldFevoriteStatus);
    }
  }
}
