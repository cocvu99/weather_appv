import 'package:flutter/material.dart';
import 'package:weather_appv/widgets/weather_tile.dart';

class MainWidget extends StatelessWidget {
  final cityName;
  final nhietDo;
  final nhietDomin;
  final nhietDomax;
  final weather;
  final humidity;
  final windSpeed;

  MainWidget({
    required this.cityName,
    required this.nhietDo,
    required this.nhietDomin,
    required this.nhietDomax,
    required this.weather,
    required this.humidity,
    required this.windSpeed,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
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

                        Text(
                          "${nhietDo.toInt().toString()}" + "/uB00" + "C",
                          style: TextStyle(color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.w600),
                        ), 

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
                            icon: Icons.thermostat_auto_outlined, title: "Nhiet Do", subtitle: "${nhietDo.toInt().toString()}"),
                          WeatherTile(
                            icon: Icons.filter_drama_outlined, title: "Thoi Tiet", subtitle: "${weather.toString()}"),
                          WeatherTile(
                            icon: Icons.wb_sunny, title: "Do am", subtitle: "${humidity.toInt().toString()}"),
                            WeatherTile(
                              icon: Icons.waves_rounded, title: "Toc do gio", subtitle: "${windSpeed.toInt().toString()}")
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
    );
  }

}