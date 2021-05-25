import 'package:flutter/material.dart';

getFormField({field, forcast}) {
  return Container(
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(10),
    // decoration: BoxDecoration(color: Colors.blue),
    child: Card(
      color: Colors.blueAccent,
      child: ListTile(
        title: Row(
          children: [
            Text(
              field + ': ',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              forcast,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    ),
  );
}
