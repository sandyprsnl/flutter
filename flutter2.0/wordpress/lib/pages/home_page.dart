import 'package:flutter/material.dart';
// import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:wordpress/services/sheared_services_pref.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routName = "/home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // static final String onSignalAppId = '1c04f9d8-ca99-459c-bc2d-1e2ebd4a0434';

  // Future<void> initPlatFormState() async {
  //   OneSignal.shared.setAppId(onSignalAppId);

  //   OneSignal.shared.s
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wordpress Dashboard'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              SharedServicesPrefs.logout(context);
            },
            icon: Icon(Icons.logout),
            color: Colors.black,
          ),
          SizedBox(
            width: 10,
          ),
        ],
        backgroundColor: Colors.grey[200],
      ),
      body: Center(
        child: Text('Dashboard'),
      ),
    );
  }
}
