import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

enum DonViNhietDo{
  fahrenheit,
  celsius
}

class SettingState extends Equatable {
  final DonViNhietDo donViNhietDo;

  const SettingState(@required this.donViNhietDo):
    assert(donViNhietDo != null);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}