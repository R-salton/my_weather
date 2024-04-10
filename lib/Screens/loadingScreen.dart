import 'package:flutter/material.dart';
import 'package:my_weather/Screens/mainscreen.dart';
import 'package:my_weather/utilities/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:my_weather/utilities/Weather.dart';

const apiKey = "VJCWKL7CVRHRMR3PLPTNZDMKF";
const openWeathermapUrl = "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/weatherdata/forecast?iconSet=icons1&aggregateHours=24&combinationMethod=aggregate&shortColumnNames=true&contentType=json&unitGroup=metric&locationMode=single&locations=";

// -1.9508938,30.0588764&forecastDays=7&key=VJCWKL7CVRHRMR3PLPTNZDMKF

// https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/38.9697,-77.385?key=VJCWKL7CVRHRMR3PLPTNZDMKF

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double longtude = 0;
  double latitude = 0;
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLoaction();
  }

  void getLoaction() async {
    WeatherBrain weatherBrain = WeatherBrain();

    Position position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.low);
    longtude = position.longitude;
    latitude = position.latitude;
    String url = "$openWeathermapUrl$latitude,$longtude&forecastDays=7&key=$apiKey";

    var weatherData = await weatherBrain.getCurrentWeather(url);
    // print(weatherData);

    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return MainScreen(weatherData: weatherData);
        },
      ),
    );
    // print(weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kDarkContainerColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SpinKitRotatingCircle(
            color: Colors.white,
            size: 50.0,
          )
        ],
      ),
    );
  }
}
