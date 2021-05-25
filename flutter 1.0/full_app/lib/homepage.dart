import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main() {
  runApp(
    MaterialApp(
      title: 'Use Api',
      home:HomePage(),
      theme: ThemeData(primarySwatch: Colors.brown),
      debugShowCheckedModeBanner: false,
    )
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

var url='https://jsonplaceholder.typicode.com/photos';
var data;
var datalen;

  @override
  void initState() {
    super.initState();
    getData();
  }
  getData() async{
  var res=await http.get(Uri.parse(url));
   data= jsonDecode(res.body);
   datalen=data.length;
   setState(() {
     
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        
      ),
      body: data!=null?ListView.builder(itemCount:datalen,itemBuilder: (context,index){
        return ListTile(
          leading: Image.network('${data[index]['url']}'),
          title: Text('Title: ${data[index]['title']}', style: TextStyle(fontSize:15),),
          subtitle: Text('id: ${data[index]['id']}'),
        );
      }):Center(
        child:CircularProgressIndicator(),
      ),
    );
  }
}