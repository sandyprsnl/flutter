import 'package:flutter/material.dart';
import '../utilities/constents.dart';

class CityScreen extends StatelessWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var city = "";
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/city_background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          constraints: const BoxConstraints.expand(),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios, color: Colors.white),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                    style: const TextStyle(color: Colors.black),
                    decoration: kInputDecortion,
                    onChanged: (value) {
                      city = value;
                    }),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, city);
                },
                child: const Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
