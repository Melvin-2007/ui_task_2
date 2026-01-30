import 'dart:convert';
import 'package:task_6/models/weather_model.dart';
import 'package:http/http.dart' as http;
import 'package:task_6/network/api_helper.dart';

class WeatherService {
  static const String url =
      "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current=temperature_2m,wind_speed_10m&hourly=temperature_2m,relative_humidity_2m,wind_speed_10m%20use%20this%20api%20for%20todays%20assignment/";
  
  // Gets the weather data by calling the api using api helper
  static Future<Map<String, dynamic>> getWeather() async {
    return await ApiHelper.callApi(url: url);
  }
}
