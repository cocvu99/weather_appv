import 'package:flutter/material.dart';
import 'package:weather_appv/gradient_screen.dart';
import 'package:weather_appv/widgets/weather_tile.dart';

class WeatherContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: Stack(
            children: <Widget>[
              GradientSc(),

              Column(
                children:<Widget> [
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
                            style: TextStyle(color: Colors.blue, fontSize: 18.0, fontWeight: FontWeight.w600, decoration: TextDecoration.none),
                          ),
                        ),

                        Text(
                          "Nhiet do: " + "17" + "\u00B0"+ "C",
                          style: TextStyle(color: Colors.blue, fontSize: 16.0, fontWeight: FontWeight.w600, decoration: TextDecoration.none
                          )
                        )
                      ],
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: ListView(
                        children: <Widget> [
                          WeatherTile(
                            icon: Icons.thermostat_auto_outlined, 
                            title: "Nhiet Do", 
                            subtitle: "17"
                          ),
                          WeatherTile(icon: Icons.filter_drama_outlined, title: "Thoi tiet", subtitle: "Cloudy"),
                          WeatherTile(icon: Icons.sunny, title: "Do am", subtitle: "57%")
                        ],
                      ),
                    )
                  )
                ],
              )
            ]
          ),
        )
    );
            

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