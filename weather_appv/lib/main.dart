import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:weather_appv/models/weather.dart';
import 'package:weather_appv/screen.dart';
import 'package:weather_appv/widgets/main_widget.dart';
import 'package:http/http.dart' as http;

Future<Weather> fetchWeather() async{
  final zipCode = "60005";
  final apiKey = "5022a23fca290814f90a6a12034006ca";
  final String requestUrl = 
  "https://api.openweathermap.org/data/2.5/weather?q=hanoi&units=metric&appid=5022a23fca290814f90a6a12034006ca";

  final response = await http.get(Uri.parse(requestUrl));
  if (response.statusCode == 200) {
    return Weather.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Loi: loading request URL info");
  }

// ignore: prefer_typing_uninitialized_variables
}

void main() => runApp(
  MaterialApp(
    title: "Weather AppV",
    home: Background()
  )
); 


class MyApp extends StatefulWidget {
  @override 
  State<StatefulWidget> createState(){
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  
  late Future<Weather> futureWeather;

  @override
    void initState() {
      super.initState();
      futureWeather = fetchWeather();
    }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: FutureBuilder<Weather>(
        future: futureWeather,
        builder: (context, snapshot){
          if (snapshot.hasData) {
            return MainWidget(
              cityName: snapshot.data?.cityName, 
              nhietDo: snapshot.data?.nhietDo, 
              nhietDomin: snapshot.data?.nhietDoMin, 
              nhietDomax: snapshot.data?.nhietDoMax, 
              weather: snapshot.data?.weather, 
              humidity: snapshot.data?.humidity, 
              windSpeed: snapshot.data?.windSpeed
              );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }

          throw UnimplementedError();
        }
      ),
    );

  }
}
// {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Background()
//     );
//   }
// }