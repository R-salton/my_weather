import 'package:flutter/material.dart';
import 'package:my_weather/Screens/mainscreen.dart';
import 'package:my_weather/utilities/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:my_weather/utilities/Weather.dart';

const apiKey = "9f5aef89485cbeed52640c1491e5ca2c";
const openWeathermapUrl = "https://api.openweathermap.org/data/2.5/weather";

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
    String url = "$openWeathermapUrl?lat=$latitude&lon=$longtude&appid=$apiKey&units=metric";

    var weatherData = await weatherBrain.getCurrentWeather(url);

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
