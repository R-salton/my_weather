import 'package:flutter/material.dart';
import 'package:my_weather/utilities/constants.dart';
import 'package:my_weather/utilities/custom_widgets.dart';
import 'package:my_weather/utilities/weatherInfos.dart';
import 'package:my_weather/utilities/weeklyData.dart';

class WeatherDetail extends StatefulWidget {
  WeatherDetail({super.key, this.weatherData});
  dynamic weatherData;

  @override
  State<WeatherDetail> createState() => _WeatherDetailState();
}

class _WeatherDetailState extends State<WeatherDetail> {
  dynamic weatherData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print(widget.weatherData);
    weatherData = widget.weatherData;
  }

  @override
  Widget build(BuildContext context) {
    WeeklyData weeklyData = WeeklyData();
    int day = DateTime.parse("2024-04-11T00:00:00+02:00").weekday;
    String weeklyDay = getDay(day);
  

    return Scaffold(
      backgroundColor: kDarkContainerColor,
      body: SafeArea(
          child: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: TopMenu(
                  onClick: () {
                    Navigator.pop(context);
                  },
                  leftIcon: "assets/icons/back2.png",
                  title: "7 Days",
                  rightIcon: const Icon(
                    Icons.menu_outlined,
                    color: Colors.white,
                  ),
                  iconColors: kLightContainerColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MyContainer(
                height: 320.0,
                width: 350.0,
                bgColor: kLightContainerColor,
                child: Column(
                  children: [
                    const Stack(
                      children: [
                        Row(
                          children: [
                            Image(
                              image: AssetImage(
                                "assets/icons/cloudy.png",
                              ),
                              height: 130,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Tomorrow",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Mostly Cloudy",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 50, top: 80),
                          child: Text(
                            "19°",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 70,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 130, top: 120),
                          child: Text(
                            "/15°",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          weatherWithImage(
                            data: "24°",
                            imageUrl: "assets/icons/protection.png",
                            comment: "Precipitation",
                          ),
                          weatherWithImage(
                            data: "23°",
                            comment: "Hummidity",
                            imageUrl: "assets/icons/drop.png",
                          ),
                          weatherWithImage(
                            data: "9km/h",
                            comment: "Wind speed",
                            imageUrl: "assets/icons/wind.png",
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MyContainer(
                paddingTop: 10,
                child: Column(
                  children: [
                    WeeklyForecast(
                      comment: "Raining",
                      iconImage: "assets/icons/raining.png",
                      tempDown: 19,
                      temperature: 18,
                      day: weeklyDay,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const WeeklyForecast(
                      comment: "Sunny",
                      iconImage: "assets/icons/sunny.png",
                      tempDown: 6,
                      temperature: 19,
                      day: "Tuesday",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const WeeklyForecast(
                      comment: "Cloudy",
                      iconImage: "assets/icons/cloudy.png",
                      tempDown: 10,
                      temperature: 15,
                      day: "Wednesday",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const WeeklyForecast(
                      comment: "Sunny",
                      iconImage: "assets/icons/sunny.png",
                      tempDown: 12,
                      temperature: 8,
                      day: "Thursday",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const WeeklyForecast(
                      comment: "Raining",
                      iconImage: "assets/icons/raining.png",
                      tempDown: 6,
                      temperature: 12,
                      day: "Friday",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const WeeklyForecast(
                      comment: "Sunny",
                      iconImage: "assets/icons/sunny.png",
                      tempDown: 6,
                      temperature: 19,
                      day: "Tuesday",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const WeeklyForecast(
                      comment: "Sunny",
                      iconImage: "assets/icons/sunny.png",
                      tempDown: 6,
                      temperature: 19,
                      day: "Tuesday",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}

class WeeklyForecast extends StatelessWidget {
  const WeeklyForecast(
      {super.key,
      this.comment,
      this.day,
      this.iconImage,
      this.tempDown,
      this.temperature});

  final String? iconImage;
  final String? comment;
  final String? day;
  final int? temperature;
  final int? tempDown;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 17.0, right: 17.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              "$day",
              style: kSubTitleStyle,
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.only(left: 15, right: 15),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage("$iconImage"),
                    height: 50,
                    width: 50,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "$comment",
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              "+$temperature°",
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              "-$tempDown°",
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

void goBack(context) {
  Navigator.pop(context);
}
