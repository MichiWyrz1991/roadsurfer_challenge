import 'package:flutter/material.dart';
import 'package:roadsurfer_challenge/utils/color.dart';

final ThemeData roadsurferTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: BrandColors.light,
  primaryColor: BrandColors.campingPrimary,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: BrandColors.campingPrimary,
    onPrimary: BrandColors.white,
    secondary: BrandColors.secondaryText,
    onSecondary: BrandColors.black,
    error: BrandColors.danger,
    onError: BrandColors.white,
    surface: BrandColors.white,
    onSurface: BrandColors.light,
  ),
  appBarTheme: AppBarTheme(
    elevation: 3,
    centerTitle: true,
    foregroundColor: BrandColors.white,
    backgroundColor: BrandColors.campingPrimary,
    titleTextStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: BrandColors.white,
    ),
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: BrandColors.primaryText,
    ),
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: BrandColors.primaryText,
    ),
    bodyLarge: TextStyle(fontSize: 16, color: BrandColors.primaryText),
    bodyMedium: TextStyle(fontSize: 14, color: BrandColors.primaryText),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: BrandColors.primaryText,
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: BrandColors.primaryText,
    ),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: BrandColors.campingPrimary,
    textTheme: ButtonTextTheme.primary,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: BrandColors.campingPrimary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: BrandColors.campingPrimary,
      foregroundColor: BrandColors.black,
      textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),
);
