import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class WeatherEventRequested extends WeatherEvent{
  final String city;
  const WeatherEventRequested(@required this.city): 
    assert(city != null);

  @override 
  // TODO: implement props
  List<Object?> get props => [city];

}
class WeatherEvenetRefresh extends WeatherEvent{
  final String city;
  const WeatherEvenetRefresh(@required this.city):
    assert(city!= null);

    @override
  // TODO: implement props
  List<Object?> get props => [city];
}