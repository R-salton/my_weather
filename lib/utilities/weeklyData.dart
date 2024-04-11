class WeeklyData {
  WeeklyData({required this.weatherData});
  dynamic weatherData;
  String? weekDay;
  String? condition;
  int? minTemperature;
  int? maxTemperature;

  Future<Map<String, dynamic>> day1() async {
    Map<String, dynamic> data = {
      "minTemperature": (weatherData["location"]["values"][0]["mint"]).toInt(),
      "maxTemperature": (weatherData["location"]["values"][0]["maxt"]).toInt(),
      "condition": weatherData["location"]["values"][0]["conditions"],
      "weekDay": weatherData["location"]["values"][0]["datetimeStr"],
      "temp": weatherData["location"]["values"][0]["temp"],
      "icon":
          (weatherData["location"]["currentConditions"]["icon"]).toLowerCase()
    };
    // print(data);

    return data;
  }

  Future<Map<String, dynamic>> day2() async {
    Map<String, dynamic> data = {
      "minTemperature": (weatherData["location"]["values"][1]["mint"]).toInt(),
      "maxTemperature": (weatherData["location"]["values"][1]["maxt"]).toInt(),
      "condition": weatherData["location"]["values"][1]["conditions"],
      "weekDay": weatherData["location"]["values"][1]["datetimeStr"],
      "temp": weatherData["location"]["values"][1]["temp"],
      "icon":
          (weatherData["location"]["currentConditions"]["icon"]).toLowerCase()
    };
    // print(data);

    return data;
  }
}
