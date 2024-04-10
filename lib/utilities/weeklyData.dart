import 'package:my_weather/utilities/weatherInfos.dart';

class WeeklyData {
  WeeklyData({required this.weatherData});
  dynamic weatherData;
  String? weekDay;
  String? condition;
  int? minTemperature;
  int? maxTemperature;

// location.values[0].maxt
// location.values[0].mint
// location.values[0].conditions

  Future<List<dynamic>> day1() async {
    // int day =
    //     DateTime.parse("${weatherData["location"]["values"][0]["datetimeStr"]}")
    //         .weekday;
    // print(day);

    // weekDay = weatherData["location"]["values"][0]["datetimeStr"];
    // condition = weatherData["location"]["values"][0]["condition"];
   
    List <dynamic>data = [
 minTemperature = weatherData["location"]["values"][0]["mint"],
    maxTemperature = weatherData["location"]["values"][0]["maxt"]
    ];

   
    return data;
  }
}
