import 'package:flutter/material.dart';
import 'package:todoapp/style/app-colors.dart';
//hena h7ot al theme

class AppTheme{
  static  ThemeData lightTheme=ThemeData(
    floatingActionButtonTheme:FloatingActionButtonThemeData(
      backgroundColor: AppColors.PrimaryLightColor,
    ) ,
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(color: Colors.white,fontSize: 20),
      backgroundColor: AppColors.PrimaryLightColor,
    ),
    scaffoldBackgroundColor: AppColors.backgroundColor,
    colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.PrimaryLightColor,
        primary:  AppColors.PrimaryLightColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.PrimaryLightColor,
      unselectedItemColor: AppColors.unselectedIconsColor ,
      showSelectedLabels: false,
      showUnselectedLabels: false,

    ),
    useMaterial3: false,

    textTheme: TextTheme(
      titleSmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: AppColors.timeColor
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 18,
        color: AppColors.PrimaryLightColor
      ),
      labelMedium: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 18,
      ),
    ),
  );
  static  ThemeData darkTheme=ThemeData();

}