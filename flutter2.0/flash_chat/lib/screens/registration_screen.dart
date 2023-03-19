import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../components/rounded_button.dart';
import '../constants.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/register';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String email = '';
  String password = '';
  bool isloading = false;
  final _auth = FirebaseAuth.instance;

  void onRoundButtonPress() async {
    if (email != '' && password != '') {
      setState(() {
        isloading = true;
      });
      try {
        final newUSer = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        // ignore: unnecessary_null_comparison
        if (newUSer != null) {
          // ignore: use_build_context_synchronously
          Navigator.pushNamed(context, ChatScreen.routeName);
        }
        setState(() {
          isloading = false;
        });
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: isloading,
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
              const SizedBox(
                height: 20,
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
                  text: 'Register',
                  borderRadius: BorderRadius.circular(30.0))
            ],
          ),
        ),
      ),
    );
  }
}
