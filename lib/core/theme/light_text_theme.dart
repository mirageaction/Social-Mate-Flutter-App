import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_mate_app/core/assets_gen/colors.gen.dart';

TextTheme lightTextTheme() {
  return TextTheme(
    // Display
    displayLarge: TextStyle(
      fontSize: 48.0.sp,
      fontWeight: FontWeight.w700,
      height: 1.25,
      color: ColorName.onSurface,
    ),
    displayMedium: TextStyle(
      fontSize: 40.0.sp,
      fontWeight: FontWeight.w700,
      height: 1.3,
      color: ColorName.onSurface,
    ),
    displaySmall: TextStyle(
      fontSize: 32.0.sp,
      fontWeight: FontWeight.w700,
      height: 1.37,
      color: ColorName.onSurface,
    ),

    // Headline
    headlineMedium: TextStyle(
      fontSize: 24.0.sp,
      fontWeight: FontWeight.w700,
      height: 1.5,
      color: ColorName.onSurface,
    ),
    headlineSmall: TextStyle(
      fontSize: 20.0.sp,
      fontWeight: FontWeight.w500,
      height: 1.6,
      color: ColorName.onSurface,
    ),

    // Title
    titleLarge: TextStyle(
      fontSize: 18.0.sp,
      fontWeight: FontWeight.w700,
      height: 1.55,
      color: ColorName.onSurface,
    ),

    // Body Text
    bodyLarge: TextStyle(
      fontSize: 16.0.sp,
      fontWeight: FontWeight.w400,
      height: 1.5,
      color: ColorName.onSurface,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0.sp,
      fontWeight: FontWeight.w400,
      height: 1.4,
      color: ColorName.onSurface,
    ),
    bodySmall: TextStyle(
      fontSize: 12.0.sp,
      fontWeight: FontWeight.w400,
      height: 1.3,
      color: ColorName.onSurface,
    ),
  );
}
