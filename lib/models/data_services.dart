import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather_appv/models/data_models.dart';

class DataServices {
  String cityName = '';

  final searchAPIUrl = 
  'https://www.metaweather.com/api/location';

  Future<int> getCityID(String cityName) async{
    final locationURL = Uri.parse(
      '$searchAPIUrl/search/?query=$cityName'
    );

    final locationResponse = await http.get(locationURL);
    final locationJson = jsonDecode(locationResponse.body) as List;

    return locationJson.first['woeid'] as int;
  }

  Future<Weather> fetchWeather(int locationID) async{
    final weatherURL = Uri.parse('$searchAPIUrl/$locationID');
    final weatherResponse = await http.get(weatherURL);
    final weatherJson = jsonDecode(weatherResponse.body);

    final consolidatedWeather = weatherJson as Map<String, dynamic>;

    final weather = Weather.fromJson(consolidatedWeather);
    return weather;
  }

}