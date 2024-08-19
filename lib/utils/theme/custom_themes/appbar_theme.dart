import 'package:fitness_tracking_app/utils/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AppbarTheme{
  AppbarTheme._();
  ///light
  static final lightAppbarTheme=AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation:0,
    backgroundColor: AppColors.primaryLight,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: AppColors.secondaryDark,size: 24.sp),
    actionsIconTheme: IconThemeData(color:AppColors.secondaryDark,size: 24.sp),
  );

  ///dark
  static final darkAppbarTheme=AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation:0,
    backgroundColor: AppColors.primaryDark,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: AppColors.primaryLight,size: 24.sp),
    actionsIconTheme: IconThemeData(color:AppColors.primaryLight,size: 24.sp),
  );


}