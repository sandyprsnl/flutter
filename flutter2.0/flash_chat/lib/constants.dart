import 'package:flutter/material.dart';

const ksendButtonTextStyle = TextStyle(
    fontSize: 18.0, color: Colors.lightBlueAccent, fontWeight: FontWeight.bold);

const kmessageTextFieldDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    hintText: 'Type Your message hare..',
    border: InputBorder.none);
const kmessageContainerDecoration = BoxDecoration(
    border: Border(top: BorderSide(width: 2.0, color: Colors.lightBlueAccent)));

const ktextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(32),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1),
    borderRadius: BorderRadius.all(
      Radius.circular(32),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1),
    borderRadius: BorderRadius.all(
      Radius.circular(32),
    ),
  ),
);
