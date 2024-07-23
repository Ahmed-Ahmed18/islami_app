import 'package:flutter/material.dart';
import 'package:islame_app/app_colors.dart';

class MyThemData {
  static final ThemeData lightmode = ThemeData(
      canvasColor: AppColors.primarylightcolor,
      primaryColor: AppColors.primarylightcolor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.primarylightcolor,
          selectedItemColor: AppColors.blackcolor,
          selectedIconTheme: IconThemeData(size: 35),
          unselectedIconTheme: IconThemeData(size: 20)),
      textTheme: TextTheme(
          bodyLarge: TextStyle(
        color: AppColors.blackcolor,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      )));
}
