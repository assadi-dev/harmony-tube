import 'package:flutter/material.dart';
import 'package:harmony_tube/themes/app_colors.dart';

class themeApp {

static ThemeData light =  ThemeData.light().copyWith(
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.blueSecondary,
    selectionColor: AppColors.blueSecondary,
    selectionHandleColor: AppColors.blueSecondary,
  ),
    textTheme: const TextTheme(),
    primaryColor:  AppColors.bluePrimary,
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: const ColorScheme.light(
      primary: AppColors.bluePrimary,
      secondary: AppColors.blueSecondary,
      surface: AppColors.white,
      primaryContainer: AppColors.bluePrimary
    ),


  );

static ThemeData dark = ThemeData.dark().copyWith(
  primaryColor: const Color(0xFF00FF7F),
  scaffoldBackgroundColor: AppColors.monochromatic,
  colorScheme: const ColorScheme.dark(
    primary: AppColors.white,
    secondary: AppColors.greenSecondary,
    surface: AppColors.monochromatic,
  ),
);

static AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.blue,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(
        color: Color.from(alpha: 1, red: 255, green: 255, blue: 255)),
    titleTextStyle:
    TextStyle(color: Color.from(alpha: 1, red: 255, green: 255, blue: 255)),
  );
}

}




