import 'package:flutter/material.dart';

class Weather {
  final cityName;
  final nhietDo;
  final nhietDoMin;
  final nhietDoMax;
  final weather;
  final humidity;
  final windSpeed;

  Weather({
    required this.cityName,
    required this.nhietDo,
    required this.nhietDoMin,
    required this.nhietDoMax,
    required this.weather,
    required this.humidity,
    required this.windSpeed
  });

  factory Weather.fromJson(Map<String, dynamic> json){
    return Weather(
      cityName: json['name'], 
      nhietDo: json['main']['temp'], 
      nhietDoMin: json['main']['temp_min'], 
      nhietDoMax: json['main']['temp_max'], 
      weather: json['weather']['description'], 
      humidity: json['main']['humidity'], 
      windSpeed: json['wind']['speed']
    );
  }
}