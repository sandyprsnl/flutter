// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import './widgets/horizontal_list_item.dart';

class HorizontalScrollList extends StatefulWidget {
  static const String routName = "/horizontalScrollList";

  const HorizontalScrollList({Key? key}) : super(key: key);

  @override
  State<HorizontalScrollList> createState() => _HorizontalScrollListState();
}

class _HorizontalScrollListState extends State<HorizontalScrollList> {
  final List<CardList> itemList = [
    CardList(imgUrl: 'images/1.jpg', title: 'a', price: '22'),
    CardList(imgUrl: 'images/2.png', title: 'a', price: '22'),
    CardList(imgUrl: 'images/1.jpg', title: 'a', price: '22'),
  ];

  Widget createImage({imgUrl, title, price}) {
    return Row(
      children: [
        Column(
          children: [
            SizedBox(
              width: 200,
              child: AspectRatio(
                aspectRatio: 4 / 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imgUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Text(title),
            Text(price),
          ],
        ),
        // SizedBox(
        //   width: 10,
        // )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('horizontal scroll list'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView.separated(
          separatorBuilder: (context, _) => SizedBox(
            width: 12,
          ),
          itemCount: itemList.length,
          itemBuilder: (ctx, index) {
            return createImage(
              imgUrl: itemList[index].imgUrl,
              title: itemList[index].title,
              price: itemList[index].price,
            );
          },
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
