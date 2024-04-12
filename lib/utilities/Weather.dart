import 'dart:convert';

import 'package:http/http.dart' as http;




class WeatherBrain {


  // Get Current Location weather
  Future<dynamic> getCurrentWeather(String url) async {
    try {
    
    http.Response response = await http.get(Uri.parse(url)); 
    var weatherData = response.body;

      return jsonDecode(weatherData);
    } catch (e) {
      print(e);
    }
  }

  
}
