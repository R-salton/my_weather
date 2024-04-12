import 'package:flutter/material.dart';
import 'package:my_weather/Screens/mainscreen.dart';
import 'package:my_weather/utilities/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:my_weather/utilities/Weather.dart';
import 'package:my_weather/utilities/weeklyData.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

var apiKey = dotenv.env['API_KEY'];
const openWeathermapUrl = "https://api.openweathermap.org/data/2.5/forecast";

// -1.9508938,30.0588764&forecastDays=7&key=VJCWKL7CVRHRMR3PLPTNZDMKF
// https://api.openweathermap.org/data/2.5/forecast?lat=-1.9508938&lon=30.0588764&units=metric&cnt=5&appid=3fb0e15fc04f71d2f53b1f9510f5efb3

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double longtude = 0;
  double latitude = 0;

  dynamic day1;
  dynamic day2;
  dynamic day3;
  dynamic day4;
  dynamic day5;

  String? weekDay;

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
    String url =
        "$openWeathermapUrl?lat=$latitude&lon=$longtude&units=metric&cnt=5&appid=$apiKey";

    var weatherData = await weatherBrain.getCurrentWeather(url);
    // print(weatherData);
    updateInterface(weatherData);
    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return MainScreen(
            weatherData: weatherData,
            day1: day1,
            day2: day2,
            day3: day3,
            day4: day4,
            day5: day5,
          );
        },
      ),
    );
    // print(weatherData);
  }

  void updateInterface(dynamic weatherInfo) async {
    WeeklyData weeklydata = WeeklyData(weatherData: weatherInfo);
    day1 = await weeklydata.day1();
    day2 = await weeklydata.day2();
    day3 = await weeklydata.day3();
    day4 = await weeklydata.day4();
    day5 = await weeklydata.day5();
    // print(day1);
    // weekDay = getDay(DateTime.parse(day1['weekDay']).weekday);
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
