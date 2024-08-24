import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_tracking_app/main.dart';
import 'package:fitness_tracking_app/modules/home/view/widgets/custom_search_delegate.dart';
import 'package:fitness_tracking_app/modules/home/view/widgets/daily_activities.dart';
import 'package:fitness_tracking_app/modules/home/view/widgets/goals.dart';
import 'package:fitness_tracking_app/modules/home/view/widgets/statistics_progress.dart';
import 'package:fitness_tracking_app/modules/home/viewModel/home_view_model.dart';
import 'package:fitness_tracking_app/utils/constant/app_utility_helper.dart';
import 'package:fitness_tracking_app/utils/constant/colors.dart';
import 'package:fitness_tracking_app/utils/theme/custom_themes/text_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State createState() => _HomeState();
}

class _HomeState extends State {

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context,homeViewModel,child) {
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
                                backgroundImage:  homeViewModel.profileImage != null ? MemoryImage(base64Decode(homeViewModel.profileImage!)):const AssetImage('assets/app_icon_images/profile.png',),
                                backgroundColor: AppColors.white,
                              ),
                              SizedBox(width: 15.w,),
                              // Greeting Text
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: "Hello! ".tr(),
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.normal,
                                        color: AppColors.textPrimary,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "${homeViewModel.name}",
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
                                    AppHelperFunctions.getFormattedDate(context, DateTime.now()).tr(),
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
                             homeViewModel.togglePause();
                            },
                            child: Container(
                              width: 35.sp,
                              height: 35.sp,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  color: AppColors.grey
                                ),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                      top: 10.sp,
                                      right: 8.sp,
                                      child:homeViewModel.onPause ?
                                      Container(
                                        width: 6.19.sp,
                                        height: 6.19.sp,
                                        decoration: BoxDecoration(
                                          color:AppColors.vibrantOrange,
                                          borderRadius: BorderRadius.circular(100),
                                        ),
                                      ):const SizedBox.shrink()
                                  ),
                                  Center(
                                    child: Image.asset('assets/app_icon_images/notifications.png',width: 24.sp,height: 24.sp,),
                                  ),
                                  Positioned(
                                      top: 10.sp,
                                      right: 8.sp,
                                      child:homeViewModel.onPause? Container(
                                        width: 6.19.sp,
                                        height: 6.19.sp,
                                        decoration: BoxDecoration(
                                          color:AppColors.vibrantOrange,
                                          borderRadius: BorderRadius.circular(100),
                                        ),
                                      ):const SizedBox.shrink()
                                  )
                                ],
                              )
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
                          Text("Search".tr(),style: AppTextTheme.myAppText16(AppColors.customGray),)
                        ],
                      ),
                    ),

                  )),
                ),
              ),
              SizedBox(height: 16.h,),
              const StatisticsProgress(),
              SizedBox(height: 16.h,),
              const DailyActivities(),
              SizedBox(height: 16.h,),
              Container(height: 214.h,color: Colors.white,
                  child: const GoalsWidget()
              ),
              SizedBox(height: 20.h,)

            ],
          ),
        );
      }
    );
  }
}


