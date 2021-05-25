import 'package:flutter/material.dart';

// import 'package:flutter_html_view/flutter_html_view.dart';

class Post extends StatefulWidget {
  final String imageUrl,title,content;
  Post({ this.imageUrl,this.title,this.content});

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  
  // Widget postContent(htmlContent){
  //   return HtmlView(
  //     data:htmlContent,
  //     onLaunchFail: (url){
  //       print('launch $url failed');
  //     },
  //     scrollable: false,
      
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text(widget.title),
      ),
      body:Container(
        child:Column(children:<Widget> [
          Image.network(widget.imageUrl),
          Text(widget.title),
          // postContent(widget.content),
        ],),
      ),
    );
  }
}