import 'package:url_launcher/url_launcher.dart';

class MapUtils {
  MapUtils._();
  static Future<void> openMap(
    double latitude,
    double longitude,
  ) async {
    String googleMapUrl =
        "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";

    if (!await canLaunch(googleMapUrl)) {
      await launch(googleMapUrl);
    } else {
      print(canLaunch(googleMapUrl));
      throw 'could not open Map';
    }
  }
}
