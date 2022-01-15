import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_appv/models/weather.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class WeatherStateInitial extends WeatherState {}
class WeatherStateLoading extends WeatherState {}
class WeatherStateDone extends WeatherState {
    final Weather weather;

    const WeatherStateDone(@required this.weather):
      assert(weather != null);

    @override
    // TODO: implement props
    List<Object?> get props => [weather]; 

}