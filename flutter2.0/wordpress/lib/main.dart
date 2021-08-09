import 'package:flutter/material.dart';
import 'package:wordpress/services/sheared_services_pref.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';

Widget _defaultHome = LoginPage();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool _result = await SharedServicesPrefs.isLoggedIn();
  if (_result) {
    _defaultHome = HomePage();
  }
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wordpress',
      debugShowCheckedModeBanner: false,
      home: _defaultHome,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.redAccent,
        accentColor: Colors.cyan,
      ),
      // initialRoute: LoginPage.routName,
      routes: {
        LoginPage.routName: (ctx) => LoginPage(),
        HomePage.routName: (ctx) => HomePage(),
      },
      onUnknownRoute: (setting) {
        print('Rout not found ');
        print(setting.name);
        print(setting.arguments);
        return MaterialPageRoute(builder: (context) => LoginPage());
      },
    );
  }
}
