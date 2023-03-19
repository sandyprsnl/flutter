import 'package:flutter/material.dart';
import './price_screen.dart';

void main() => runApp(const Home());

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'BitCoin Ticker',
      home: PriceScreen(),
    );
  }
}
