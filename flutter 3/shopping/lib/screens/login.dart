import 'package:flutter/material.dart';
import 'home.dart';

class Login extends StatefulWidget {
  static String routeName = "/";
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          Image.asset('assets/images/login.png'),
          const Text('Welcome'),
          TextFormField(
            decoration: const InputDecoration(
                label: Text('Email'), hintText: "Enter Email"),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: const InputDecoration(
                label: Text('Password'), hintText: "Enter Password"),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () => {Navigator.pushNamed(context, Home.routeName)},
            child: Container(
              width: 100,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(8)),
              child: const Text(
                'Login',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // ElevatedButton(
          //     style: TextButton.styleFrom(minimumSize: const Size(100, 40)),
          //     child: const Text('Login'),
          //     onPressed: () => {Navigator.pushNamed(context, Home.routeName)})
        ]),
      ),
    ));
  }
}
