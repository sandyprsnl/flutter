import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Picker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Image Picker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? image;
  Widget buildButton(
          {String? title, IconData? icon, VoidCallback? onClicked}) =>
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(56),
          primary: Colors.white,
          onPrimary: Colors.black,
          textStyle: TextStyle(fontSize: 20),
        ),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              size: 28,
            ),
            const SizedBox(
              width: 16,
            ),
            Text(title.toString()),
          ],
        ),
        onPressed: onClicked,
      );

  Future pickImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage == null) return;
      // final imageTemp = File(pickedImage.path);
      final imagePeremanent = await saveImagePermanently(pickedImage.path);
      print(imagePeremanent);
      setState(() {
        this.image = imagePeremanent;
      });
    } on PlatformException catch (e) {
      print('Failed to pic image: $e');
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    print(directory);
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    print(image);
    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber.shade300,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              image != null
                  ? ClipOval(
                      child: Image.file(
                        image!,
                        width: 160,
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                    )
                  : FlutterLogo(
                      size: 160,
                    ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.title,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              const SizedBox(
                height: 40,
              ),
              buildButton(
                  title: 'Pick Gallery',
                  icon: Icons.image_outlined,
                  onClicked: () => pickImage(ImageSource.gallery)),
              const SizedBox(
                height: 20,
              ),
              buildButton(
                  title: 'Pick Camera',
                  icon: Icons.camera_alt_outlined,
                  onClicked: () => pickImage(ImageSource.camera)),
            ],
          ),
        ));
  }
}
