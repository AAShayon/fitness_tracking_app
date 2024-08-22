import 'package:fitness_tracking_app/utils/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextTheme {
  AppTextTheme._();

  static const String fontFamily = 'Montserrat';

  static TextTheme lightTextTheme = TextTheme(

    bodySmall: myAppText12(AppColors.textColorDarkGray),
    headlineSmall: myAppText16(AppColors.textColorDarkGray),
    headlineMedium: myAppText18(AppColors.textPrimary),
    bodyMedium: myAppText20(AppColors.textPrimary),
    headlineLarge: myAppText24(AppColors.textPrimary), // Adjust if necessary



  );

  static TextTheme darkTextTheme = TextTheme(
    bodySmall: myAppText12(AppColors.white),
    headlineSmall: myAppText16(AppColors.white),
    headlineMedium: myAppText18(AppColors.white),
    bodyMedium: myAppText20(AppColors.white),
    headlineLarge: myAppText24(AppColors.white), // Ad
  );
  static TextStyle myAppText12(Color? color) {
    return TextStyle(
      color: color,
      fontFamily: fontFamily,
      fontSize: 12.sp, // Adjusted to match the method name
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      height: 1.2.sp,
    );
  }
  static TextStyle myAppText14(Color? color) {
    return TextStyle(
      color: color,
      fontFamily: fontFamily,
      fontSize: 12.sp, // Adjusted to match the method name
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
      height: 1.2.sp,
    );
  }
  static TextStyle myAppText16(Color? color) {
    return TextStyle(
      color: color,
      fontFamily: fontFamily,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      height: 1.25.sp,
    );
  }
  static TextStyle myAppText18(Color? color) {
    return TextStyle(
      color: color,
      fontFamily: fontFamily,
      fontSize: 18.sp,
      fontWeight: FontWeight.w700,
      overflow: TextOverflow.ellipsis,
      height: 1.3.sp,
    );
  }
  static TextStyle myAppText20(Color? color) {
    return TextStyle(
      color: color,
      fontFamily: fontFamily,
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
      height: 1.5.sp,
    );
  }

  static TextStyle myAppText24(Color? color) {
    return TextStyle(
      color: color,
      fontFamily: fontFamily,
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
      height: 1.4.sp,
    );
  }




}
