import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_appv/events/setting.dart';
import 'package:weather_appv/states/setting_state.dart';

class SettingBloc extends Bloc<Setting, SettingState> {
  SettingBloc():super(
    SettingState(donViNhietDo: DonViNhietDo.celsius)
  );

  @override 
  Stream<SettingState> mapEventToState(Setting settingEvent) async*{
    if (settingEvent is SettingButtonUnit) {
      yield SettingState(
        donViNhietDo: state.donViNhietDo == DonViNhietDo.celsius ?
            DonViNhietDo.fahrenheit : DonViNhietDo.celsius
      )
    }
  }
}