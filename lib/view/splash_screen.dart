import 'dart:async';

import 'package:any_image_view/any_image_view.dart';
import 'package:fitness_tracking_app/main.dart';
import 'package:fitness_tracking_app/modules/auth/view/login.dart';
import 'package:fitness_tracking_app/utils/constant/app_utility_helper.dart';
import 'package:fitness_tracking_app/utils/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      return AppHelperFunctions.navigateToScreenAndRemoveUntil(context, const Login());
    });

  }
  @override
  Widget build(BuildContext context) {
    final dark=AppHelperFunctions.isDarkMode(context);
    return  Scaffold(
      body: ListView(
        children: [
          SizedBox(height:100.h,),
         Center(
           child: AppHelperFunctions.blurRadiusContainer(height:300.h,width:300.w ,context: context, child: AnyImageView(
             imagePath: 'assets/app_icon_images/splash.json',
             boxFit: BoxFit.contain,

           )),
         ),
          SizedBox(height:20.h,),
          Center(
            child: AnyImageView(
              imagePath: 'assets/app_icon_images/loading.json',
              height: 100.h,width: 200.w,
            ),
          ),
          Center(
            child: SizedBox(
              width: 200.w,
              child: TweenAnimationBuilder(
                duration: const Duration(seconds: 5),
                builder: (context, value, child) => Column(
                  children: [
                    LinearProgressIndicator(
                      backgroundColor: dark ? AppColors.white: AppColors.orange,
                      color: AppColors.success,
                      value: value,
                      minHeight: 8,
                    ),
                    SizedBox(height:10.h),
                    Text(
                      '${(value * 100).toInt()}%',
                      style: TextStyle(
                        color: dark ? AppColors.white : AppColors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        shadows: [
                          Shadow(
                            color: dark
                                ? AppColors.white.withOpacity(0.5)
                                : AppColors.black.withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(1, 2),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                tween: Tween(begin: 0.0, end: 1.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
