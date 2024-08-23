import 'package:any_image_view/any_image_view.dart';
import 'package:fitness_tracking_app/modules/home/viewModel/home_view_model.dart';
import 'package:fitness_tracking_app/utils/constant/colors.dart';
import 'package:fitness_tracking_app/utils/theme/custom_themes/text_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class DailyActivitiesCard extends StatelessWidget {
  const DailyActivitiesCard({
    super.key, required this.image, required this.activities, required this.progressing,  this.required, required this.cal, this.min,

  });


  final String image,activities,progressing,cal;
  final String? min;
  final String? required;

  @override
  Widget build(BuildContext context) {

    return Consumer<HomeViewModel>(
        builder: (context,homeViewModel,child) {
          return Container(
            height: 136.h,width: 212.w,
            decoration: BoxDecoration(
                color: AppColors.accent,
                borderRadius: BorderRadius.circular(8)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 5.h,),
                SizedBox(
                  height: 16.h,width: 212.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Today,08:10 AM',
                        style: AppTextTheme.myAppText12(AppColors.textColorDarkGray),),
                      Row(
                        children: [
                          Icon(Icons.local_fire_department,
                            color: AppColors.red, size: 10.5.sp,),
                          Text( cal,
                              style: AppTextTheme.myAppText14(AppColors.textColorBlack)
                          ),
                          Text('cal', style: AppTextTheme.myAppText12(AppColors.textColorDarkGray),),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.h,),
                SizedBox(
                  height: 48.h,width: 188.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 5.w,),
                      Container(
                        height: 48.h,width: 48.w,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: AnyImageView(
                          imagePath:   image,
                        ),
                      ),
                      SizedBox(width: 4.w,),
                      Expanded(
                        child: SizedBox(
                          height: 48.h,
                          // width: 128.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: progressing,
                                      style: AppTextTheme.myAppText14(AppColors.textPrimary),
                                    ),
                                    if (required != null)  // Show miles if provided
                                      TextSpan(
                                        text: '/$required miles',
                                        style: AppTextTheme.myAppText12(AppColors.textColorDarkGray),
                                      )
                                    else if (min != null)  // Show minutes if provided and miles is not provided
                                      TextSpan(
                                        text: '/$min min',
                                        style: AppTextTheme.myAppText16(AppColors.textColorDarkGray),
                                      ),
                                  ]
                              )),
                              Text(activities, style: AppTextTheme.myAppText12(AppColors.textColorDarkGray))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 156.w,top: 30.h),
                  child: InkWell(
                    onTap: homeViewModel.togglePause, // Toggle the state on tap
                    child: homeViewModel.onPause
                        ? Icon(Icons.pause_circle_filled, color: AppColors.vibrantOrange, size: 22.sp,)
                        : Icon(Icons.play_circle_filled, color: AppColors.vibrantOrange, size: 22.sp,),
                  ),
                )
              ],
            ),
          );
        }
    );
  }
}