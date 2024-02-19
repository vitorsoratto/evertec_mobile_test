import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<AppThemeChange>(_onChangeTheme);
  }

  void _onChangeTheme(AppThemeChange event, Emitter<AppState> emit) {
    ThemeMode themeMode = event.themeMode;

    emit(state.copyWith(themeMode: themeMode));
  }
}
