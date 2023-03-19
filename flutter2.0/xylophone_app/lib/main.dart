import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MaterialApp(
      title: "Xylophone App",
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: const Text('Xylophone'),
          ),
          body: const HomePage(),
        ),
      ),
    ));

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static AudioCache player = AudioCache();

  Widget playerButton({required int soundnum, required Color backgroundColor}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: backgroundColor),
        child: const Text(''),
        onPressed: () {
          player.play('assets_note$soundnum.wav');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        playerButton(soundnum: 1, backgroundColor: Colors.red),
        playerButton(soundnum: 2, backgroundColor: Colors.orange),
        playerButton(soundnum: 3, backgroundColor: Colors.yellow),
        playerButton(soundnum: 4, backgroundColor: Colors.green),
        playerButton(soundnum: 5, backgroundColor: Colors.teal),
        playerButton(soundnum: 6, backgroundColor: Colors.blue),
        playerButton(soundnum: 7, backgroundColor: Colors.purple),
      ],
    );
  }
}
