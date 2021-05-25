import '../widgets/post-tile.dart';

import '../widgets/widget.dart';
import 'package:flutter/material.dart';

class Homepge extends StatefulWidget {
  @override
  _HomepgeState createState() => _HomepgeState();
}

class _HomepgeState extends State<Homepge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JGU Blogs'),
      ),
      body: Container(
        child: FutureBuilder(
            future: fetchWpPosts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    Map wppost = snapshot.data[index];
                    // var imageapi=wppost['_links']['wp:featuredmedia'][0]["href"];
                    return PostTile(
                      href: wppost['_links']["wp:featuredmedia"][0]["href"],
                      title:
                          wppost['title']['rendered'].replaceAll('&#8217;', ''),
                      desc: wppost['excerpt']['rendered'],
                      content: wppost['content']['rendered'],
                    );
                  },
                );
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
