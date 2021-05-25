import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_forecast/nextthreeday.dart';
import 'package:weather_forecast/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var forcast;
  var nextThreeDayFircast;
  TextEditingController _cityTextCOntroller = TextEditingController();
  final _cityformKey = GlobalKey<FormState>();
  getData(city) async {
    var json = await http
        .get(Uri.https('goweather.herokuapp.com', '/weather/' + city));
    var data = jsonDecode(json.body);
    forcast = data;
    print(data);
    // print(data['forecast'].toList()[0]['day']);
    // print(data['forecast'].toList()[0].length);
    setState(() {});
  }

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
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              color: Colors.white.withOpacity(0.7),
              child: Form(
                  key: _cityformKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        style: TextStyle(color: Colors.black38),
                        decoration: InputDecoration(
                          hintText: 'city',
                          labelText: 'Enter City',
                        ),
                        controller: _cityTextCOntroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter City Name";
                          }
                          return null;
                        },
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (_cityformKey.currentState.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Processing data')));
                              getData(_cityTextCOntroller.text);
                            }
                          },
                          child: Text('Check'))
                    ],
                  )),
            ),
            (forcast != null)
                ? Column(
                    children: [
                      getFormField(
                          forcast: forcast['temperature'],
                          field: 'Temperature'),
                      getFormField(forcast: forcast['wind'], field: 'Wind'),
                      getFormField(
                          forcast: forcast['description'],
                          field: 'Description'),
                      ElevatedButton(
                          onPressed: () {
                            print(forcast['forecast'].toList());
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NextThreeDay(
                                        forcasts:
                                            forcast['forecast'].toList())));
                          },
                          child: Text('Check Next 3 day forcast'))
                    ],
                  )
                : Text('No data')
          ],
        ),
      ),
    );
  }
}
