import 'package:http/http.dart' as http;
import 'dart:convert';
Future<List> fetchWpPosts() async{
  var url='http://jgudev.in/jgunew/wp-json/wp/v2/posts';
  var result= await http.get(url,
  headers:{
    'Accept':"application/json",
  }
  );
  var res= jsonDecode(result.body);
  // print(res);
  return res;
}
Future fetchWpPostImageUrl(href) async{
  var url=href;
  var result= await http.get(Uri.parse(url),
  headers:{
    'Accept':"application/json",
  }
  );
  var res= jsonDecode(result.body);
  // print(res);
  return res;
}