import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://images.pexels.com/photos/1563356/pexels-photo-1563356.jpeg?cs=srgb&dl=pexels-craig-adderley-1563356.jpg&fm=jpg'))),
              accountName: Text('Sandeep Bhardwaj'),
              accountEmail: Text('Bsandeep650@gmail.vom'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80',
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Sandeep'),
              subtitle: Text('Bhardwaj'),
              trailing: Icon(Icons.edit),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Bsandeep650@gmail.com'),
              subtitle: Text('Email'),
              trailing: Icon(Icons.send),
            ),
          ],
        ),
      );
  }
}