import 'package:flutter/material.dart';
import './screens/to_do_screen.dart';

void main() => runApp(const HomePage());

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.green[400],
            splashColor: Colors.lightBlueAccent),
        listTileTheme: const ListTileThemeData(dense: true),
      ),
      debugShowCheckedModeBanner: false,
      home: const ToDoScreen(),
    );
  }
}
