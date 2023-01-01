import 'package:bloc_weatherapp/cubit/weather_cubit.dart';
import 'package:bloc_weatherapp/services/fetch_weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(weatherService),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    context.read<WeatherCubit>().getWeatherByCityName('Bishkek');
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text...."),
      ),
      body: Center(
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitial) {
              return Text('WeatherInitial');
            } else if (state is WeatherLoading) {
              return Text('WeatherLoading');
            } else if (state is WeatherSuccess) {
              return Text(state.weatherResponse.name);
            } else if (state is WeatherError) {
              return Text(state.errorText);
            } else {
              return const Text('NOT');
            }
            return Text('text');
          },
        ),
      ),
    );
  }
}
