import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utilities/constents.dart';

class Networking {
  final double? latitude;
  final double? longitude;
  Networking({this.latitude, this.longitude});

  Future getData() async {
    var queryParameters = {
      'lat': latitude.toString() /*'29.73508'*/,
      'lon': longitude.toString() /*'77.008425'*/,
      'appid': apiKey,
      'units': units,
    };
    var uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather/', queryParameters);
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }

  Future getCityData(String cityName) async {
    var queryParameters = {
      'q': cityName /*London*/,
      'appid': apiKey,
      'units': units,
    };
    var uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather/', queryParameters);
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
