import 'package:flutter/material.dart';

import 'views/home-page.dart';

void main()=>runApp(
  MaterialApp(
    title: 'JGU Blogs',
    home: Homepge(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.blue,
    ),
  )
);
