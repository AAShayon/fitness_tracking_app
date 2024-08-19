import 'package:fitness_tracking_app/utils/constant/colors.dart';
import 'package:fitness_tracking_app/utils/theme/custom_themes/text_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AppElevatedButtonTheme{
  AppElevatedButtonTheme._();

  ///light theme
  ///
static final lightElevatedButtonTheme=ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    elevation: 0,
    foregroundColor: Colors.white,
    backgroundColor: AppColors.secondaryDark,
    disabledBackgroundColor: Colors.grey,
    disabledForegroundColor: Colors.grey,
    side: const BorderSide(color: Colors.blue),
    // padding: EdgeInsets.symmetric(vertical: 5.h),
    textStyle: AppTextTheme.lightTextTheme.headlineSmall,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  )
);
///Dark Theme
  ///
static final darkElevatedButtonTheme=ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    elevation: 0,
    foregroundColor: Colors.white,
    backgroundColor: AppColors.secondaryDark,
    disabledBackgroundColor: Colors.grey,
    disabledForegroundColor: Colors.grey,
    side: const BorderSide(color: Colors.blue),
    // padding: EdgeInsets.symmetric(vertical: 18.h),
      textStyle: AppTextTheme.darkTextTheme.headlineSmall,
    // textStyle: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  )
);

}