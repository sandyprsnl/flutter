import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

List dayname = [
  'Sunday',
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thuresday',
  'Friday',
  'Saturday'
];

class MessageBubble extends StatelessWidget {
  final String messageText;
  final String messageSender;
  final Timestamp messageDateTime;
  final bool isMe;
  const MessageBubble(
      {Key? key,
      required this.messageSender,
      required this.messageText,
      required this.isMe,
      required this.messageDateTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            messageSender.split('@')[0],
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          Material(
            elevation: 5.0,
            borderRadius: BorderRadius.only(
                topLeft: isMe ? const Radius.circular(15) : Radius.zero,
                topRight: isMe ? Radius.zero : const Radius.circular(15),
                bottomLeft: const Radius.circular(15),
                bottomRight: const Radius.circular(15)),
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Text(
                messageText,
                style: TextStyle(
                    fontSize: 16, color: isMe ? Colors.white : Colors.black),
              ),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          // Text(
          //   '${dayname[messageDateTime.toDate().weekday]} at ${messageDateTime.toDate().hour}: ${messageDateTime.toDate().minute}',
          //   style: const TextStyle(fontSize: 12, color: Colors.grey),
          // )
        ],
      ),
    );
  }
}
