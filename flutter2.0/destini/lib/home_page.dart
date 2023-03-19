import 'package:flutter/material.dart';
import './story_bank.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StoryBank storyBank = StoryBank();
  Widget createButton({required String btnText, required Color bgColor}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          style: TextButton.styleFrom(backgroundColor: bgColor),
          onPressed: () {
            if (bgColor == Colors.green) {
              setState(() {
                storyBank.nextStory(1);
              });
            } else {
              setState(() {
                storyBank.nextStory(2);
              });
            }
          },
          child: Text(
            btnText,
            style: const TextStyle(
              fontSize: 25.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'images/background.png',
              ),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    storyBank.getStory(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 25.0, color: Colors.white),
                  ),
                ),
              ),
            ),
            createButton(
                bgColor: Colors.green, btnText: storyBank.getChoice1()),
            Visibility(
              visible: storyBank.buttonShouldVisiable(),
              child: createButton(
                bgColor: Colors.red,
                btnText: storyBank.getChoice2(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
