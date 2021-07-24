import 'package:flutter/material.dart';
import './map_utils.dart';

void main() => runApp(MaterialApp(
      home: GoogleMap(),
      debugShowCheckedModeBanner: false,
      title: 'Using Google Map',
    ));

class GoogleMap extends StatefulWidget {
  const GoogleMap({Key? key}) : super(key: key);

  @override
  _GoogleMapState createState() => _GoogleMapState();
}

class _GoogleMapState extends State<GoogleMap> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Google Map'),
        ),
        body: Container(
          child: Center(
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                MapUtils.openMap(29.735554, 77.008143);
              },
              child: Text(
                'Open Google Map',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
