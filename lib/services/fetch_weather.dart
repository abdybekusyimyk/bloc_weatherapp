import 'dart:convert';
import 'dart:developer';

import 'package:bloc_weatherapp/constants/api_const.dart';
import 'package:bloc_weatherapp/models/weather_response.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  final client = http.Client();

  Future<WeatherResponse?> getWeatherByCityName(String cityName) async {
    final uri = Uri.parse(ApiConst.weatherByCityName(cityName));
    try {
      final response = await client.get(uri);
      log("response.body....");
      if (response.statusCode == 200 || response.statusCode == 201) {
        final weather = WeatherResponse.fromJson(response.body);
      } else {
        log("responseStatusCode ${response.statusCode}");
        return null;
      }
    } catch (e) {
      log("getWeatherByCityName........$e");
      return null;
    }
  }
}

final weatherService = WeatherService();
