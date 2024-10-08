import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_tracking_app/main.dart';
import 'package:fitness_tracking_app/utils/constant/colors.dart';
import 'package:fitness_tracking_app/utils/theme/custom_themes/text_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoalsWidget extends StatelessWidget {
  const GoalsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Goals'.tr(),
                  style: AppTextTheme.myAppText20(AppColors.textColorBlack),
                ),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text(
                        'View All'.tr(),
                        style: AppTextTheme.myAppText14(AppColors.vibrantOrange),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 8.sp,
                        color: AppColors.vibrantOrange,
                      )
                    ],
                  ),
                ),
              ],
            ),
            // Goals List
            Expanded(
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  GoalCard(
                    title: 'ABS & Stretch',
                    subtitle: 'Saturday, April 14 | 08:00 AM',
                    tag: '30 Min/day',
                  ),
                  SizedBox(height: 16),
                  GoalCard(
                    title: 'Push Up',
                    subtitle: 'Sunday, April 15 | 08:00 AM',
                    tag: '50 Sets/day',
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  }
}

class GoalCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String tag;

  const GoalCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66.h,width: 358.w,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Text Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: AppTextTheme.myAppText16(Color(0xff1E293B)),
                ),
                Text(
                  subtitle,
                  style: AppTextTheme.myAppText12(Color(0xff475569)),
                ),
              ],
            ),
          ),
          // Tag Section
          Container(
            height: 23.h,width: 86.w,
            // padding: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              color: const Color(0xffFFF7ED),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Center(
              child: Text(
                tag,
                style: AppTextTheme.myAppText12(AppColors.vibrantOrange),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
