part of 'home_bloc.dart';

class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppThemeChange extends AppEvent {
  final ThemeMode themeMode;

  const AppThemeChange({required this.themeMode});

  @override
  List<Object> get props => [themeMode];
}
