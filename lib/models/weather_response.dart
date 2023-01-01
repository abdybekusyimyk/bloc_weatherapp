import 'dart:convert';

import 'package:bloc_weatherapp/models/main_model.dart';
import 'package:bloc_weatherapp/models/weather.dart';

class WeatherResponse {
  WeatherResponse(
      {required this.weather, required this.main, required this.name});

  final List<Weather> weather;
  final Main main;

  final String name;

  factory WeatherResponse.fromMap(Map<String, dynamic> map) {
    return WeatherResponse(
      weather: List<Weather>.from(
        (map['weather'] as List).map<Weather>(
          (x) => Weather.fromJson(x as Map<String, dynamic>),
        ),
      ),
      main: Main.fromJson(map['main'] as Map<String, dynamic>),
      name: map['name'] as String,
    );
  }

  factory WeatherResponse.fromJson(String source) =>
      WeatherResponse.fromMap(jsonDecode(source) as Map<String, dynamic>);
}
