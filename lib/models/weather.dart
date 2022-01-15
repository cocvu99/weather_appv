/**
 * khai bao thuc the: Weather
 */

import 'package:equatable/equatable.dart';

/**
 * "consolidated_weather":[{
 * "id":5932324333027328,
 * "weather_state_name":"Light Cloud",
 * "weather_state_abbr":"lc",
 * "wind_direction_compass":"ENE",
 * "created":"2022-01-15T06:59:19.763764Z",
 * "applicable_date":"2022-01-15",
 * "min_temp":9.64,"max_temp":15.834999999999999,
 * "the_temp":14.715,
 * "wind_speed":4.962634771812614,
 * "wind_direction":60.78537191988946,
 * "air_pressure":1021.0,
 * "humidity":62,
 * "visibility":15.095591744213792,
 * "predictability":70}
 */

enum ThoiTiet {
  snow,
  sleet,
  hail,
  thunderstorm,
  heavyRain,
  lightRain,
  showers,
  heavyCloud,
  lightCloud,
  clear,
  unknown
}

class Weather extends Equatable{
  final ThoiTiet thoiTiet;
  final String formmattedCondition;
  final double nhietDomin;
  final double nhietDo;
  final double nhietDomax;
  final int locationId;
  final String created;
  final DateTime lastUpdated;
  final String cityName;

  Weather(
    this.thoiTiet, 
    this.formmattedCondition,
    this.nhietDomin, 
    this.nhietDo, 
    this.nhietDomax, 
    this.locationId, 
    this.created, 
    this.lastUpdated, 
    this.cityName);

    @override 
    List<Object> get pros => [
      thoiTiet, 
      formmattedCondition,
      nhietDomin,
      nhietDo,
      nhietDomax,
      locationId,
      created, 
      lastUpdated,
      cityName,
    ];

    // static - call ma ko can tao object
    // factory - gan giong static, nhung chi? tra? ve doi tuong chua factory
    // abbreviation - abbr
    factory Weather.fromJson(dynamic jsonObject){
      final consolidatedWeather = jsonObject['consolidatedWeather'][0];

      return Weather(
        thoiTiet: consolidatedWeather['weather_state_abrr'] ?? '',
        formmattedCondition: consolidatedWeather['weather_state_name'] ?? '',
        nhietDomin: consolidatedWeather['min_temp'] as double,
        nhietDo: consolidatedWeather ['the_temp'] as double,
        nhietDomax: consolidatedWeather['max_temp'] ?? '',

        // Where On Earth ID - locationID
        locationId: jsonObject['woeid'] as int,
        created: consolidatedWeather['created'],
        lastUpdated: DateTime.now(),
        cityName: jsonObject['title']

      );
    }

    static ThoiTiet _mapStringtoThoiTiet(String inputString){
      Map<String, ThoiTiet> map {
        'sn': ThoiTiet.snow,
        'sl': ThoiTiet.sleet,
        'h': ThoiTiet.hail,
        't': ThoiTiet.thunderstorm,
        'hr': ThoiTiet.heavyRain,
        'lr': ThoiTiet.lightRain,
        's': ThoiTiet.showers,
        'hc': ThoiTiet.heavyCloud;
        'lc': ThoiTiet.lightCloud;
        'c': ThoiTiet.clear
      };

      // tra ve gia tri mac dinh
      return map[inputString] ?? ThoiTiet.unknown;
    }


}