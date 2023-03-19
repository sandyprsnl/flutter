import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constent.dart';
import '../coin_data.dart';

// https://rest.coinapi.io/v1/exchangerate/BTC/USD
class Network {
  String countryname;
  Network({required this.countryname});

  Future getData() async {
    var queryprms = {"apikey": apiKey};

    Map<String, String> coindata = {};
    for (var coin in cryptoList) {
      var uri = Uri.https(
          'rest.coinapi.io', 'v1/exchangerate/$coin/$countryname', queryprms);

      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        var decodata = json.decode(response.body);
        double price = decodata['rate'];
        coindata[coin] = price.toStringAsFixed(2);
      } else {
        print(response.statusCode);
      }
    }
    return coindata;
  }
}
