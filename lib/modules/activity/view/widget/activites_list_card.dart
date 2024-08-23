import 'package:any_image_view/any_image_view.dart';
import 'package:fitness_tracking_app/modules/home/viewModel/home_view_model.dart';
import 'package:fitness_tracking_app/utils/constant/colors.dart';
import 'package:fitness_tracking_app/utils/theme/custom_themes/text_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ActivitiesVerticalCard extends StatelessWidget {
  final String image, activities, progressing, cal;
  final String? min;
  final String? required;

  const ActivitiesVerticalCard({
    super.key,
    required this.image,
    required this.activities,
    required this.progressing,
    this.required,
    required this.cal,
    this.min,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, homeViewModel, child) {
      return Container(
        height: 98.h,
        width: 358.w,
        decoration: BoxDecoration(
          color: AppColors.accent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(  // Wrap the whole left section in Expanded
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    SizedBox(
                      height: 16.h,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 5.w),
                            child: Text(
                              'Today, 08:10 AM',
                              style: AppTextTheme.myAppText12(AppColors.textColorDarkGray),
                              overflow: TextOverflow.ellipsis, // Prevent overflow
                            ),
                          ),
                SizedBox(width: 10.w,),
                // / Push the remaining items to the right
                          Icon(
                            Icons.local_fire_department,
                            color: AppColors.red,
                            size: 10.5.sp,
                          ),
                          SizedBox(width: 2.w), // Add some spacing
                          Text(
                            cal,
                            style: AppTextTheme.myAppText16(AppColors.textColorBlack),
                            overflow: TextOverflow.ellipsis, // Prevent overflow
                          ),
                          SizedBox(width: 2.w), // Add some spacing
                          Padding(
                            padding:  EdgeInsets.only(top: 3.h),
                            child: Text(
                              'cal',
                              style: AppTextTheme.myAppText12(AppColors.textColorDarkGray),
                              overflow: TextOverflow.ellipsis, // Prevent overflow
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    SizedBox(
                      height: 48.h,
                      child: Row(
                        children: [
                          Container(
                            height: 48.h,
                            width: 48.w,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: AnyImageView(
                              imagePath: image,
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Expanded(  // Expanded to take available space for text
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: progressing,
                                        style: AppTextTheme.myAppText20(AppColors.textPrimary),
                                      ),
                                      if (required != null)  // Show miles if provided
                                        TextSpan(
                                          text: '/$required miles',
                                          style: AppTextTheme.myAppText16(AppColors.textColorDarkGray),
                                        )
                                      else if (min != null)  // Show minutes if provided and miles is not provided
                                        TextSpan(
                                          text: '/$min min',
                                          style: AppTextTheme.myAppText16(AppColors.textColorDarkGray),
                                        ),
                                    ],
                                  ),
                                ),
                                Text(
                                  activities,
                                  style: AppTextTheme.myAppText12(AppColors.textColorDarkGray),
                                  overflow: TextOverflow.ellipsis, // Prevent overflow
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: homeViewModel.togglePause, // Toggle the state on tap
                child: homeViewModel.onPause
                    ? Icon(
                  Icons.pause_circle_filled,
                  color: AppColors.vibrantOrange,
                  size: 22.sp,
                )
                    : Icon(
                  Icons.play_circle_filled,
                  color: AppColors.vibrantOrange,
                  size: 22.sp,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
