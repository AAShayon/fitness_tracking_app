import 'package:fitness_tracking_app/utils/constant/app_utility_helper.dart';
import 'package:fitness_tracking_app/utils/theme/custom_themes/text_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCircularButton extends StatelessWidget {
  final String text;
  final double? height;
  final double? width;
  final VoidCallback onPressed;

  const CustomCircularButton({super.key, required this.text, required this.onPressed,  this.height,  this.width});

  @override
  Widget build(BuildContext context) {
    final dark=AppHelperFunctions.isDarkMode(context);
    return SizedBox(
      width: width ?? 100.w  ,
      height:height?? 50.h,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Center(
          child: Text(
            text,
            style:dark? AppTextTheme.lightTextTheme.labelSmall:AppTextTheme.darkTextTheme.labelSmall,
          ),
        ),
      ),
    );
  }
}