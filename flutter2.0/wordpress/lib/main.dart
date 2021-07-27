import 'package:flutter/material.dart';
import '../pages/login_page.dart';

void main() => {
      runApp(MaterialApp(
        title: 'Wordpress',
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.redAccent,
          accentColor: Colors.cyan,
        ),
      ))
    };
