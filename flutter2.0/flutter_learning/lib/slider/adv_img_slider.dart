// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import './items_list.dart';

class AdvImagSlider extends StatelessWidget {
  static const routName = "AdvImagSlider";
  const AdvImagSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Advance Image Slider'),
      ),
      body: CarouselSlider(
        items: imgList
            .map(
              (img) => Container(
                margin: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  child: Stack(
                    children: [
                      Image.network(
                        img,
                        fit: BoxFit.cover,
                        width: 1000,
                      ),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            // ignore: prefer_const_literals_to_create_immutables
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(200, 2000, 0, 0),
                                Color.fromARGB(0, 0, 0, 0),
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          child: Text(
                            "No ${imgList.indexOf(img)} Image",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
            .toList(),
        options: CarouselOptions(),
      ),
    );
  }
}
