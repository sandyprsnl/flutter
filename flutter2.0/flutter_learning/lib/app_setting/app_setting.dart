import 'package:flutter/material.dart';
import 'package:app_settings/app_settings.dart';

import './app_item.dart';

class OpenSetting extends StatelessWidget {
  static const routName = "/appSetting";
  final List<AppSettingItem> itemList = [
    AppSettingItem(
        title: "open Setting", source: AppSettings.openDeviceSettings),
    AppSettingItem(
        title: "open App Setting", source: AppSettings.openAppSettings),
    AppSettingItem(
        title: "open Battery Optimization Settings",
        source: AppSettings.openBatteryOptimizationSettings),
    AppSettingItem(
        title: "open Bluetooth Settings",
        source: AppSettings.openBluetoothSettings),
    AppSettingItem(
        title: "open Date Settings", source: AppSettings.openDateSettings),
    AppSettingItem(
        title: "open Display Settings",
        source: AppSettings.openDisplaySettings),
    AppSettingItem(
        title: "open Internal Storage Settings",
        source: AppSettings.openInternalStorageSettings),
    AppSettingItem(
        title: "open Location Settings",
        source: AppSettings.openLocationSettings),
    AppSettingItem(
        title: "open NFC Settings", source: AppSettings.openNFCSettings),
    AppSettingItem(
        title: "open Notification Settings",
        source: AppSettings.openNotificationSettings),
    AppSettingItem(
        title: "open Security Settings",
        source: AppSettings.openSecuritySettings),
    AppSettingItem(
        title: "open Sound Settings", source: AppSettings.openSoundSettings),
    AppSettingItem(
        title: "open  VPN Settings", source: AppSettings.openVPNSettings),
    AppSettingItem(
        title: "open WIFI Settings", source: AppSettings.openWIFISettings),
  ];

  Widget setting(title, source) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: ElevatedButton(
        onPressed: source,
        child: Text(title),
      ),
    );
  }

  OpenSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Open Setting '),
      ),
      body: ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (ctx, index) {
          return setting(itemList[index].title, itemList[index].source);
        },
      ),
    );
  }
}
