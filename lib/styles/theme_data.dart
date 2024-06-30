import 'package:flutter/material.dart';
import 'app_colors.dart'; // Importiere die Farben

final ThemeData appTheme = ThemeData(
  colorScheme: ColorScheme(
    primary: AppColors.primaryColor,
    primaryContainer: AppColors.primaryColor,
    secondary: AppColors.secondaryColor,
    secondaryContainer: AppColors.secondaryColor,
    background: AppColors.backgroundColor,
    surface: AppColors.surfaceColor,
    error: AppColors.errorColor,
    onPrimary: AppColors.onPrimaryColor,
    onSecondary: AppColors.onSecondaryColor,
    onBackground: AppColors.onBackgroundColor,
    onSurface: AppColors.onSurfaceColor,
    onError: AppColors.onErrorColor,
    brightness: Brightness.light,
  ),
  primaryColor: AppColors.primaryColor,
  scaffoldBackgroundColor: AppColors.backgroundColor,
  buttonTheme: ButtonThemeData(
    buttonColor: AppColors.primaryColor,
    textTheme: ButtonTextTheme.primary,
  ),
  textTheme: TextTheme(
    displayLarge: TextStyle(color: AppColors.onBackgroundColor),
    displayMedium: TextStyle(color: AppColors.onBackgroundColor),
    displaySmall: TextStyle(color: AppColors.onBackgroundColor),
    headlineLarge: TextStyle(color: AppColors.onBackgroundColor),
    headlineMedium: TextStyle(color: AppColors.onBackgroundColor),
    headlineSmall: TextStyle(color: AppColors.onBackgroundColor),
    titleLarge: TextStyle(color: AppColors.onBackgroundColor),
    titleMedium: TextStyle(color: AppColors.onBackgroundColor),
    titleSmall: TextStyle(color: AppColors.onBackgroundColor),
    bodyLarge: TextStyle(color: AppColors.onBackgroundColor),
    bodyMedium: TextStyle(color: AppColors.onBackgroundColor),
    bodySmall: TextStyle(color: AppColors.onBackgroundColor),
    labelLarge: TextStyle(color: AppColors.onBackgroundColor),
    labelMedium: TextStyle(color: AppColors.onBackgroundColor),
    labelSmall: TextStyle(color: AppColors.onBackgroundColor),
  ),
  appBarTheme: AppBarTheme(
    color: AppColors.primaryColor,
    iconTheme: IconThemeData(color: AppColors.onPrimaryColor),
    titleTextStyle: TextStyle(
      color: AppColors.onPrimaryColor,
      fontSize: 20,
    ),
  ),
);
