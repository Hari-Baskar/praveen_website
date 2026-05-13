import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static double _responsiveFontSize(BuildContext context, double baseSize) {
    double width = MediaQuery.of(context).size.width;
    if (width > 1200) return baseSize * 1.2;
    if (width > 600) return baseSize;
    return baseSize * 0.9; // Slightly smaller on mobile but still readable
  }

  static TextStyle splashHeading(
    BuildContext context, {
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) => GoogleFonts.lexend(
    fontSize: fontSize ?? _responsiveFontSize(context, 32),
    fontWeight: fontWeight ?? FontWeight.w600,
    letterSpacing: -1.0,
    height: 1.1,
    color: color ?? Theme.of(context).textTheme.bodyLarge?.color,
  );

  static TextStyle heading(
    BuildContext context, {
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) => GoogleFonts.lexend(
    fontSize: fontSize ?? _responsiveFontSize(context, 24),
    fontWeight: fontWeight ?? FontWeight.w500,
    letterSpacing: -0.2,
    height: 1.2,
    color: color ?? Theme.of(context).textTheme.bodyLarge?.color,
  );

  static TextStyle subtitle(
    BuildContext context, {
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double wordSpacing = 0.2,
  }) => GoogleFonts.plusJakartaSans(
    fontSize: fontSize ?? _responsiveFontSize(context, 18),
    fontWeight: fontWeight ?? FontWeight.w500,
    letterSpacing: -0.2,
    wordSpacing: wordSpacing,
    height: 1.3,
    color: color ?? Theme.of(context).textTheme.bodyMedium?.color,
  );

  static TextStyle body(
    BuildContext context, {
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextDecoration? decoration,
  }) => GoogleFonts.plusJakartaSans(
    fontSize: fontSize ?? _responsiveFontSize(context, 16),
    fontWeight: fontWeight ?? FontWeight.w500,
    decoration: decoration ?? TextDecoration.none,
    height: 1.5,
    letterSpacing: 0.1,
    color: color ?? Theme.of(context).textTheme.bodyMedium?.color,
  );

  static TextStyle small(
    BuildContext context, {
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextDecoration? decoration,
  }) => GoogleFonts.plusJakartaSans(
    fontSize: fontSize ?? _responsiveFontSize(context, 14),
    fontWeight: fontWeight ?? FontWeight.w500,
    decoration: decoration ?? TextDecoration.none,
    letterSpacing: 0.1,
    height: 1.4,
    color: color ?? Theme.of(context).textTheme.bodySmall?.color,
  );

  static TextStyle button(BuildContext context, {Color? color}) =>
      GoogleFonts.plusJakartaSans(
        fontSize: _responsiveFontSize(context, 16),
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
        color: color ?? Colors.white,
      );
}
