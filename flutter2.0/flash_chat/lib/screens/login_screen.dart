import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import './chat_screen.dart';
import '../components/rounded_button.dart';
import '../constants.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';
  // ignore: prefer_typing_uninitialized_variables
  late final _auth = FirebaseAuth.instance;
  bool isLoading = false;

  void onRoundButtonPress() async {
    if (email != '' && password != '') {
      setState(() {
        isLoading = true;
      });
      try {
        // ignore: no_leading_underscores_for_local_identifiers
        final _newUSer = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        // ignore: unnecessary_null_comparison
        if (_newUSer != null) {
          // ignore: use_build_context_synchronously
          Navigator.pushNamed(context, ChatScreen.routeName);
        }
      } catch (e) {
        // ignore: avoid_print
        print(e);
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 200,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                decoration:
                    ktextFieldDecoration.copyWith(hintText: 'Enter Email'),
                onChanged: (value) {
                  email = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                decoration:
                    ktextFieldDecoration.copyWith(hintText: 'Enter Password'),
                onChanged: (value) {
                  password = value;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              RoundedButton(
                onpressed: onRoundButtonPress,
                color: Colors.lightBlueAccent,
                text: 'Login',
                borderRadius: BorderRadius.circular(30.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
