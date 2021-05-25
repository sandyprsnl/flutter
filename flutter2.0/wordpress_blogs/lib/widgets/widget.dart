// import 'package:http/http.dart' as http;
// import 'dart:convert';

// Future<Map> fetchWpPosts() async {
//   var url = 'https://goweather.herokuapp.com/weather/karnal';
//   var result = await http.get(Uri.parse(url), headers: {
//     'Accept': "application/json",
//   });
//   var res = jsonDecode(result.body);
//   print(res);
//   return res;
// }

import 'package:flutter/material.dart';

class Temprature extends StatelessWidget {
  final String text, val;
  Temprature({this.val, this.text});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(text),
            Text(val),
          ],
        ),
      ),
    );
  }
}
