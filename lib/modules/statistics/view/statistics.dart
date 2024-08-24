import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_tracking_app/modules/home/viewModel/home_view_model.dart';
import 'package:fitness_tracking_app/modules/statistics/view/widget/circular_progress_indicator.dart';
import 'package:fitness_tracking_app/modules/statistics/view/widget/goal_progress_statistics.dart';
import 'package:fitness_tracking_app/utils/constant/colors.dart';
import 'package:fitness_tracking_app/utils/theme/custom_themes/text_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Statistics extends StatelessWidget {
  const Statistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
        builder: (context,landingViewModel,child) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(390.w, 60.h), // AppBar height
            child: Container(
              color: AppColors.primaryLight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: SizedBox(
                      height: 60.h,width: 358.w,
                      child: Row(
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                 landingViewModel.goBackToPreviousIndex();
                                },
                                child: SizedBox(
                                  height: 60.h,
                                  width: 30.w,
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.black,
                                    size: 24.sp,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.w,),
                              Text('Goal'.tr(),style: AppTextTheme.myAppText20(const Color(0xff000B23)),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: ListView(
            children: [
              SizedBox(height: 14.h,),
              Container(height: 193.h,width: 390.w,color: Colors.white,
              child: Padding(padding: EdgeInsets.symmetric(
                horizontal: 16.5.w
              ),
              child: Center(
                child: Container(
                  height: 161.h,width: 358.w,decoration: BoxDecoration(
                  gradient: AppColors.primaryLinearGradient,
                  borderRadius: BorderRadius.circular(16.r),

                ),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16.w),
                        child: SizedBox(
                          height: 123.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Start Strong and \nSet Your Fitness\nGoals',
                                style: AppTextTheme.myAppText18(AppColors.white),
                              ),
                              InkWell(
                                onTap: () {},
                                splashColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                child: Container(
                                  width: 125.w,
                                  height: 41.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Set Your Goal',
                                      style: AppTextTheme.myAppText14(AppColors.vibrantOrange),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(  // Use Flexible to ensure it doesn't take more than available space
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: SizedBox(
                            height: 161.h,
                            child: Padding(
                              padding: EdgeInsets.only(top: 20.h),
                              child: Image.asset(
                                'assets/app_icon_images/weight.png',
                                height: 135.h,
                                width: 126.w,  // Adjust this width if needed
                                fit: BoxFit.contain, // Ensure the image fits properly
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                  ,
                ),
              ),
              ),
              ),
              SizedBox(height: 14.h,),
              Container(
                height: 222.h,width: 390.w,
                color: Colors.white,
                child: Padding(padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child:Column(
                    children: [
                      SizedBox(height: 14.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Progress'.tr(),style: AppTextTheme.myAppText18(AppColors.textColorBlack),),
                          TextButton(onPressed: (){}, child: Text('See All',style: AppTextTheme.myAppText12(AppColors.vibrantOrange),)),
                        ],
                      ),
                      // SizedBox(height: 10.h,),
                      SizedBox(height: 152.h,width: 351.w,child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            const ProgressCustomCard(current: 5,total: 12,itemName: 'Chest Workout',remainingTime: '15 min remaining',),
                            SizedBox(width:10.w),
                            const ProgressCustomCard(current: 3, total: 20, itemName: 'Legs Workout', remainingTime: '23 min remaining'),

                            SizedBox(width:10.w),
                            const ProgressCustomCard(current: 5, total: 7, itemName: 'Others', remainingTime: '23 min remaining')
                          ],
                        ),
                      ),)
                    ],
                  ) ,),
              ),
              SizedBox(height: 14.h,),
              Container(
                color: Colors.white,
                width: 390.w,height: 644.h,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16.5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16.h,),
                      Text('Activities'.tr(),style: AppTextTheme.myAppText18(AppColors.textColorBlack),),
                      SizedBox(height: 16.h,),
                      const ActivitiesVerticalCard(image: 'assets/app_icon_images/full_body_warm_up.png',workoutName: 'Full Body Warm Up',remaining: '12 Excercises • 22 min',),
                      SizedBox(height: 16.h,),
                      const ActivitiesVerticalCard(image: 'assets/app_icon_images/strength.png',workoutName: 'Strength Exercise',remaining: '12 Exercises • 14 min',),
                      SizedBox(height: 16.h,),
                      const ActivitiesVerticalCard(image: 'assets/app_icon_images/plank.png',workoutName: 'Both Side Plank',remaining: '15 Exercises • 18 min',),
                      SizedBox(height: 16.h,),
                      const ActivitiesVerticalCard(image: 'assets/app_icon_images/abs.png',workoutName: 'Abs Workout',remaining: '16 Exercises • 18 min',),
                      SizedBox(height: 16.h,),
                      const ActivitiesVerticalCard(image: 'assets/app_icon_images/torso and trap.png',workoutName: 'Torse and trap Workout',remaining: '8 Excercises • 16 min',),
                      SizedBox(height: 16.h,),
                      const ActivitiesVerticalCard(image: 'assets/app_icon_images/lowerback.png',workoutName: 'Lower Back Exercise',remaining: '14 Exercises • 18 min',),

                    ],
                  ),
                ),
              ),
              Container(height: 16.h,color: AppColors.accent,),
              const GoalProgress(),
            ],
          ),
        );
      }
    );
  }
}

class ActivitiesVerticalCard extends StatelessWidget {
  final String image;
  final String workoutName;
  final String remaining;
  const ActivitiesVerticalCard({
    super.key, required this.image, required this.workoutName, required this.remaining,
  });

  @override
  Widget build(BuildContext context) {
    return Container(height: 81.h,width: 358.w,decoration: BoxDecoration(
      color: AppColors.accent,
      borderRadius: BorderRadius.circular(16.r)
    ),
    child: Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(image,height: 32.h,width: 64.w,),
              SizedBox(width: 10.w,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(workoutName,style: AppTextTheme.myAppText14(AppColors.textColorBlack),),
                  Text(remaining,style: AppTextTheme.myAppText14(AppColors.darkerGrey),)
                ],
              ),
            ],
          ),
          IconButton(onPressed: (){}, icon: const Icon(Icons.keyboard_arrow_right_rounded,color: AppColors.vibrantOrange,))
    
        ],
      ),
    ),
    );
  }
}

class ProgressCustomCard extends StatelessWidget {
  final int current;
  final int total;
  final String itemName;
  final String remainingTime;
  const ProgressCustomCard({
    super.key, required this.current, required this.total, required this.itemName, required this.remainingTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 152.h,width: 144.w,
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(16.r)
      ),
      child: Stack(
        children: [
          Positioned(right: 5.w,child: IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert))),
          Positioned(top: 30.h,left: 40.w,child: CircularProgress(current: current,total: total,)),
          // Positioned(
          // top: 100.h,left: 20.w,
          // child: Center(child: Text(itemName,style: AppTextTheme.myAppText18(AppColors.textColorBlack),))),
          // Positioned(
          //   top: 120.h,left: 20.w,
          //     child: Text(remainingTime,style: AppTextTheme.myAppText12(AppColors.darkerGrey),))
          Align(
            alignment: Alignment.bottomCenter, // Centering horizontally and vertically
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  itemName,
                  style: AppTextTheme.myAppText18(AppColors.textColorBlack),
                ),
                SizedBox(height: 8.h), // Add space between the itemName and remainingTime
                Text(
                  remainingTime,
                  style: AppTextTheme.myAppText12(AppColors.darkerGrey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
//•
