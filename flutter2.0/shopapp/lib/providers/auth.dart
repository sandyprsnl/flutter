import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/http_exception.dart';

class Auth extends ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  String? _userId;

  Future<void> signUp(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> _authenticate(
      String email, String password, String urlSigment) async {
    try {
      final url = Uri.https(
          'identitytoolkit.googleapis.com',
          '/v1/accounts:$urlSigment',
          {'key': 'AIzaSyCPWLow2O-jt_loh6wpGwy7XLHFM8cy5ok'});
      final response = await http.post(
        url,
        body: json.encode({
          'email': email,
          'password': password,
          'returnSecureToken': true,
        }),
      );
      final responsedata = json.decode(response.body);
      print(responsedata['error']);
      if (responsedata['error'] != Null) {
        throw HttpException(responsedata['error']['message']);
      }
    } catch (error) {
      // print(error);
      throw error;
    }
  }

  Future<void> signIn(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }
}
