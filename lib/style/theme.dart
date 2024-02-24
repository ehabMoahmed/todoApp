import 'package:flutter/material.dart';
import 'package:todoapp/style/app-colors.dart';
//hena h7ot al theme

class AppTheme{
  static  ThemeData lightTheme=ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.PrimaryLightColor,
    ),
    scaffoldBackgroundColor: AppColors.backgroundColor,
    colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.PrimaryLightColor,
        primary:  AppColors.PrimaryLightColor,
    )
  );
  static  ThemeData darkTheme=ThemeData();

}