part of 'app_bloc.dart';

final class AppState extends Equatable {
  final ThemeMode themeMode;

  const AppState({
    this.themeMode = ThemeMode.light,
  });

  AppState copyWith({
    ThemeMode? themeMode,
  }) {
    return AppState(
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  List<Object> get props => [themeMode];
}
