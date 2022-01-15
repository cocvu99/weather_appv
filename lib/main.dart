import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_appv/bloc/weather_bloc.dart';
import 'package:weather_appv/repo/weather_repo.dart';
import 'package:weather_appv/screen/weather_screen.dart';
import 'package:weather_appv/theme/background.dart';

void main() {
  final WeatherRepo weatherRepo = WeatherRepo(
    httpClient: http.Client()
  );
 runApp( MyApp(weatherRepo: weatherRepo,)); 
}

class MyApp extends StatelessWidget {

  final WeatherRepo weatherRepo;
  MyApp({Key key, @required this.weatherRepo}):
    assert(weatherRepo != null),
    super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Weather AppV',
      home: BlocProvider(
        create: (context) => WeatherBloc(
          weatherRepo: weatherRepo
          ),

        child: WeatherScreen(),
        )
    );
  }
}