// ignore: import_of_legacy_library_into_null_safe
import 'package:geolocator/geolocator.dart';

class Loaction {
  double latitude = 0.0;
  double longitude = 0.0;

  Future<void> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    latitude = position.latitude;
    longitude = position.longitude;
  }
}
