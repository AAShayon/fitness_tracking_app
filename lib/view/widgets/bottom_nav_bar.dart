import 'package:fitness_tracking_app/modules/home/viewModel/home_view_model.dart';
import 'package:fitness_tracking_app/utils/constant/app_utility_helper.dart';
import 'package:fitness_tracking_app/utils/constant/colors.dart';
import 'package:fitness_tracking_app/utils/theme/custom_themes/text_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFunctions.isDarkMode(context);
    return Consumer<HomeViewModel>(
      builder: (context, landingScreenViewModel, child) {
        return Container(
          width: 390.w,
          height: 80.h,
          decoration: BoxDecoration(
            color: isDark ? AppColors.grey : AppColors.primaryLight,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF000000).withOpacity(0.16), // #000000 with 16% opacity
                offset: const Offset(0, 4), // X: 0, Y: 4
                blurRadius: 16, // Blur radius 16
                spreadRadius: 0, // Spread radius 0
              ),
            ],
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: 11.h),
            child: SizedBox(
              height: 56.h,
              width: 48.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      landingScreenViewModel.updateIndex(0);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/app_icon_images/home.png',
                          height: 24.h,
                          width: 24.w,
                          color: landingScreenViewModel.currentIndex == 0
                              ? AppColors.vibrantOrange
                              : AppColors.customGray,
                        ),
                        SizedBox(height: 5.h,),
                        Text(
                          'Home',
                          style: AppTextTheme.myAppText12(
                            landingScreenViewModel.currentIndex == 0
                                ? AppColors.vibrantOrange
                                : AppColors.customGray,
                          ),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      landingScreenViewModel.updateIndex(1);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/app_icon_images/activity.png',
                          height: 24.h,
                          width: 24.w,
                          color: landingScreenViewModel.currentIndex == 1
                              ? AppColors.vibrantOrange
                              : AppColors.customGray,
                        ),
                        SizedBox(height: 5.h,),
                        Text(
                          'Activity',
                          style: AppTextTheme.myAppText12(
                            landingScreenViewModel.currentIndex == 1
                                ? AppColors.vibrantOrange
                                : AppColors.customGray,
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      landingScreenViewModel.updateIndex(2);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/app_icon_images/statistics.png',
                          height: 24.h,
                          width: 24.w,
                          color: landingScreenViewModel.currentIndex == 2
                              ? AppColors.vibrantOrange
                              : AppColors.customGray,
                        ),
                        SizedBox(height: 5.h,),
                        Text(
                          'Statistics',
                          style: AppTextTheme.myAppText12(
                            landingScreenViewModel.currentIndex == 2
                                ? AppColors.vibrantOrange
                                : AppColors.customGray,
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      landingScreenViewModel.updateIndex(3);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/app_icon_images/profile.png',
                          height: 24.h,
                          width: 24.w,
                          color: landingScreenViewModel.currentIndex == 3
                              ? AppColors.vibrantOrange
                              : AppColors.customGray,
                        ),
                        SizedBox(height: 5.h,),
                        Text(
                          'Profile',
                          style: AppTextTheme.myAppText12(
                            landingScreenViewModel.currentIndex == 3
                                ? AppColors.vibrantOrange
                                : AppColors.customGray,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
