import 'package:flutter/material.dart';
import 'app_spacing.dart';

class AppPadding {
  static EdgeInsets get p4 => EdgeInsets.all(AppSpacing.w4);
  static EdgeInsets get p8 => EdgeInsets.all(AppSpacing.w8);
  static EdgeInsets get p12 => EdgeInsets.all(AppSpacing.w12);
  static EdgeInsets get p16 => EdgeInsets.all(AppSpacing.w16);
  static EdgeInsets get p24 => EdgeInsets.all(AppSpacing.w24);
  static EdgeInsets get p32 => EdgeInsets.all(AppSpacing.w32);

  static EdgeInsets get h16 => EdgeInsets.symmetric(horizontal: AppSpacing.w16);
  static EdgeInsets get v16 => EdgeInsets.symmetric(vertical: AppSpacing.h16);
}
