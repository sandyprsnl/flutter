// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:io';
import 'package:flutter/rendering.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:path_provider/path_provider.dart';

class GenerateQr extends StatefulWidget {
  static const String routName = "/generateQr";
  const GenerateQr({Key? key}) : super(key: key);

  @override
  State<GenerateQr> createState() => _GenerateQrState();
}

class _GenerateQrState extends State<GenerateQr> {
  static const double _topSectionTopPadding = 50.0;
  static const double _topSectionBottompadding = 20.0;
  static const double _topSectionHeight = 50.0;
  GlobalKey globalKey = GlobalKey();
  String _dataString = "Hello for this QR";
  String? _inputErrorText;
  final TextEditingController _textController = TextEditingController();
  _contentWidget() {
    final bodyHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewInsets.bottom;
    return Container(
      color: const Color(0xFFFFFFFF),
      child: Column(
        children: <Widget>[
          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.only(
              top: _topSectionTopPadding,
              left: 20.0,
              right: 10,
              bottom: _topSectionBottompadding,
            ),
            child: SizedBox(
              height: _topSectionHeight,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration: const InputDecoration(
                        hintText: "Enter a custom message ",
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _dataString = _textController.text;
                        });
                      },
                      child: Text('Submit'),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Center(
            child: RepaintBoundary(
              key: globalKey,
              child: QrImage(
                // foregroundColor: Colors.red,
                data: _dataString,
                size: 0.5 * bodyHeight,
                // embeddedImage: ,
                embeddedImageStyle: QrEmbeddedImageStyle(
                  size: Size(80, 80),
                ),
                errorStateBuilder: (context, err) {
                  return Center(
                    child: Text(
                      "Something wrong ",
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              ),
            ),
          ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR code Generater '),
      ),
      body: _contentWidget(),
    );
  }
}
