import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:weather_appv/widgets/weather_tile.dart';
import 'package:weather_appv/models/weather.dart';
import 'package:weather_appv/widgets/main_widget.dart';
import 'dart:convert';
import 'dart:async';


class Background extends StatefulWidget {
  
  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {

  String cityName ="Hanoi";
  // int woeid = '00';
  //String weather = 'clear';
  /**
   * key: 5022a23fca290814f90a6a12034006ca
   * url: http://api.openweathermap.org/data/2.5/weather?q=Hanoi&units=metric&appid=5022a23fca290814f90a6a12034006ca
   * 
   */

  
  late Future<Weather> futureWeather;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureWeather = fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 160, 23, 184), Color.fromARGB(255, 230, 188, 99)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight
                  )
                ),
              ),

              // Color red
              Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height/3,
                      width: MediaQuery.of(context).size.width,
                      //Xac dinh vi tri container
                      //Color RED
                      // color: Colors.red,
                      child: Scaffold(
                        backgroundColor: Colors.transparent,
                        body: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,

                            children: <Widget> [
                              Padding(
                                padding: EdgeInsets.only(bottom: 10.0),
                                child: Text(
                                  "${cityName}",
                                  style: TextStyle(color: Colors.white, fontSize: 30.0),
                                ), 
                              ),

                              // Text(
                              //   nhietDo != null ? nhietDo.toString() + "\u00B0" + "C" : "Loading",
                              //   style: TextStyle(color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.w600),
                              // ), 

                              Text(
                                cityName,
                                style: TextStyle(color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                  // Color Blue
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                        child: ListView(
                              children: [
                                WeatherTile(
                                  icon: Icons.thermostat_auto_outlined, title: "Nhiet Do", subtitle: "85"),
                                WeatherTile(
                                  icon: Icons.filter_drama_outlined, title: "Thoi Tiet", subtitle: ""),
                                WeatherTile(
                                  icon: Icons.wb_sunny, title: "Do am", subtitle: "something"),
                                  WeatherTile(
                                    icon: Icons.waves_rounded, title: "Toc do gio", subtitle: "2km/h")
                              ],
                          ),
                        )
                    ),

                  ],
              ),
              
              Column(
                children: <Widget>[
                  Container(
                    width: 300,
                    child: TextField(
                      // onSubmitted: (String input){
                      //   onTextFieldSubbmitted(input);
                      // },
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                      decoration: InputDecoration(
                        hintText: "Tim kiem thanh pho",
                        hintStyle: TextStyle(color: Colors.white, fontSize: 16.0),
                        prefixIcon: Icon(Icons.search)
                      ),
                    ),
                  )

                ],
              )
            ],
          ),
        ),
    );
  }
}
//https://api.openweathermap.org/data/2.5/weather?zip=60005,us&appid=5022a23fca290814f90a6a12034006ca
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
