import 'package:evertec_mobile_test/app/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    primaryColor: AppColors.lightOrange,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightGray,
      elevation: 2,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        color: Colors.black,
        fontSize: 14,
      ),
      bodySmall: TextStyle(
        color: Colors.black,
        fontSize: 11,
      ),
    ),
  );

  static final darkTheme = ThemeData(
    primaryColor: AppColors.darkOrange,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkOrange,
      elevation: 2,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.lightGray,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        color: AppColors.lightGray,
        fontSize: 14,
      ),
      bodySmall: TextStyle(
        color: AppColors.lightGray,
        fontSize: 11,
      ),
    ),
  );
}

extension AppThemeColors on ThemeData {
  Color get primaryColor => this.primaryColor;
  Color get scaffoldBackgroundColor => this.scaffoldBackgroundColor;
  Color get appBarBackgroundColor => appBarTheme.backgroundColor!;
  Color get textColor => textTheme.bodyLarge!.color!;

  Color get white => const Color(0xFFFFFFFF);
}
