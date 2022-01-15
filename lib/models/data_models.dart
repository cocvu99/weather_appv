// class Weather {
//   final String city;
//   final String country;
//   final String date;
//   final String weatherState;
//   final double minNhietDo;
//   final double maxNhietDo;
//   final double currentNhietDo;
//   final List<NextDays> alldays;

//   Weather({
//     required this.city,
//     required this.country,
//     required this.date,
//     required this.weatherState,
//     required this.minNhietDo,
//     required this.maxNhietDo,
//     required this.currentNhietDo,
//     required this.alldays
//   });

//   factory Weather.fromJson(Map<String, dynamic> json) {
//     final allDaysdata = json['consolidated_weather'] as List;

//     return Weather(
//       city: json['parent']['title'], 
//       country: json['title'], 
//       date: json['consolidated_weather'][0]['applicable_date'], 
//       weatherState: 
//         json['consolidated_weather'][0]['weather_state_name'] as String,

//       minNhietDo: json['consolidated_weather'][0]['min_temp'] as double, 
//       maxNhietDo: json['consolidated_weather'][0]['max_temp'] as double, 
//       currentNhietDo: json['consolidated_weather'][0]['the_temp'] as double, 
//       alldays: allDaysdata.map((e) => NextDays(
//         weatherState: e['weather_state_name'] as String, 
//         date: e['applicable_date'] as String, 
//         maxNhietDo: e['max_temp'] as double, 
//         minNhietDo: e['min_temp'] as double
//         )).toList(),
//       );
//   }
// }

// class NextDays {
//   String weatherState;
//   String date;
//   double maxNhietDo, minNhietDo;

//   NextDays({
//     required this.weatherState,
//     required this.date,
//     required this.maxNhietDo,
//     required this.minNhietDo
//   });

// }
