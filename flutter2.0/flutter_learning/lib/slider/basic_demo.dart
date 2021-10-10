import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import './items_list.dart';

class BasicDemo extends StatelessWidget {
  const BasicDemo({Key? key}) : super(key: key);
  static const routName = "/besicDemo";

  @override
  Widget build(BuildContext context) {
    // List<int> items = [1, 2, 3, 4, 5];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Demo'),
      ),
      body: CarouselSlider(
          items: items
              .map(
                (item) => Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.only(top: 200 / 2),
                  width: 200,
                  height: 200,
                  child: Text(
                    item.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20),
                  ),
                  color: Colors.green,
                ),
              )
              .toList(),
          options: CarouselOptions()),
    );
  }
}
