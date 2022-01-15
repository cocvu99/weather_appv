import 'package:flutter/cupertino.dart';
import 'package:weather_appv/events/theme.dart';
import 'package:weather_appv/models/weather.dart';
import 'package:weather_appv/states/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  //initial
  ThemeBloc():
    super(ThemeState(
      backgroundColor: Colors.lightBlue, 
      textColor: Colors.white
      ));

    @override 
    Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
      
      ThemeState newThemeState;
      if (ThemeEvent is ThemeEventChanged) {
        final thoiTiet = themeEvent.thoiTiet;
        if ( thoiTiet == ThoiTiet.clear
        
          || thoiTiet == ThoiTiet.lightCloud
        ) {
          newThemeState = ThemeState(
            backgroundColor: Colors.yellow,
          , textColor: Colors.black
          );
        }

      } else if (thoiTiet == ThoiTiet.snow ||
          thoiTiet == ThoiTiet.hail ||
          thoiTiet == ThoiTiet.sleet
      ){    
            newThemeState = ThemeState(
            backgroundColor: Colors.indigo, 
            textColor: Colors.white.);

      } else if (thoiTiet == ThoiTiet.thunderstorm) {
        newThemeState = ThemeState(backgroundColor: Colors.purple, textColor: Colors.white);
      }

      else {
        newThemeState = ThemeState(backgroundColor: Colors.lightBlue, textColor:Colors.white);
      }
      yield newThemeState;
    }
}