import 'package:flutter/material.dart';

class CoinCard extends StatelessWidget {
  final String countryName;
  final String currencyName;
  final String currencyvalue;
  const CoinCard(
      {Key? key,
      required this.countryName,
      required this.currencyName,
      required this.currencyvalue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 15.0),
          child: Text(
            "1 $currencyName = $currencyvalue $countryName",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
