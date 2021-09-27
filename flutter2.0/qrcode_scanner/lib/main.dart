import 'package:flutter/material.dart';
import './screens/home_screen.dart';
import './screens/generate_qr_screen.dart';
import './screens/scan_qr_screen.dart';

void main() => runApp(const Myapp());

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Scanner',
      home: const Home(),
      debugShowCheckedModeBanner: false,
      routes: {
        GenerateQr.routName: (ctx) => const GenerateQr(),
        ScanQr.routName: (ctx) => const ScanQr(),
      },
    );
  }
}
