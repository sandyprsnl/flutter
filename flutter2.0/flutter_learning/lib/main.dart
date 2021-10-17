// ignore_for_file: unnecessary_const, avoid_print

import 'package:flutter/material.dart';
import './horizontal_scroll/horizontal_scroll_list.dart';
import 'app_setting/app_setting.dart';
import 'download_and_open_file/download_and_open.dart';
import './slider/slider.dart';
import './slider/basic_demo.dart';
import './slider/no_center_mode.dart';
import './slider/image_slider.dart';
import 'learning_firebase/learning_firebase.dart';
import 'local_notifications/local_notifications.dart';

void main() {
  runApp(ValueListenableBuilder(
      valueListenable: themeMode,
      builder: (context, value, g) {
        return MaterialApp(
          home: const LearningFlutter(),
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.values.toList()[value as int],
          debugShowCheckedModeBanner: false,
          routes: {
            HorizontalScrollList.routName: (ctx) =>
                const HorizontalScrollList(),
            OpenSetting.routName: (ctx) => OpenSetting(),
            DownloadAndOpen.routName: (ctx) => const DownloadAndOpen(),
            FlutterSliders.routName: (ctx) => const FlutterSliders(),
            //slider routs start
            BasicDemo.routName: (ctx) => const BasicDemo(),
            NoCenterDemo.routName: (ctx) => const NoCenterDemo(),
            ImageSlider.routName: (ctx) => const ImageSlider(),
            //Slider routs end
            FlutterNotifications.routName: (ctx) =>
                const FlutterNotifications(),
            LearningFirebase.routName: (ctx) => const LearningFirebase(),
          },
        );
      }));
}

final themeMode = ValueNotifier(2);

class LearningFlutter extends StatelessWidget {
  const LearningFlutter({Key? key}) : super(key: key);

  Widget createListTile({title, subtitle, routName, ctx}) {
    return Card(
      child: ListTile(
        title: title,
        subtitle: subtitle,
        onTap: () {
          Navigator.of(ctx).pushNamed(routName);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learning Flutter'),
        actions: [
          IconButton(
              onPressed: () {
                themeMode.value = themeMode.value == 1 ? 2 : 1;
                print(themeMode.value);
              },
              icon: const Icon(Icons.nightlight_round))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: [
            createListTile(
                ctx: context,
                title: const Text('Horizontal List'),
                subtitle: const Text('How to make  Horizontal List Example'),
                routName: HorizontalScrollList.routName),
            createListTile(
                ctx: context,
                title: const Text('Open App Setting'),
                subtitle:
                    const Text('How to Open Verious App Setting in Flutter'),
                routName: OpenSetting.routName),
            createListTile(
                ctx: context,
                title: const Text('Download and open file'),
                subtitle: const Text('How to Download and open verious file'),
                routName: DownloadAndOpen.routName),
            createListTile(
                ctx: context,
                title: const Text('Flutter Sliders'),
                subtitle: const Text('How to make  Sliders  Examples'),
                routName: FlutterSliders.routName),
            createListTile(
                ctx: context,
                title: const Text('Flutter Notifications'),
                subtitle: const Text('How to make  Flutter Notifications'),
                routName: FlutterNotifications.routName),
            createListTile(
                ctx: context,
                title: const Text('Learning Firebase'),
                subtitle: const Text('How to connect firebase and work'),
                routName: LearningFirebase.routName),
          ],
        ),
      ),
    );
  }
}
