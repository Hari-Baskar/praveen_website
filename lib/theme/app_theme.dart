import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:praveen_website/core/themes/app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,
    primaryColor: AppColors.buttonColor,
    cardColor: AppColors.lightCard,
    textTheme: GoogleFonts.plusJakartaSansTextTheme(const TextTheme(
      bodySmall: TextStyle(color: AppColors.lightSecondaryText),
      bodyMedium: TextStyle(color: AppColors.lightText),
      bodyLarge: TextStyle(color: AppColors.lightText),
    )),
    colorScheme: const ColorScheme.light(
      primary: AppColors.buttonColor,
      secondary: AppColors.green,
      surface: AppColors.lightCard,
      onSurface: AppColors.lightText,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.lightCard,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.lightBorder),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.lightBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.buttonColor, width: 1.5),
      ),
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    primaryColor: AppColors.buttonColor,
    cardColor: AppColors.darkCard,
    textTheme: GoogleFonts.plusJakartaSansTextTheme(const TextTheme(
      bodySmall: TextStyle(color: AppColors.darkSecondaryText),
      bodyMedium: TextStyle(color: AppColors.darkText),
      bodyLarge: TextStyle(color: AppColors.darkText),
    )),
    colorScheme: const ColorScheme.dark(
      primary: AppColors.buttonColor,
      secondary: AppColors.green,
      surface: AppColors.darkCard,
      onSurface: AppColors.darkText,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkCard.withOpacity(0.5),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.darkBorder),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.darkBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.buttonColor, width: 1.5),
      ),
    ),
  );
}
