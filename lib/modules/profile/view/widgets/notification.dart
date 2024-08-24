import 'package:fitness_tracking_app/modules/home/viewModel/home_view_model.dart';
import 'package:fitness_tracking_app/utils/constant/app_utility_helper.dart';
import 'package:fitness_tracking_app/utils/constant/colors.dart';
import 'package:fitness_tracking_app/utils/theme/custom_themes/text_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class NotificationSetting extends StatelessWidget {
  const NotificationSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFunctions.isDarkMode(context); // Check if dark mode is active

    // Define colors based on dark mode
    final activeColor = isDark ? Colors.white : Colors.black;
    final inactiveColor = isDark ? Colors.grey : Colors.black;
    final textColor = isDark ? Colors.white : Colors.black;
    return Consumer<HomeViewModel>(
      builder: (context, homeViewModel, child) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(390.w, 60.h), // AppBar height
            child: Container(
              color: isDark ? AppColors.dark : AppColors.primaryLight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: SizedBox(
                      height: 60.h,
                      width: 358.w,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SizedBox(
                              height: 60.h,
                              width: 30.w,
                              child: Icon(
                                Icons.arrow_back,
                                color: textColor, // Ensure correct icon color
                                size: 24.sp,
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            'Notification',
                            style: AppTextTheme.myAppText20(textColor), // Set header text color
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
              Container(
                color: isDark ? AppColors.dark : AppColors.primaryLight, // Ensure correct background color
                height: 297.h,
                width: 390.w,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 14.h),
                      Text(
                        "Notification",
                        style: AppTextTheme.myAppText18(textColor), // Set title text color
                      ),
                      SizedBox(height: 20.h),

                      // Wrap in a Theme widget to adjust unselected radio button color
                      Theme(
                        data: Theme.of(context).copyWith(
                          unselectedWidgetColor: inactiveColor, // Color for unselected radio button
                        ),
                        child: Column(
                          children: [
                            // Notification ON Radio Button
                            RadioListTile<bool>(
                              title: Text(
                                "On",
                                style: AppTextTheme.myAppText161(
                                  textColor, // Text color based on theme
                                ),
                              ),
                              value: true, // Radio value for notification ON
                              groupValue: homeViewModel.notificationOn, // Group value for current state
                              activeColor: activeColor, // Active radio button color
                              onChanged: (bool? value) {
                                if (value != null) {
                                  homeViewModel.toggleNotification(); // Toggle notification
                                }
                              },
                            ),

                            // Notification OFF Radio Button
                            RadioListTile<bool>(
                              title: Text(
                                "Off",
                                style: AppTextTheme.myAppText161(
                                  textColor, // Text color based on theme
                                ),
                              ),
                              value: false, // Radio value for notification OFF
                              groupValue: homeViewModel.notificationOn, // Group value for current state
                              activeColor: activeColor, // Active radio button color
                              onChanged: (bool? value) {
                                if (value != null) {
                                  homeViewModel.toggleNotification(); // Toggle notification
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
