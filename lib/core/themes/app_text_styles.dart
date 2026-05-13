import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle splashHeading(
    BuildContext context, {
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) => GoogleFonts.lexend(
    fontSize: fontSize ?? 28.sp,
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
    fontSize: fontSize ?? 18.sp,
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
    fontSize: fontSize ?? 16.sp,
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
    fontSize: fontSize ?? 14.sp,
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
    fontSize: fontSize ?? 12.sp,
    fontWeight: fontWeight ?? FontWeight.w500,
    decoration: decoration ?? TextDecoration.none,
    letterSpacing: 0.1,
    height: 1.4,
    color: color ?? Theme.of(context).textTheme.bodySmall?.color,
  );

  static TextStyle button(BuildContext context, {Color? color}) =>
      GoogleFonts.plusJakartaSans(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
        color: color ?? Colors.white,
      );
}
