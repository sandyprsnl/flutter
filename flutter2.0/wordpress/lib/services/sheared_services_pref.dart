import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordpress/model/login_model.dart';
import 'package:wordpress/pages/login_page.dart';

class SharedServicesPrefs {
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('login_details') != null ? true : false;
  }

  static Future loginDetails() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('login_details') != null
        ? LoginResponseModal.fromJson(
            jsonDecode(
              prefs.getString('login_details').toString(),
            ),
          )
        : null;
  }

  static Future<void> setLoginDetails(responseModal) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(
        'login_details',
        (responseModal != null ? jsonEncode(responseModal.toJson()) : null)
            .toString());
  }

  static Future<void> logout(BuildContext context) async {
    setLoginDetails(null);
    Navigator.of(context).pushReplacementNamed(LoginPage.routName);
  }
}
