import 'package:flutter/material.dart';

class ThemeChanger {
  ThemeMode themeMode = ThemeMode.system;

  ThemeMode changeTheme(ThemeMode themeModeParam) {
    themeMode = themeModeParam;
    return themeMode;
  }
}
