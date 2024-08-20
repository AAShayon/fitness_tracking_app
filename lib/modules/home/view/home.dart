import 'package:any_image_view/any_image_view.dart';
import 'package:fitness_tracking_app/modules/home/view/widgets/custom_linear_progress_indicator.dart';
import 'package:fitness_tracking_app/modules/home/view/widgets/custom_search_delegate.dart';
import 'package:fitness_tracking_app/modules/home/view/widgets/daily_activities.dart';
import 'package:fitness_tracking_app/modules/home/view/widgets/fl_chart.dart';
import 'package:fitness_tracking_app/modules/home/view/widgets/heart_rate_card.dart';
import 'package:fitness_tracking_app/modules/home/view/widgets/statistics_progress.dart';
import 'package:fitness_tracking_app/utils/constant/colors.dart';
import 'package:fitness_tracking_app/utils/theme/custom_themes/text_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State createState() => _HomeState();
}

class _HomeState extends State {
  bool isOn = true; // Notification state

  @override
  Widget build(BuildContext context) {
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // User Profile Image
                          CircleAvatar(
                            radius: 22.sp,
                            backgroundImage:  const AssetImage('assets/app_icon_images/profile.png',),
                            backgroundColor: AppColors.white,
                          ),
                          SizedBox(width: 12.w), // Spacing between image and text

                          // Greeting Text
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Hello! ',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.textPrimary,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Johan Smith',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.textPrimary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                '02 July 2024',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.customGray,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      // Notification Icon with Indicator
                      InkWell(
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            isOn = !isOn; // Toggle notification indicator
                          });
                        },
                        child: Container(
                          width: 35.sp,
                          height: 35.sp,
                          decoration: BoxDecoration(
                            color: AppColors.accent,
                            border: Border.all(
                              color: AppColors.grey
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Stack(
                            children: [
                              Center(
                                child: Image.asset(
                                  'assets/app_icon_images/notifications.png',
                                  width: 24.sp,
                                  height: 24.sp,
                                ),
                              ),
                              if (isOn)
                                Positioned(
                                  top: 10.sp,
                                  right: 8.sp,
                                  child: Container(
                                    width: 6.19.sp,
                                    height: 6.19.sp,
                                    decoration: BoxDecoration(
                                      color: AppColors.red,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
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
          SizedBox(height: 16.h,),
          SizedBox(
            height: 44.h,width: 390.w,
            child: InkWell(
              onTap:(){
                showSearch(context: context, delegate: CustomSearchDelegate());
              } ,
              child: Center(child: Container(
                width: 358.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 14.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.search,color: AppColors.customGray,size:18.5.sp ,),
                      SizedBox(width: 5.w,),
                      Text('Search',style: AppTextTheme.myAppText16(AppColors.customGray),)
                    ],
                  ),
                ),

              )),
            ),
          ),
          SizedBox(height: 16.h,),
          const StatisticsProgress(),
          SizedBox(height: 16.h,),
          // Container(height: 232.h,color: Colors.white,
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(horizontal: 22.w),
          //     child: Column(
          //       children: [
          //         SizedBox(height: 10.h,),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Text('Daily Activities',style: AppTextTheme.myAppText20(AppColors.textPrimary),),
          //             TextButton(onPressed: (){}, child: Text('See all',style: AppTextTheme.myAppText16(AppColors.vibrantOrange),))
          //           ],
          //         ),
          //         SizedBox(height:10.h),
          //
          //       ],
          //     ),
          //   ),),
          DailyActivities(),
          SizedBox(height: 16.h,),
          Container(height: 214.h,color: Colors.white,),
          SizedBox(height: 20.h,)

        ],
      ),
    );
  }
}


