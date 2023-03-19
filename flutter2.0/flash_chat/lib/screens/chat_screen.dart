import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../components/message_stream.dart';
import '../constants.dart';

class ChatScreen extends StatefulWidget {
  static const String routeName = '/chat';
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  String messageText = '';
  User? loggedInUser;
  TextEditingController textFieldController = TextEditingController();
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser != null) {
        loggedInUser = currentUser;
        print(loggedInUser?.email);
      }
    } catch (e) {
      print(e);
    }
  }

  // void getMessages() async {
  //   final messages = await _fireStore.collection('messages').get();
  //   messages.docs.asMap().entries.forEach((element) {
  //     print(element.value.data());
  //   });
  // }
  // void messagesStream() async {
  //   await for (var snapshots in _fireStore.collection('messages').snapshots()) {
  //     for (var snapshot in snapshots.docs) {
  //       print(snapshot.data());
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // messagesStream();
    return Scaffold(
      appBar: AppBar(
        title: const Text('⚡️ Chat'),
        actions: [
          IconButton(
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close))
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(
              loggedInUser: loggedInUser,
            ),
            Container(
              decoration: kmessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: kmessageTextFieldDecoration,
                      onChanged: (val) {
                        messageText = val;
                      },
                      controller: textFieldController,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _fireStore.collection('messages').add(
                        {
                          'sender': loggedInUser?.email,
                          'text': messageText,
                          'datetime': Timestamp.now()
                        },
                      );
                      textFieldController.clear();
                    },
                    child: const Text(
                      'Send',
                      style: ksendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
