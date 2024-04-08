import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:my_weather/utilities/constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: kDarkContainerColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Image(
                            image: AssetImage("assets/icons/menu1.png"),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Text(
                        "Sunny Day",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: kDarkContainerColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.refresh,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Mostly Sunny",
                  style: TextStyle(color: Colors.white),
                ),
                const Stack(
                  children: [
                    Text(
                      "23°",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 150,
                          fontWeight: FontWeight.bold),
                    ),
                    Opacity(
                      opacity: 0.7,
                      child: Padding(
                        padding: EdgeInsets.only(left: 70.0, top: 100.0),
                        child: Image(
                            height: 150,
                            image: AssetImage('assets/icons/cloudy.png')),
                      ),
                    )
                  ],
                ),
                const Text(
                  "Monaday 8, April | 17:28",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 150,
                  width: 350,
                  decoration: BoxDecoration(
                    color: kDarkContainerColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 25),
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
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Today?", style: kSubTitleStyle),
                      Text(
                        "7 Days Forecast",
                        style: kSubTitleStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class weatherWithImage extends StatelessWidget {
  weatherWithImage({super.key, this.imageUrl, this.comment, this.data});

  String? imageUrl = '';
  String? comment = '';
  String? data = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: Column(
        children: [
          Image(
            height: 40,
            image: AssetImage(imageUrl.toString()),
          ),
          Text(
            "$data",
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            "$comment",
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
