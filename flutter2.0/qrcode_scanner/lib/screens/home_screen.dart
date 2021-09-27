import 'package:flutter/material.dart';
import 'package:qrcode_scanner/screens/scan_qr_screen.dart';

import 'generate_qr_screen.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Scanner'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, GenerateQr.routName);
              },
              child: const Text('Generate QR Code'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, ScanQr.routName);
              },
              child: const Text('Scan QR code'),
            )
          ],
        ),
      ),
    );
  }
}
