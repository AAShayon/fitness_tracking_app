import 'package:fitness_tracking_app/modules/home/view/widgets/fl_chart.dart';
import 'package:fitness_tracking_app/utils/constant/colors.dart';
import 'package:fitness_tracking_app/utils/theme/custom_themes/text_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeartRateCard extends StatelessWidget {
  const HeartRateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 152.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: AppColors.accent,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(height: 5.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                Image.asset(
                  'assets/app_icon_images/heart rate.png',
                  height: 12.sp,
                  width: 12.sp,
                ),
                SizedBox(width: 5.w),
                Text(
                  'Heart rate',
                  style: AppTextTheme.myAppText12(AppColors.textColorDarkGray),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.w, left: 90.w),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '88 ',
                    style: AppTextTheme.myAppText20(AppColors.primaryDark),
                  ),
                  TextSpan(
                    text: 'bpm',
                    style: AppTextTheme.myAppText12(AppColors.textColorDarkGray),
                  ),
                ],
              ),
            ),
          ),
          // CustomChart(),
          Image.asset('assets/app_icon_images/graph.png',width: 170.w,height: 80.h,)
        ],
      ),
    );
  }
}