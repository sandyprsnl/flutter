import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import './items_list.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({Key? key}) : super(key: key);
  static const routName = "/ImageSlider";
  @override
  Widget build(BuildContext context) {
    print(
      MediaQuery.of(context).size.width,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Slider'),
      ),
      body: CarouselSlider(
        items: imgList
            .map(
              (img) => Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                img,
                              ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  )
                ],
              ),
            )
            .toList(),
        options: CarouselOptions(),
      ),
    );
  }
}
