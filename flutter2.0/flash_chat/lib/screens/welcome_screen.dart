import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import './login_screen.dart';
import './registration_screen.dart';
import '../components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    animation = ColorTween(
            begin: const Color.fromARGB(255, 70, 68, 68), end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  void loginButtonCallback() {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  void registerButtonCallback() {
    Navigator.pushNamed(context, RegisterScreen.routeName);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 60.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      speed: const Duration(milliseconds: 250),
                      'Flash Chat',
                      textStyle: const TextStyle(
                          fontSize: 45.0, fontWeight: FontWeight.w900),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: RoundedButton(
              onpressed: loginButtonCallback,
              color: Colors.lightBlueAccent,
              text: 'Log In',
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: RoundedButton(
              color: Colors.blueAccent,
              onpressed: registerButtonCallback,
              text: 'Register',
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ],
      ),
    );
  }
}
