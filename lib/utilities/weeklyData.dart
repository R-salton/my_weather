import 'package:my_weather/utilities/weatherInfos.dart';

class WeeklyData {
  WeeklyData();
  dynamic weatherData;
  String? weekDay;
  String? condition;
  int? minTemperature;
  int? maxTemperature;

// location.values[0].maxt
// location.values[0].mint
// location.values[0].conditions

  Future<dynamic> day1(dynamic weatherData) async {
    int day = DateTime.parse("${weatherData["location"]["values"][0]["datetimeStr"]}").weekday;
    print(day);

    // weekDay = weatherData["location"]["values"][0]["datetimeStr"];
    condition = weatherData["location"]["values"][0]["condition"];
    minTemperature = weatherData["location"]["values"][0]["mint"];
    maxTemperature = weatherData["location"]["values"][0]["maxt"];

    Map<String, String> day1 = {
      "day": "${DateTime.parse("$weekDay").weekday}",
      "condition": "$condition",
      "minTemp": "$minTemperature",
      "maxTemp": "$maxTemperature"
    };

    return day1;
  }
}
