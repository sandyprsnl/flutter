import '../services/location.dart';
import '../services/networking.dart';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Loaction loaction = Loaction();
    await loaction.getLocation();
    // print("lat ${loaction.latitude}");
    // print("lag ${loaction.longitude}");
    Networking networking =
        Networking(latitude: loaction.latitude, longitude: loaction.longitude);
    return await networking.getData();
    // print(weatherdata);
  }

  Future<dynamic> getCityWeather(String city) async {
    Networking networking = Networking();
    return await networking.getCityData(city);
    // print(weatherdata);
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
