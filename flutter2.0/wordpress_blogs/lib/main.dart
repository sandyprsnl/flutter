import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:wordpress_blogs/widgets/widget.dart';

void main() {
  runApp(MaterialApp(
    title: 'Use Api',
    home: UsingApi(),
    theme: ThemeData(primarySwatch: Colors.brown),
    debugShowCheckedModeBanner: false,
  ));
}

class UsingApi extends StatefulWidget {
  @override
  _UsingApiState createState() => _UsingApiState();
}

class _UsingApiState extends State<UsingApi> {
  var city = 'karnal';
  var url = 'goweather.herokuapp.com';
  var data;
  var datalen;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    // var res = await http.get(Uri.parse(url));
    var res = await http.get(Uri.https(url, '/weather/' + city));
    print(res.statusCode);
    data = jsonDecode(res.body);
    data = data;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: data != null
          ? Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/weather.jpeg'),
                      fit: BoxFit.cover)),
              child: ListView(
                children: [
                  Temprature(
                    text: 'Temperature',
                    val: data['temperature'],
                  ),
                  Temprature(
                    text: 'Wind',
                    val: data['wind'],
                  ),
                  Temprature(
                    text: 'Description',
                    val: data['description'],
                  ),
                  Temprature(
                    text: 'Description',
                    val: data['description'],
                  ),
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
