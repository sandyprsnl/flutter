import 'package:flutter/material.dart';

class NextThreeDay extends StatelessWidget {
  final forcasts;
  NextThreeDay({this.forcasts});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Weather Forcast'),
        ),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.blue.withOpacity(0.1), BlendMode.dstATop),
                    image: AssetImage('assets/weather.gif'),
                    fit: BoxFit.fill)),
            child: ListView.builder(
                itemCount: forcasts.length,
                itemBuilder: (BuildContext context, index) {
                  var forcast = forcasts[index];
                  print(forcast);
                  return ListTile(
                    leading: Text(forcast['day']),
                    title: Text(forcast['temperature']),
                    subtitle: Text(forcast['wind']),
                  );
                })));
  }
}
