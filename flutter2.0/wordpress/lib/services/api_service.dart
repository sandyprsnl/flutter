import 'package:http/http.dart' as http;
import 'package:wordpress/model/login_model.dart';
import 'package:wordpress/services/sheared_services_pref.dart';

class APIServices {
  static var client = http.Client();
  static String domain = '127.0.0.1';
  static Future<bool> loginCustomer(String username, String password) async {
    print(username);
    Map<String, String> requestHeaders = {
      'Content-type': 'application/x-www-form-urlencoded'
    };
    var response = await client.post(
        Uri.https(domain, 'jgu/wp-json/jwt-auth/v1/token'),
        headers: requestHeaders,
        body: {'username': username, 'password': password});
    if (response.statusCode == 200) {
      // print(response.body);
      var jsonString = response.body;
      LoginResponseModal responseModal = loginResponseModalFromJson(jsonString);
      if (responseModal.statusCode == 200) {
        SharedServicesPrefs.setLoginDetails(responseModal);
      }
      return responseModal.statusCode == 200 ? true : false;
    }
    return false;
  }
  // static loginCustomer(String username, String password) async {
  //   var json =
  //       await http.get(Uri.https('goweather.herokuapp.com', '/weather/karnal'));
  //   var data = jsonDecode(json.body);
  //   print(data);
  // }
}
