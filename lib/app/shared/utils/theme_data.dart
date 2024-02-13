import 'package:evertec_mobile_test/app/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    primaryColor: AppColors.lightOrange,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
  );

  static final darkTheme = ThemeData(
    primaryColor: AppColors.darkOrange,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkGray,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkGray,
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppColors.darkOrange,
      ),
    ),
  );
}
