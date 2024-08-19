import 'package:fitness_tracking_app/utils/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
///outlined button style
class AppTextButtonTheme{
  AppTextButtonTheme._();

  ///light

static final lightTextButtonTheme=TextButtonThemeData(
  style:
  OutlinedButton.styleFrom(
    backgroundColor:AppColors.white,
      elevation: 0,foregroundColor: AppColors.white,
    textStyle:  TextStyle(fontSize: 16.sp,color:  AppColors.vibrantOrange,
    fontWeight: FontWeight.w500),
  ),
);

///dark


  static final darkTextButtonTheme=TextButtonThemeData(
  style: OutlinedButton.styleFrom(
    backgroundColor:AppColors.dark,
    elevation: 0,foregroundColor: AppColors.dark,
    textStyle:  TextStyle(fontSize: 16.sp,color:  AppColors.customBlue,
        fontWeight: FontWeight.w500),

  )
);

}