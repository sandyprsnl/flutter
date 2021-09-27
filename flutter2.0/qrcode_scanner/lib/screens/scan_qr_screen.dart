import 'dart:async';
// import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/services.dart';

class ScanQr extends StatefulWidget {
  static const String routName = "/scanQr";
  const ScanQr({Key? key}) : super(key: key);

  @override
  State<ScanQr> createState() => _ScanQrState();
}

class _ScanQrState extends State<ScanQr> {
  String barcode = "";
  @override
  initState() {
    super.initState();
  }

  Future scan() async {
    try {
      await BarcodeScanner.scan().then((value) {
        setState(() {
          barcode = value.rawContent.toString();
        });
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          barcode = 'camera permission denaied!';
        });
      } else {
        setState(() {
          barcode = "unknow error: $e";
        });
      }
    } on FormatException {
      setState(() {
        barcode = "clicked back button befor the scan";
      });
    } catch (e) {
      setState(() {
        barcode = "unknown error : $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR code Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: ElevatedButton(
                onPressed: scan,
                child: const Text('Start Camera Scan'),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                barcode,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
