import 'package:flutter/material.dart';

class DownloadAndOpen extends StatelessWidget {
  static const routName = "downloadAndOpenFile";
  const DownloadAndOpen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Download and open file'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.download),
                label: const Text('Download and Open'))
          ],
        ),
      ),
    );
  }
}
