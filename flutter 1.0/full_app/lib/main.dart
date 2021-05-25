import 'package:flutter/material.dart';
import 'package:full_app/login.dart';
import 'package:full_app/utlis/constents.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homepage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Constants.prefs= await SharedPreferences.getInstance();
  
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Full App',
    home: LoginPage(),
    theme: ThemeData(primarySwatch: Colors.purple),
    routes: {
      '/login': (context) => LoginPage(),
      '/home': (context) => HomePage(),
    },
  ));
}
