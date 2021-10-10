import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import './items_list.dart';

class NoCenterDemo extends StatelessWidget {
  const NoCenterDemo({Key? key}) : super(key: key);
  static const routName = "/NoCenterDemo";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('No Center Demo'),
      ),
      body: CarouselSlider(
        items: items
            .map(
              (item) => Container(
                width: 200,
                margin: const EdgeInsets.only(top: 20),
                child: Text(item.toString()),
                color: Colors.red,
              ),
            )
            .toList(),
        options: CarouselOptions(
          disableCenter: true,
        ),
      ),
    );
  }
}
