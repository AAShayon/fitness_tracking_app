// import 'package:fitness_tracking_app/utils/constant/app_utility_helper.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import 'package:fitness_tracking_app/utils/constant/colors.dart';
// import 'package:fitness_tracking_app/utils/theme/custom_themes/text_themes.dart';
// import 'package:fitness_tracking_app/viewModel/setting_view_model.dart';
//
// class UserSetting extends StatelessWidget {
//   const UserSetting({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final settingViewModel = Provider.of<SettingViewModel>(context);
//     final isDark=AppHelperFunctions.isDarkMode(context);
//
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size(390.w, 60.h), // AppBar height
//         child: Container(
//           color: AppColors.primaryLight,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Center(
//                 child: SizedBox(
//                   height: 60.h,
//                   width: 358.w,
//                   child: Row(
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           Navigator.pop(context);
//                         },
//                         child: SizedBox(
//                           height: 60.h,
//                           width: 30.w,
//                           child: Icon(
//                             Icons.arrow_back,
//                             color: Colors.black,
//                             size: 24.sp,
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 10.w),
//                       Text(
//                         'User Setting',
//                         style: AppTextTheme.myAppText20(
//                           const Color(0xff000B23),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: ListView(
//         children: [
//           Container(
//             color: Colors.white,
//             height: 297.h,
//             width: 390.w,
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.5.w),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 14.h),
//                   Text(
//                     "Theme",
//                     style: AppTextTheme.myAppText18(AppColors.textColorBlack),
//                   ),
//                   SizedBox(height: 20.h),
//
//                   // Radio button list for theme selection
//                   RadioListTile<ThemeMode>(
//                     title:  Text("Light",style: AppTextTheme.myAppText161(AppColors.dark),),
//                     value: ThemeMode.light,
//                     activeColor: isDark? AppColors.light:AppColors.dark,
//
//                     groupValue: settingViewModel.themeMode,
//                     onChanged: (ThemeMode? value) {
//                       if (value != null) {
//                         settingViewModel.setThemeMode(value);
//                       }
//                     },
//                   ),
//                   RadioListTile<ThemeMode>(
//                     title:  Text("Dark",style: AppTextTheme.myAppText161(AppColors.dark),),
//                     value: ThemeMode.dark,
//                     activeColor: isDark? AppColors.light:AppColors.dark,
//                     groupValue: settingViewModel.themeMode,
//                     onChanged: (ThemeMode? value) {
//                       if (value != null) {
//                         settingViewModel.setThemeMode(value);
//                       }
//                     },
//                   ),
//                   RadioListTile<ThemeMode>(
//
//                     title:  Text("System Default",style: AppTextTheme.myAppText161(AppColors.dark),),
//                     value: ThemeMode.system,
//                     activeColor: isDark? AppColors.light:AppColors.dark,
//                     groupValue: settingViewModel.themeMode,
//                     onChanged: (ThemeMode? value) {
//                       if (value != null) {
//                         settingViewModel.setThemeMode(value);
//                       }
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_tracking_app/modules/home/view/home.dart';
import 'package:fitness_tracking_app/utils/constant/app_utility_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:fitness_tracking_app/utils/constant/colors.dart';
import 'package:fitness_tracking_app/utils/theme/custom_themes/text_themes.dart';
import 'package:fitness_tracking_app/viewModel/setting_view_model.dart';

class UserSetting extends StatelessWidget {
  const UserSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFunctions.isDarkMode(context); // Check if dark mode is active

    // Define colors based on dark mode
    final activeColor = isDark ? Colors.white : Colors.black;
    final inactiveColor = isDark ? Colors.grey : Colors.black;
    final textColor = isDark ? Colors.white : Colors.black;

    return Consumer<SettingViewModel>(
      builder: (context,settingViewModel,child) {
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
                            'User Setting',
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
                      Row(
                        children: [
                          Text(
                            "Theme",
                            style: AppTextTheme.myAppText18(textColor), // Set title text color
                          ),
                          const Spacer(),
                          Text(settingViewModel.themeMode.toString().split('.').last,style: AppTextTheme.myAppText18(textColor),)
                        ],
                      ),
                      SizedBox(height: 20.h),

                      // Wrap in a Theme widget to adjust unselected radio button color
                      Theme(
                        data: Theme.of(context).copyWith(
                          unselectedWidgetColor: inactiveColor, // Color for unselected radio button
                        ),
                        child: Column(
                          children: [
                            // Light Theme Radio Button
                            RadioListTile<ThemeMode>(
                              title: Text(
                                "Light",
                                style: AppTextTheme.myAppText161(
                                  textColor, // Text color based on theme
                                ),
                              ),
                              value: ThemeMode.light,
                              groupValue: settingViewModel.themeMode,
                              activeColor: activeColor, // Active radio button color
                              onChanged: (ThemeMode? value) {
                                if (value != null) {
                                  settingViewModel.setThemeMode(value);
                                }
                              },
                            ),

                            // Dark Theme Radio Button
                            RadioListTile<ThemeMode>(
                              title: Text(
                                "Dark",
                                style: AppTextTheme.myAppText161(
                                  textColor, // Text color based on theme
                                ),
                              ),
                              value: ThemeMode.dark,
                              groupValue: settingViewModel.themeMode,
                              activeColor: activeColor, // Active radio button color
                              onChanged: (ThemeMode? value) {
                                if (value != null) {
                                  settingViewModel.setThemeMode(value);
                                }
                              },
                            ),

                            // System Default Theme Radio Button
                            RadioListTile<ThemeMode>(
                              title: Text(
                                "System Default",
                                style: AppTextTheme.myAppText161(
                                  textColor, // Text color based on theme
                                ),
                              ),
                              value: ThemeMode.system,
                              groupValue: settingViewModel.themeMode,
                              activeColor: activeColor, // Active radio button color
                              onChanged: (ThemeMode? value) {
                                if (value != null) {
                                  settingViewModel.setThemeMode(value);
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
              SizedBox(height: 20.h,),
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
                      Row(
                        children: [
                          Text(
                            "Language",
                            style: AppTextTheme.myAppText18(textColor), // Set title text color
                          ),
                          const Spacer(),
                          Text(
                            context.locale.languageCode == 'en' ? 'English' : 'বাংলা',
                            style: AppTextTheme.myAppText18(textColor), // Display current language status
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Theme(
                        data: Theme.of(context).copyWith(
                          unselectedWidgetColor: inactiveColor, // Color for unselected radio button
                        ),
                        child: Column(
                          children: [
                            // English Language Radio Button
                            RadioListTile<Locale>(
                              title: Text(
                                "English",
                                style: AppTextTheme.myAppText161(textColor), // Set text color
                              ),
                              value: const Locale("en", ""), // Locale for English
                              groupValue: context.locale, // Current locale
                              activeColor: activeColor, // Active radio button color
                              onChanged: (Locale? value) {
                                if (value != null) {
                                  context.setLocale(value); // Change language to English
                                  AppHelperFunctions.showAlert(context, 'Error', 'Not properly implement\nWill Work in Future', AppColors.white);
                                }
                              },
                            ),

                            // Bangla Language Radio Button
                            RadioListTile<Locale>(
                              title: Text(
                                "বাংলা",
                                style: AppTextTheme.myAppText161(textColor), // Set text color
                              ),
                              value: const Locale("bn", ""), // Locale for Bangla
                              groupValue: context.locale, // Current locale
                              activeColor: activeColor, // Active radio button color
                              onChanged: (Locale? value) {
                                if (value != null) {
                                  context.setLocale(value); // Change language to Bangla
                                  AppHelperFunctions.showAlert(context, 'Error', 'Not properly implement\nWill Work in Future', AppColors.white);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h,),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
