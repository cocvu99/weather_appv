import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:weather_appv/modules/search/search_page.dart';
import 'dart:convert';
import 'package:weather_appv/theme/app_theme.dart';
import 'package:flutter/services.dart';
import 'package:weather_appv/theme/background.dart';

class Background extends StatefulWidget {
  Background({Key? key}) : super(key: key);

  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  var nhietDo;
  var motaThoiTiet;
  var currently;
  var doAm;
  var tocdoGio;
  String uri = 
  "http://api.openweathermap.org/data/2.5/weather?q=Boston&units=metric&appid=5022a23fca290814f90a6a12034006ca";

  Future getWeather() async{
    http.Response response = await http.get(
      Uri.parse(uri)
    );
    var results = jsonDecode(response.body);
    setState(() {
      this.nhietDo = results['main']['temp'];
      this.motaThoiTiet = results['weather'][0]['description'];
      this.currently = results['weather'][0]['main'];
      this.doAm = results['main']['humidity'];
      this.tocdoGio = results['wind']['speed'];
    });
  }

  @override
  void initState(){
    super.initState();
    this.getWeather();
  }
  
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      
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

              Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                color: Color.fromARGB(244, 224, 214, 214),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      "Thoi Tiet Boston hien tai",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    )
                  ],
                ),
              )
            ],
          ),

        // child: Scaffold(
        //   body: const Center(
        //     child: Text("data"),
        //   ),
        // ),
      )
    ); 
  }
}