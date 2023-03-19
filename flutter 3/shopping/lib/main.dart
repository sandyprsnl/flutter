import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/login.dart';
import './screens/home.dart';

void main() => runApp(const Index());

class Index extends StatelessWidget {
  const Index({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      theme: ThemeData(
          primarySwatch: Colors.cyan,
          primaryColor: Colors.cyan,
          fontFamily: GoogleFonts.lato().fontFamily),
      debugShowCheckedModeBanner: false,
      initialRoute: Login.routeName,
      routes: {
        Login.routeName: (context) => const Login(),
        Home.routeName: (context) => const Home()
      },
    );
  }
}
