import 'package:flutter/material.dart';

const String apiKey = "f3a3d157e6ab2ddc5aae2f24a1da3e21";
const String units = "metric";
const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 50.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle =
    TextStyle(fontSize: 30.0, fontFamily: 'Spartan MB', color: Colors.white);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

final kInputDecortion = InputDecoration(
  icon: const Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  filled: true,
  fillColor: Colors.white,
  hintText: "Enter City",
  hintStyle: const TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide.none,
  ),
);
