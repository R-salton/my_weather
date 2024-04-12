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
      "condition": weatherData["list"][0]["weather"][0]["description"],
      "weekDay": weatherData["list"][0]["dt_txt"],
      "temp": (weatherData["list"][0]["main"]["temp"]).toInt(),
      "icon": weatherData["list"][0]["weather"][0]["icon"]
    };
    // print(data);

    return data;
  }

  Future<Map<String, dynamic>> day2() async {
    Map<String, dynamic> data = {
      "minTemperature": (weatherData["list"][1]["main"]["temp_min"]).toInt(),
      "maxTemperature": (weatherData["list"][1]["main"]["temp_max"]).toInt(),
      "condition": weatherData["list"][1]["weather"][0]["description"],
      "weekDay": weatherData["list"][1]["dt_txt"],
      "temp": (weatherData["list"][1]["main"]["temp"]).toInt(),
      "icon": weatherData["list"][1]["weather"][0]["icon"]

    };
    // print(data);

    return data;
  }
}
