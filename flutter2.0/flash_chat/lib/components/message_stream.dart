import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './message_bubble.dart';

class MessageStream extends StatelessWidget {
  final _fireStore = FirebaseFirestore.instance;
  final User? loggedInUser;
  MessageStream({Key? key, required this.loggedInUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream:
            _fireStore.collection('messages').orderBy('datetime').snapshots(),
        builder: (context, snapshot) {
          List<MessageBubble> messageWidgets = [];
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.lightBlueAccent,
              ),
            );
          }
          final messages = snapshot.data?.docs.reversed.toList();
          messages?.forEach((element) {
            final messageText = element.get('text');
            final messageSender = element.get('sender');
            final messageDateTime = element.get('datetime');
            final messageWidget = MessageBubble(
              messageSender: messageSender,
              messageText: messageText,
              isMe: messageSender == loggedInUser?.email,
              messageDateTime: messageDateTime,
            );
            messageWidgets.add(messageWidget);
          });
          return Expanded(
            child: ListView(
              reverse: true,
              children: messageWidgets,
            ),
          );
        });
  }
}
