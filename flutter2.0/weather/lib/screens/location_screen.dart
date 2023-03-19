import 'package:flutter/material.dart';
import '../utilities/constents.dart';
import '../services/weather.dart';
import './city_screen.dart';

class LocationScreen extends StatefulWidget {
  final dynamic weatherData;
  const LocationScreen({this.weatherData, Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int condition = 0;
  int temp = 0;
  String cityName = "";
  String weatherIcon = "Error";
  String weatherMessage = "Unable to get Weather data";
  WeatherModel weatherModel = WeatherModel();
  @override
  void initState() {
    super.initState();
    setWeather(widget.weatherData);
  }

  void setWeather(weatherdata) {
    if (weatherdata == null) {
      return;
    }
    setState(() {
      condition = weatherdata['weather'][0]['id'];
      temp = (weatherdata['main']['temp']).toInt();
      cityName = weatherdata['name'];
      weatherIcon = weatherModel.getWeatherIcon(condition);
      weatherMessage = weatherModel.getMessage(temp);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_bg.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherData = await weatherModel.getLocationWeather();
                      setState(() {
                        setWeather(weatherData);
                      });
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typedCity = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const CityScreen();
                          },
                        ),
                      );
                      if (typedCity != null) {
                        var cityData =
                            await WeatherModel().getCityWeather(typedCity);
                        setState(() {
                          setWeather(cityData);
                        });
                      }
                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 50,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temp °',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "$weatherMessage in $cityName!",
                        style: kMessageTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
