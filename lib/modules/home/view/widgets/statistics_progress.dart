import 'package:any_image_view/any_image_view.dart';
import 'package:fitness_tracking_app/modules/home/view/widgets/custom_linear_progress_indicator.dart';
import 'package:fitness_tracking_app/modules/home/view/widgets/heart_rate_card.dart';
import 'package:fitness_tracking_app/utils/constant/colors.dart';
import 'package:fitness_tracking_app/utils/theme/custom_themes/text_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class StatisticsProgress extends StatelessWidget {
  const StatisticsProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(height: 358.h,color: Colors.white,
      child:
      Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      child: Column(
        children: [
          SizedBox(height: 10.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Your statistics',style: AppTextTheme.myAppText20(AppColors.textPrimary),),
              TextButton(onPressed: (){}, child: Text('See all',style: AppTextTheme.myAppText16(AppColors.vibrantOrange),))
            ],
          ),
          SizedBox(height:10.h),
          Container(
            height: 120.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.withOpacity(.5)),
                color: AppColors.primaryLight
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 12.w, vertical: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'In-Progress ',
                              style: AppTextTheme.myAppText16(AppColors.darkGray),
                            ),
                            WidgetSpan(
                              child: SizedBox(width: 10.w), // Add space between the texts
                            ),
                            TextSpan(
                              text: '56%',
                              style: AppTextTheme.myAppText24(AppColors.textPrimary),
                            ),
                          ],
                        ),
                      ),

                      IconButton(onPressed: (){}, icon: Icon(Icons.arrow_circle_right_outlined,size: 24.sp,color: AppColors.customGray,)),
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.w),
                  child:  CustomLinearProgressIndicator(gradient: AppColors.secondLinearGradient,value: .56, colorStatus: AppColors.grey.withOpacity(0.2),),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.h, left: 12.w),
                  child: Row(
                    children: [
                      Text(
                        'You\'ve burned ',
                        style: AppTextTheme.myAppText12(
                            AppColors.customGray),
                      ),
                      Icon(Icons.local_fire_department,
                          color: AppColors.red, size: 16.sp),
                      Text(
                        '1,116.5 ',
                        style: AppTextTheme.myAppText16(AppColors.primaryDark),
                      ),
                      Text(
                        'out of 2,000 cal.',
                        style: AppTextTheme.myAppText12(
                            AppColors.customGray),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h,),

              ],
            ),
          ),
          SizedBox(height: 10.h,),
          Container(height: 152.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.primaryLight
            ),
            child: Row(
              children: [
                SizedBox(
                  height: 152.h,width: 170.05.w,
                  child: Column(
                    children: [
                      Container(
                        height: 68.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: AppColors.accent,
                        ),
                        child:
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(height: 5.h,),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 10.w),
                              child: Row(
                                children: [
                                  AnyImageView(
                                    height: 12.sp,width: 12.sp,
                                    imagePath: 'assets/app_icon_images/shoe.png',
                                  ),
                                  SizedBox(width: 5.w,),
                                  Text('Steps',style: AppTextTheme.myAppText12(AppColors.darkGray),),
                                ],
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 10.w),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Text('19,124',style: AppTextTheme.myAppText20(AppColors.textColorBlack),),
                              ),
                            ),
                            CustomLinearProgressIndicator(gradient: AppColors.greenLinearGradient,value: .25,colorStatus: const Color(0xff3D9B26).withOpacity(.16),width:170.w ,),

                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 68.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: AppColors.accent,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(height: 5.h,),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 10.w),
                              child: Row(
                                children: [
                                  AnyImageView(
                                    height: 12.sp,width: 12.sp,
                                    imagePath: 'assets/app_icon_images/moon.png',
                                  ),
                                  SizedBox(width: 5.w,),
                                  Text('Sleep',style: AppTextTheme.myAppText12(AppColors.darkGray),),
                                ],
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 10.w),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child:
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '7',
                                        style: AppTextTheme.myAppText20(AppColors.primaryDark),
                                      ),
                                      TextSpan(
                                        text: 'h ',
                                        style: AppTextTheme.myAppText12(AppColors.darkGray),
                                      ),
                                      TextSpan(
                                        text: '34',
                                        style: AppTextTheme.myAppText20(AppColors.primaryDark),
                                      ),
                                      TextSpan(
                                        text: 'm',
                                        style: AppTextTheme.myAppText12(AppColors.darkGray),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            CustomLinearProgressIndicator(gradient: AppColors.magentaPinkLinearGradient,value: .25,colorStatus: const Color(0xffCD10C6).withOpacity(.08),width:170.w ,),

                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                HeartRateCard(),
              ],
            ),
          )
        ],
      ),
    ),);
  }
}