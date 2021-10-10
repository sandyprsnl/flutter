import 'package:flutter/material.dart';
import 'basic_demo.dart';
import './no_center_mode.dart';
import './image_slider.dart';

class FlutterSliders extends StatelessWidget {
  static const routName = "/slider";
  const FlutterSliders({Key? key}) : super(key: key);

  Widget createButton({title, routeName, ctx}) {
    return Column(
      children: [
        ElevatedButton(
          child: Text(title),
          onPressed: () {
            Navigator.pushNamed(ctx, routeName);
          },
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Various Slider'),
      ),
      body: ListView(
        children: [
          createButton(
              title: 'Basic', ctx: context, routeName: BasicDemo.routName),
          createButton(
              title: 'No center mode',
              ctx: context,
              routeName: NoCenterDemo.routName),
          createButton(
              title: 'Image Slider',
              ctx: context,
              routeName: ImageSlider.routName),
        ],
      ),
    );
  }
}
