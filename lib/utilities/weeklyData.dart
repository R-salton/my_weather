class WeeklyData {
  WeeklyData({required this.weatherData});
  dynamic weatherData;
  String? weekDay;
  String? condition;
  int? minTemperature;
  int? maxTemperature;

  Future<Map<String, dynamic>> day1() async {
    Map<String, dynamic> data = {
      //   comment = locationWeather["list"][0]["weather"][0]["description"];
      // temperature = (locationWeather["list"][0]["main"]["temp"]).toInt();
      // hummidity = (locationWeather["list"][0]["main"]["humidity"]).toInt();
      // windSpeeed = (locationWeather["list"][0]["wind"]["speed"]).toInt();
      // weatherIcon = locationWeather["list"][0]["weather"][0]["icon"];
      // cityName = locationWeather["city"]["name"];
      "minTemperature": (weatherData["list"][0]["main"]["temp_min"]).toInt(),
      "maxTemperature": (weatherData["list"][0]["main"]["temp_max"]).toInt(),
      "condition": weatherData["list"][0]["weather"][0]["main"],
      "weekDay": weatherData["list"][0]["dt_txt"],
      "temp": (weatherData["list"][0]["main"]["temp"]).toInt(),
      "icon": weatherData["list"][0]["weather"][0]["icon"],
      "hummidity": (weatherData["list"][0]["main"]["humidity"]).toInt(),
      "windSpeed": (weatherData["list"][0]["wind"]["speed"]).toInt()
    };
    // print(data);

    return data;
  }

  Future<Map<String, dynamic>> day2() async {
    Map<String, dynamic> data = {
      "minTemperature": (weatherData["list"][1]["main"]["temp_min"]).toInt(),
      "maxTemperature": (weatherData["list"][1]["main"]["temp_max"]).toInt(),
      "condition": weatherData["list"][1]["weather"][0]["main"],
      "weekDay": weatherData["list"][1]["dt_txt"],
      "temp": (weatherData["list"][1]["main"]["temp"]).toInt(),
      "icon": weatherData["list"][1]["weather"][0]["icon"],
      "hummidity": (weatherData["list"][1]["main"]["humidity"]).toInt(),
      "windSpeed": (weatherData["list"][1]["wind"]["speed"]).toInt()
    };
    // print(data);

    return data;
  }

  Future<Map<String, dynamic>> day3() async {
    Map<String, dynamic> data = {
      "minTemperature": (weatherData["list"][2]["main"]["temp_min"]).toInt(),
      "maxTemperature": (weatherData["list"][2]["main"]["temp_max"]).toInt(),
      "condition": weatherData["list"][2]["weather"][0]["main"], 
      "weekDay": weatherData["list"][2]["dt_txt"],
      "temp": (weatherData["list"][2]["main"]["temp"]).toInt(),
      "icon": weatherData["list"][2]["weather"][0]["icon"],
      "hummidity": (weatherData["list"][2]["main"]["humidity"]).toInt(),
      "windSpeed": (weatherData["list"][2]["wind"]["speed"]).toInt()
    };
    // print(data);

    return data;
  }

  Future<Map<String, dynamic>> day4() async {
    Map<String, dynamic> data = {
      "minTemperature": (weatherData["list"][3]["main"]["temp_min"]).toInt(),
      "maxTemperature": (weatherData["list"][3]["main"]["temp_max"]).toInt(),
      "condition": weatherData["list"][3]["weather"][0]["main"],
      "weekDay": weatherData["list"][3]["dt_txt"],
      "temp": (weatherData["list"][3]["main"]["temp"]).toInt(),
      "icon": weatherData["list"][3]["weather"][0]["icon"],
      "hummidity": (weatherData["list"][3]["main"]["humidity"]).toInt(),
      "windSpeed": (weatherData["list"][3]["wind"]["speed"]).toInt()
    };
    // print(data);

    return data;
  }

  Future<Map<String, dynamic>> day5() async {
    Map<String, dynamic> data = {
      "minTemperature": (weatherData["list"][4]["main"]["temp_min"]).toInt(),
      "maxTemperature": (weatherData["list"][4]["main"]["temp_max"]).toInt(),
      "condition": weatherData["list"][4]["weather"][0]["main"], 
      "weekDay": weatherData["list"][4]["dt_txt"],
      "temp": (weatherData["list"][4]["main"]["temp"]).toInt(),
      "icon": weatherData["list"][4]["weather"][0]["icon"],
      "hummidity": (weatherData["list"][4]["main"]["humidity"]).toInt(),
      "windSpeed": (weatherData["list"][4]["wind"]["speed"]).toInt()
    };
    // print(data);

    return data;
  }
}
