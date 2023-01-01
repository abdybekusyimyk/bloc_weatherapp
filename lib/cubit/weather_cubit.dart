import 'package:bloc_weatherapp/models/weather_response.dart';
import 'package:bloc_weatherapp/services/fetch_weather.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.service) : super(WeatherInitial());

  final WeatherService service;

  Future<void> getWeatherByCityName(String cityName) async {
    emit(WeatherLoading());
    final data = await service.getWeatherByCityName(cityName);
    if (data != null) {
      emit(WeatherSuccess(data));
    } else {
      emit(WeatherError('Error TWo'));
    }
  }
}
