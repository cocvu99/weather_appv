/**
 * Noi chua nhung function xu ly (gui, lay du lieu, ket noi API) thoi tiet
 * 
 * https://www.metaweather.com/api/location/search/?query=chicago
 * 
 * https://www.metaweather.com/api/location/2379574
 */

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:weather_appv/models/data_models.dart';

final cityNameUrl = (city) => 
'https://www.metaweather.com/api/location/search/?query=${city}';

final weatherUrl = (locationId) =>
'https://www.metaweather.com/api/location/${locationId}';

class WeatherRepo {
  final http.Client httpClient;

  //constructor
  WeatherRepo(@required this.httpClient): assert(httpClient != null);

  /**
   * asynchronous - bat dong bo - goi xong moi co du lieu, 
   * trong luc dang chay van thuc hien dc ham khac
  */
  Future<int> getLocationIdfromCity(String city) async{
    final response = await this.httpClient.get(cityNameUrl(city));

    if(response.statusCode == 200){
      final cities = jsonDecode(response.body) as List;
      return (cities.first)['woeid'] ?? 0;
    } else {
      throw Exception('Loi Id: ${city}');
    }
  }

  //Location Id first => Weather
  Future <Weather> fetchWeather(int locationId) async{
    final response = await this.httpClient.get(
      weatherUrl(locationId)
    );

    if (response.statusCode != 200) {
      throw Exception('Loi: Khong lay duoc thong tin thoi tiet ${locationId}');
    } 

    final weatherJson = jsonDecode(response.body);
    return Weather.fromJson(response);
  }

  Future<Weather> getWeatherFromCity(String city) async{
    final int locationId = await getWeatherFromCity(city);
    return fetchWeather(locationId)
  }
}