import 'package:flutter/material.dart';
import 'package:weather_appv/models/weather.dart';
import 'package:equatable/equatable.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class ThemeEventChanged extends ThemeEvent {
  final ThoiTiet thoiTiet;
  const ThemeEventChanged(@required this.thoiTiet):
    assert(thoiTiet != null);
  
  @override
  // TODO: implement props
  List<Object?> get props => throw [thoiTiet];
}