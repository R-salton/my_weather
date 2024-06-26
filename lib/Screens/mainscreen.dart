import 'package:flutter/material.dart';
import 'package:my_weather/Screens/weatherDetail.dart';
import 'package:my_weather/utilities/constants.dart';
import 'package:my_weather/utilities/custom_widgets.dart';
import 'package:my_weather/utilities/weatherInfos.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, this.weatherData, this.day1, this.day2, this.day3,this.day4,this.day5});

  final weatherData;
  final day1;
  final day2;
  final day3;
  final day4;
  final day5;
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String comment = "You Weather";
  int temperature = 0;
  String cityName = "Your Location";
  int hummidity = 0;
  int windSpeeed = 0;
  String weatherIcon = "";
  dynamic weatherData;
  dynamic day_1Data;
  dynamic day_2Data;
  dynamic day_3Data;
  dynamic day_4Data;
  dynamic day_5Data;

  final time = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.weatherData);
    // print(widget.weatherData);
    weatherData = widget.weatherData;
    day_1Data = widget.day1;
    day_2Data = widget.day2;
    day_3Data = widget.day3;
    day_4Data = widget.day4;
    day_4Data = widget.day5;
    print(time.year);
  }

  void updateUI(dynamic locationWeather) {
    comment = locationWeather["list"][0]["weather"][0]["description"];
    temperature = (locationWeather["list"][0]["main"]["temp"]).toInt();
    hummidity = (locationWeather["list"][0]["main"]["humidity"]).toInt();
    windSpeeed = (locationWeather["list"][0]["wind"]["speed"]).toInt();
    weatherIcon = locationWeather["list"][0]["weather"][0]["icon"];
    cityName = locationWeather["city"]["name"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainScreenScafoldBgColor,
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0, top: 18.0, right: 18.0),
            child: Column(
              children: [
                TopMenu(
                  onClick: () {},
                  leftIcon: "assets/icons/menu1.png",
                  rightIcon: const Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                  iconColors: kDarkContainerColor,
                  title: cityName,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  comment,
                  style: const TextStyle(color: Colors.white),
                ),
                Stack(
                  children: [
                    Text(
                      "$temperature°",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 130,
                          fontWeight: FontWeight.bold),
                    ),
                    Opacity(
                      opacity: 0.9,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 80.0, top: 80.0),
                        child: Image(
                          height: 100,
                          image: NetworkImage(
                              'http://openweathermap.org/img/w/$weatherIcon.png',
                              scale: 0.01),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${getDay(time.weekday)} ${time.day}, ${time.month}, ${time.year} | ${time.hour}:${time.minute}",
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(
                  height: 20,
                ),
                MyContainer(
                  height: 140.0,
                  width: 350.0,
                  bgColor: kDarkContainerColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      weatherWithImage(
                        data: "24°",
                        imageUrl: "assets/icons/protection.png",
                        comment: "Precipitation",
                      ),
                      weatherWithImage(
                        data: "$hummidity°",
                        comment: "Hummidity",
                        imageUrl: "assets/icons/drop.png",
                      ),
                      weatherWithImage(
                        data: "$windSpeeed/h",
                        comment: "Wind speed",
                        imageUrl: "assets/icons/wind.png",
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Today?", style: kSubTitleStyle),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return WeatherDetail(
                                day1: day_1Data,
                                day2: day_2Data,
                                day3: day_3Data,
                                day4: day_4Data,
                                day5: day_5Data,
                                
                              );
                            }),
                          );
                        },
                        child: const Text(
                          "7 Days Forecast",
                          style: kSubTitleStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyContainer(
                            width: 80,
                            height: 110,
                            paddingTop: 15,
                            bgColor: kDarkContainerColor,
                            child: HourlyInfo(
                              iconImage: "assets/icons/drop.png",
                              time: 10,
                              temperature: 14,
                              timePart: "AM",
                            )),
                        const SizedBox(
                          width: 13,
                        ),
                        MyContainer(
                            width: 80,
                            height: 110,
                            paddingTop: 15,
                            bgColor: kDarkContainerColor,
                            child: HourlyInfo(
                              iconImage: 'assets/icons/sunny.png',
                              time: 11,
                              temperature: 18,
                              timePart: "AM",
                            )),
                        const SizedBox(
                          width: 13,
                        ),
                        MyContainer(
                          width: 80,
                          height: 110,
                          paddingTop: 15,
                          bgColor: kDarkContainerColor,
                          child: HourlyInfo(
                            time: 12,
                            temperature: 23,
                            iconImage: "assets/icons/raining.png",
                            timePart: "PM",
                          ),
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        MyContainer(
                          width: 80,
                          height: 110,
                          paddingTop: 15,
                          bgColor: kDarkContainerColor,
                          child: HourlyInfo(
                            time: 14,
                            temperature: 15,
                            iconImage: "assets/icons/raining.png",
                            timePart: "PM",
                          ),
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        MyContainer(
                          width: 80,
                          height: 110,
                          paddingTop: 15,
                          bgColor: kDarkContainerColor,
                          child: HourlyInfo(
                            time: 15,
                            temperature: 16,
                            iconImage: "assets/icons/cloud.png",
                            timePart: "PM",
                          ),
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        MyContainer(
                          width: 80,
                          height: 110,
                          paddingTop: 15,
                          bgColor: kDarkContainerColor,
                          child: HourlyInfo(
                            time: 17,
                            temperature: 14,
                            iconImage: "assets/icons/cloudy.png",
                            timePart: "PM",
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Other Cities",
                        style: kSubTitleStyle,
                      ),
                      Text(
                        "+",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        MyContainer(
                          width: 220,
                          height: 60,
                          paddingTop: 2,
                          bgColor: kDarkContainerColor,
                          child: const Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image(
                                image: AssetImage('assets/icons/cloudy.png'),
                                width: 40,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "New York",
                                    style: kSubTitleStyle,
                                  ),
                                  Text(
                                    "Sunny",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ],
                              ),
                              Text(
                                "34°",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        MyContainer(
                          width: 220,
                          height: 60,
                          paddingTop: 2,
                          bgColor: kDarkContainerColor,
                          child: const Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image(
                                image: AssetImage('assets/icons/drop.png'),
                                width: 40,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "London",
                                    style: kSubTitleStyle,
                                  ),
                                  Text(
                                    "Cold",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ],
                              ),
                              Text(
                                "09°",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        MyContainer(
                          width: 220,
                          height: 60,
                          paddingTop: 2,
                          bgColor: kDarkContainerColor,
                          child: const Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image(
                                image: AssetImage('assets/icons/cloud.png'),
                                width: 40,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Kigali",
                                    style: kSubTitleStyle,
                                  ),
                                  Text(
                                    "Sunny",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ],
                              ),
                              Text(
                                "17°",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        MyContainer(
                          width: 220,
                          height: 60,
                          paddingTop: 2,
                          bgColor: kDarkContainerColor,
                          child: const Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image(
                                image: AssetImage('assets/icons/raining.png'),
                                width: 40,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Beijing",
                                    style: kSubTitleStyle,
                                  ),
                                  Text(
                                    "Raining",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ],
                              ),
                              Text(
                                "10°",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HourlyInfo extends StatelessWidget {
  HourlyInfo(
      {super.key, this.time, this.temperature, this.iconImage, this.timePart});

  int? time;
  int? temperature;
  String? iconImage;

  String? timePart;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "${time.toString()} $timePart",
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Image(
          image: AssetImage(iconImage ?? ""),
          width: 40,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "${temperature.toString()}°",
          style: kSubTitleStyle,
        )
      ],
    );
  }
}
