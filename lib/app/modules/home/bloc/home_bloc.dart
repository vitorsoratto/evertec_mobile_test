import 'package:bloc/bloc.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<AppEvent, HomeState> {
  HomeBloc() : super(HomeState(deviceInfoPlugin: DeviceInfoPlugin())) {
    on<AppThemeChange>(_onChangeTheme);
  }

  void _onChangeTheme(AppThemeChange event, Emitter<HomeState> emit) {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

    emit(state.copyWith(deviceInfoPlugin: deviceInfoPlugin));
  }
}
