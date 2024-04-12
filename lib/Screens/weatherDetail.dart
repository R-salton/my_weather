import 'package:flutter/material.dart';
import 'package:my_weather/utilities/constants.dart';
import 'package:my_weather/utilities/custom_widgets.dart';
import 'package:my_weather/utilities/weatherInfos.dart';

// ignore: must_be_immutable
class WeatherDetail extends StatefulWidget {
  WeatherDetail(
      {super.key, this.day1, this.day2, this.day3, this.day4, this.day5});
  dynamic day1;
  dynamic day2;
  dynamic day3;
  dynamic day4;
  dynamic day5;

  @override
  State<WeatherDetail> createState() => _WeatherDetailState();
}

class _WeatherDetailState extends State<WeatherDetail> {
  dynamic weatherData;

  dynamic day1;
  dynamic day2;
  dynamic day3;
  dynamic day4;
  dynamic day5;

// get Name of The day
  String weekDay(String time) {
    var dayNumber = DateTime.parse(time).weekday;
    var nameOfDay = getDay(dayNumber);
    return nameOfDay;
  }

  @override
  void initState() {
    super.initState();

    day1 = widget.day1;
    day2 = widget.day2;
    day3 = widget.day3;
    day4 = widget.day3;
    day5 = widget.day4;
  }

  @override
  Widget build(BuildContext context) {
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
                    Stack(
                      children: [
                        Row(
                          children: [
                            Image(
                              image: NetworkImage(
                                  "$kImageUrl${day1["icon"]}.png",
                                  scale: 0.1),
                              height: 130,
                            ),
                            Column(
                              children: [
                                const Text(
                                  "Tomorrow",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  day2['condition'],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50, top: 80),
                          child: Text(
                            "${day2["maxTemperature"].toInt()}°",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 70,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 130, top: 120),
                          child: Text(
                            "/${day2["minTemperature"]}°",
                            style: const TextStyle(
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
                            data: "${day2["hummidity"]}°",
                            comment: "Hummidity",
                            imageUrl: "assets/icons/drop.png",
                          ),
                          weatherWithImage(
                            data: "${day2["windSpeed"]}km/h",
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
                      comment: "${day1["condition"]}",
                      iconImage: day1["icon"],
                      tempDown: day1["minTemperature"],
                      temperature: day1["maxTemperature"],
                      day: weekDay(day1["weekDay"]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    WeeklyForecast(
                      comment: "${day2["condition"]}",
                      iconImage: day2["icon"],
                      tempDown: day2["minTemperature"],
                      temperature: day2["maxTemperature"],
                      day: weekDay(day2["weekDay"]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    WeeklyForecast(
                      comment: "${day3["condition"]}",
                      iconImage: day3["icon"],
                      tempDown: day3["minTemperature"],
                      temperature: day3["maxTemperature"],
                      day: weekDay(day3["weekDay"]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    WeeklyForecast(
                      comment: "${day4["condition"]}",
                      iconImage: day4["icon"],
                      tempDown: day4["minTemperature"],
                      temperature: day4["maxTemperature"],
                      day: weekDay(day4["weekDay"]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    WeeklyForecast(
                      comment: "${day5["condition"]}",
                      iconImage: day5["icon"],
                      tempDown: day5["minTemperature"],
                      temperature: day5["maxTemperature"],
                      day: weekDay(day5["weekDay"]),
                    ),
                    const SizedBox(
                      height: 10,
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
            flex: 5,
            child: Container(
              padding: const EdgeInsets.only(left: 8, right: 8),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: NetworkImage("$kImageUrl$iconImage.png", scale: 0.3),
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
            width: 5,
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
