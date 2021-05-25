

import '../views/post.dart';

import '../widgets/widget.dart';
import 'package:flutter/material.dart';

class PostTile extends StatefulWidget {
  final String href,title,desc,content;
PostTile({this.href,this.content,this.desc,this.title});

  @override
  _PostTileState createState() => _PostTileState();
}

class _PostTileState extends State<PostTile> {
   var imageUrl='';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          Navigator.push(
            context, MaterialPageRoute(
              builder: (context)=>Post(imageUrl: imageUrl,title: widget.title,content: widget.content,)
              )
              );
        },
          child: Container(
        padding: EdgeInsets.symmetric(vertical:16,horizontal:4),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          FutureBuilder(
            future: fetchWpPostImageUrl(widget.href),
            builder: (context,snapshot){
              if(snapshot.hasData){
                  imageUrl=snapshot.data['guid']["rendered"];
                  return Image.network(snapshot.data['guid']["rendered"]);
              }
              return CircularProgressIndicator();
            }
            ),
            SizedBox(height:8),
          Text(widget.title,
          style: TextStyle(fontSize:18),
          ),
          SizedBox(height:5),
          Text(widget.desc),
        ],
        )
      ),
    );
  }
}