import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_appv/events/weather_event.dart';
import 'package:weather_appv/repo/weather_repo.dart';
import 'package:weather_appv/states/weather_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_appv/events/weather_event.dart';
import 'package:weather_appv/models/weather.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepo weatherRepo;
  WeatherBloc(@required this.weatherRepo):
    assert(weatherRepo != null),
    //khoi tao 1 lan cho tat ca doi tuong dung
    super(WeatherStateInitial());


    @override
    Stream<WeatherState> mapEventToState(WeatherEvent weatherEvent) async*{
      if (weatherEvent is WeatherEventRequested) {
        yield WeatherStateLoading();
        try {
          final Weather weather = await weatherRepo.getWeatherFromCity(
            weatherEvent.city
            );

          yield WeatherStateDone(weather: weather);
        } catch (exception) {
          yield WeatherStateFailure();
        }
      } else if (weatherEvent is WeatherEvenetRefresh){
        try {
          final Weather weather = await weatherRepo.getWeatherFromCity(
            weatherEvent.city
          );
          yield WeatherStateDone(weather: weather);
        } catch (exception) {
          yield WeatherStateFailure();
        }
      }
    }
}

///https://viblo.asia/p/hoc-bloc-pattern-theo-cach-de-hieu-nhat-maGK7JYO5j2
