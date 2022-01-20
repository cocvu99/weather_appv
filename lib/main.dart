import 'package:flutter/material.dart';

import 'package:weather_appv/gradient_screen.dart';
import 'package:weather_appv/widgets/weather_content.dart';

void main() => runApp(
  MaterialApp(
    title: "Weather AppV",
    home: MyApp(),
  ) 
);

class MyApp extends StatefulWidget {
  @override 
  State<StatefulWidget> createState(){
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Stack(
        children: <Widget> [
          WeatherContent()
        ],
      ),
    );
  }
}