import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main() {
  runApp(
    MaterialApp(
      title: 'Use Api',
      home:UsingApi(),
      theme: ThemeData(primarySwatch: Colors.brown),
      debugShowCheckedModeBanner: false,
    )
  );
}

class UsingApi extends StatefulWidget {
  @override
  _UsingApiState createState() => _UsingApiState();
}

class _UsingApiState extends State<UsingApi> {

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
   print(data);
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
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Sandeep'),
              subtitle: Text('Bhardwaj'),
              trailing: Icon(Icons.edit),
            ),
          ],
        ),
      ),
    );
  }
}