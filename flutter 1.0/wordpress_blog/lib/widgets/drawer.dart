
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child:ListView(
          children: <Widget>[
            ListTile(
              title: Text('data'),
            ),
          ],
        ),
      );
  }
}