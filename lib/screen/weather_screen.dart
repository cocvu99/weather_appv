import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_appv/bloc/weather_bloc.dart';

class WeatherScreen extends StatefulWidget {


  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather AppV'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings), 
            onPressed: ()
          ),

          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              // chuyen sang man hinh Search

            },
            )
        ],
      ),

      body: Center(
        child: BlocConsumer<WeatherBloc, WeatherState>(
          listener: (context, weatherState){

          }
        ),
      ),
    );
  }
}