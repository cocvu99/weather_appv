import 'package:flutter/material.dart';
import 'package:weather_appv/gradient_screen.dart';
import 'package:weather_appv/widgets/weather_tile.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

/**
 * todo
 * note: NOT DONE: Fetch Data from API [YET]
 */
// Future<WeatherInfo> fetchWeather() async {
//   final cityName = "hanoi";
//   final apiKey = "5022a23fca290814f90a6a12034006ca";
//   final requestUrl =
//       "api.openweathermap.org/data/2.5/weather?zip=${cityName}&units=metric&appid=${apiKey}";

//   final respone = await http.get(Uri.parse(requestUrl));

//   if (respone.statusCode == 200) {
//     return WeatherInfo.fromJson(jsonDecode(respone.body));
//   } else {
//     throw Exception("Error: loading request URL info. ");
//   }
// }

// class WeatherInfo {
//   final location;
//   final nhietDo;
//   final nhietDoMin;
//   final nhietDoMax;
//   final trangThai;
//   final doAm;
//   final tocdoGio;

//   WeatherInfo(
//       {required this.location,
//       required this.nhietDo,
//       required this.nhietDoMin,
//       required this.nhietDoMax,
//       required this.trangThai,
//       required this.doAm,
//       required this.tocdoGio});

//   factory WeatherInfo.fromJson(Map<String, dynamic> json) {
//     return WeatherInfo(
//         location: json['name'],
//         nhietDo: json['main']['temp'],
//         nhietDoMin: json['main']['temp_min'],
//         nhietDoMax: json['main']['temp_max'],
//         trangThai: json['weather'][0]['description'],
//         doAm: json['main']['humidity'],
//         tocdoGio: json['wind']['speed']);
//   }
// }

class WeatherContent extends StatelessWidget {
  // Future<WeatherInfo> futureWeather;

  // @override
  // void initState() {
  //   super.initState();
  //   futureWeather = fetchWeather();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Stack(children: <Widget>[
        GradientSc(),
        Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              // xac dinh vi tri container
              //color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      "Thoi tiet",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.none),
                    ),
                  ),
                  Text("Nhiet do: " + "17" + "\u00B0" + "C",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.none))
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: ListView(
                children: <Widget>[
                  WeatherTile(
                      icon: Icons.thermostat_auto_outlined,
                      title: "Nhiet Do",
                      subtitle: "17"),
                  WeatherTile(
                      icon: Icons.filter_drama_outlined,
                      title: "Trang thai",
                      subtitle: "Cloudy"),
                  WeatherTile(
                      icon: Icons.sunny, title: "Do am", subtitle: "57%"),
                  WeatherTile(
                    icon: Icons.waves_outlined,
                    title: "Toc do gio",
                    subtitle: "5km/h",
                  )
                ],
              ),
            ))
          ],
        )
      ]),
    ));

    // Expanded(
    //   child: Padding(
    //     padding: EdgeInsets.only(bottom: 10.0),
    //     child: ListView(
    //       children: [
    //         WeatherTile(
    //           icon: Icons.thermostat_auto_outlined,
    //           title: "Nhiet Do",
    //           subtitle: " 17"
    //         ),
    //         WeatherTile(icon: Icons.filter_drama_outlined, title: "Thoi tiet:", subtitle: "Cloudy"),
    //         WeatherTile(icon: Icons.wb_sunny, title: "Do am: ", subtitle: "57%")
    //       ],
    //     ),
    //   )
    // ),
  }
}
