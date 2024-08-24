// import 'package:fitness_tracking_app/utils/constant/colors.dart';
// import 'package:fitness_tracking_app/utils/theme/custom_themes/text_themes.dart';
// import 'package:fitness_tracking_app/viewModel/setting_view_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// class Profile extends StatelessWidget {
//   const Profile({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<SettingViewModel>(
//         builder: (context,homeViewModel,child) {
//         return Scaffold(
//           appBar: PreferredSize(
//             preferredSize: Size(390.w, 60.h), // AppBar height
//             child: Container(
//               color: AppColors.primaryLight,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Center(
//                     child: SizedBox(
//                       height: 60.h,width: 358.w,
//                       child: Row(
//                         children: [
//                           Row(
//                             children: [
//                               InkWell(
//                                 onTap: () {
//                                   homeViewModel.goBackToPreviousIndex();
//                                 },
//                                 child: SizedBox(
//                                   height: 60.h,
//                                   width: 30.w,
//                                   child: Icon(
//                                     Icons.arrow_back,
//                                     color: Colors.black,
//                                     size: 24.sp,
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(width: 10.w,),
//                               Text('Profile',style: AppTextTheme.myAppText20(const Color(0xff000B23)),),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           body: ListView(
//
//           ),
//         );
//       }
//     );
//   }
// }
import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_tracking_app/main.dart';
import 'package:fitness_tracking_app/modules/auth/view/login.dart';
import 'package:fitness_tracking_app/modules/home/viewModel/home_view_model.dart';
import 'package:fitness_tracking_app/modules/profile/view/widgets/user_setting.dart';
import 'package:fitness_tracking_app/utils/constant/app_utility_helper.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fitness_tracking_app/utils/constant/colors.dart';
import 'package:fitness_tracking_app/utils/theme/custom_themes/text_themes.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, homeViewModel, child) {
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
                      height: 60.h,
                      width: 358.w,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              homeViewModel.goBackToPreviousIndex();
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
                          SizedBox(width: 10.w),
                          Text(
                            'Profile'.tr(),
                            style: AppTextTheme.myAppText20(
                              const Color(0xff000B23),
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
              Container(
                color: Colors.white,
                height:112.h ,width: 390.w,
                child:  Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 80.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              // color: Colors.red,
                              image: DecorationImage(
                                image: homeViewModel.profileImage != null ? MemoryImage(base64Decode(homeViewModel.profileImage!)):const AssetImage('assets/app_icon_images/profile.png',),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // User Info
                          SizedBox(width: 10.w,),
                          SizedBox(
                            height: 72.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '${homeViewModel.name}',
                                  style: AppTextTheme.myAppText18(AppColors.textColorBlack),
                                ),

                                Text(
                                  'joined 15-06-2024',
                                  style: AppTextTheme.myAppText12(AppColors.textColorDarkGray),
                                ),
                                SizedBox(height: 4.h),
                                RichText(text: TextSpan(
                                  children: [
                                    TextSpan(text: '180',style: AppTextTheme.myAppText14(AppColors.textColorBlack)),
                                    WidgetSpan(child: SizedBox(width: 5.w,)),
                                    TextSpan(
                                    text: 'm •',style: AppTextTheme.myAppText12(AppColors.darkerGrey)
                                ),
                                    WidgetSpan(child: SizedBox(width: 3.w,)),
                                    TextSpan(text: '82',style: AppTextTheme.myAppText14(AppColors.textColorBlack)),
                                    WidgetSpan(child: SizedBox(width: 5.w,)),
                                    TextSpan(
                                        text: 'kg •',style: AppTextTheme.myAppText12(AppColors.darkerGrey)
                                    ),
                                    WidgetSpan(child: SizedBox(width: 3.w,)),
                                    TextSpan(text: '30',style: AppTextTheme.myAppText14(AppColors.textColorBlack)),
                                    WidgetSpan(child: SizedBox(width: 5.w,)),
                                    TextSpan(
                                        text: 'years •',style: AppTextTheme.myAppText12(AppColors.darkerGrey)
                                    ),
                                  ]
                                ))

                              ],
                            ),
                          ),
                        ],
                      ),
                     InkWell(
                       onTap: (){},
                       hoverColor: Colors.transparent,
                       splashColor: Colors.transparent,
                       child: Container(
                         width: 53.w,
                         height: 32.h,
                         decoration: BoxDecoration(
                           color: AppColors.vibrantOrange,
                           borderRadius: BorderRadius.circular(16.r)
                         ),
                         child: Center(child: Text('Edit',style: AppTextTheme.myAppText12(AppColors.primaryLight),)),
                       ),
                     )
                    ],
                  ),
                ),
              ),
              Container(height: 16.h,color: AppColors.accent,),
              Container(
                color: Colors.white,
                height:297.h ,width: 390.w,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16.5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 14.h),
                      // Weekly Progress
                      Text(
                        "This Week's progress".tr(),
                        style: AppTextTheme.myAppText18(AppColors.textColorBlack),
                      ),
                      SizedBox(height: 8.h),
                      // Progress Metrics
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset('assets/app_icon_images/shoe.png', height: 20.sp, width: 20.sp),
                              SizedBox(width: 4.w),
                              const ProgressCountCard(count: '67,265', specification: 'steps'),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.local_fire_department, color: Colors.red, size: 20.sp),
                              SizedBox(width: 4.w),
                              const ProgressCountCard(count: '6,730.5', specification: 'cal'),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on, color: AppColors.vibrantOrange, size: 20.sp),
                              SizedBox(width: 8.w),
                              const ProgressCountCard(count: '50.2', specification: 'mi'),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      // Progress Bar Chart
                      SizedBox(
                        height: 158.h,
                        child: Image.asset('assets/app_icon_images/weekly statistics.png',fit: BoxFit.contain,),
                      ),
                      SizedBox(height: 17.h),
                      RichText(text: TextSpan(
                        children: [
                          TextSpan(
                            text: "You've completed",
                            style: AppTextTheme.myAppText12(AppColors.darkerGrey)
                          ),
                          WidgetSpan(child: SizedBox(width: 3.w,)),
                          TextSpan(
                              text: " 3 ",
                              style: AppTextTheme.myAppText18(AppColors.textColorBlack)
                          ),
                          WidgetSpan(child: SizedBox(width: 3.w,)),
                          TextSpan(
                              text: "out of ",
                              style: AppTextTheme.myAppText12(AppColors.darkerGrey)
                          ),
                          WidgetSpan(child: SizedBox(width: 3.w,)),
                          TextSpan(
                              text: " 7 ",
                              style: AppTextTheme.myAppText16(AppColors.textColorBlack)
                          ),
                          WidgetSpan(child: SizedBox(width: 3.w,)),
                          TextSpan(
                              text: " daily goals ",
                              style: AppTextTheme.myAppText12(AppColors.darkerGrey)
                          ),
                        ]
                      ))

                    ],
                  ),
                ),
              ),
              Container(height: 16.h,color: AppColors.accent,),

              Container(
                height: 164.h,width: 358.w,
                color: Colors.white,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16.5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      Text(
                        'Your Goal setting'.tr(),
                        style: AppTextTheme.myAppText18(AppColors.textColorBlack),
                      ),
                      SizedBox(height: 14.h),
                      SizedBox(height: 44.h,width: 358.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.local_fire_department,size: 18.sp,color: AppColors.customRed,),
                              SizedBox(width: 3.w,),
                              Text('Calories to burn',style: AppTextTheme.myAppText16(AppColors.textColorBlack),),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Text('2,000',style: AppTextTheme.myAppText18(AppColors.textColorBlack),),
                                  SizedBox(width: 3.w,),
                                  Text('cal',style: AppTextTheme.myAppText12(AppColors.darkerGrey),)
                                ],
                              ),
                              Text('5 Days',style: AppTextTheme.myAppText12(AppColors.darkerGrey),)
                            ],
                          )
                        ],
                      ),
                      ),
                      SizedBox(height: 14.h),
                      SizedBox(height: 44.h,width: 358.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset('assets/app_icon_images/shoe.png',height: 18.sp,width: 18.sp,),
                                SizedBox(width: 3.w,),
                                Text('Steps to cover',style: AppTextTheme.myAppText16(AppColors.textColorBlack),),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Text('20,000',style: AppTextTheme.myAppText18(AppColors.textColorBlack),),
                                    SizedBox(width: 3.w,),
                                    Text('steps',style: AppTextTheme.myAppText12(AppColors.darkerGrey),)
                                  ],
                                ),
                                Text('Daily',style: AppTextTheme.myAppText12(AppColors.darkerGrey),)
                              ],
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              Container(height: 20.h,color: AppColors.accent,),
              Container(
                height: 164.h,width: 358.w,
                color: Colors.white,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16.5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      Text(
                        'Your sleep cycle'.tr(),
                        style: AppTextTheme.myAppText18(AppColors.textColorBlack),
                      ),
                      SizedBox(height: 14.h),
                      SizedBox(height: 44.h,width: 358.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                               Image.asset('assets/app_icon_images/moon.png',height: 18.sp,width: 18.sp,),
                                SizedBox(width: 3.w,),
                                Text('Bed time',style: AppTextTheme.myAppText16(AppColors.textColorBlack),),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Text('10',style: AppTextTheme.myAppText18(AppColors.textColorBlack),),
                                    SizedBox(width: 3.w,),
                                    Text('PM',style: AppTextTheme.myAppText12(AppColors.darkerGrey),)
                                  ],
                                ),
                                Text('Days',style: AppTextTheme.myAppText12(AppColors.darkerGrey),)
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 14.h),
                      SizedBox(height: 44.h,width: 358.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset('assets/app_icon_images/wake-up.png',height: 18.sp,width: 18.sp,),
                                SizedBox(width: 3.w,),
                                Text('Wake-up time',style: AppTextTheme.myAppText16(AppColors.textColorBlack),),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Text('6.00',style: AppTextTheme.myAppText18(AppColors.textColorBlack),),
                                    SizedBox(width: 3.w,),
                                    Text('AM',style: AppTextTheme.myAppText12(AppColors.darkerGrey),)
                                  ],
                                ),
                                Text('5 Days',style: AppTextTheme.myAppText12(AppColors.darkerGrey),)
                              ],
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                width: 390.w,
                height: 324.h,
                color: Colors.white,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16.5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h,),
                      Text(
                        'Others'.tr(),
                        style: AppTextTheme.myAppText18(AppColors.textColorBlack),
                      ),

                      ProfileButton(btnName: 'My Account',iconData: Icons.person,onPressed: (){},),
                      Container(height: 2.h,color: AppColors.accent,),
                      ProfileButton(iconData: Icons.notifications, btnName: 'Notification',onPressed: (){},),
                      Container(height: 2.h,color: AppColors.accent,),
                      ProfileButton(iconData: Icons.description, btnName: 'Privacy Policy',onPressed: (){},),
                      Container(height: 2.h,color: AppColors.accent,),
                      ProfileButton(iconData: Icons.description, btnName: 'Settings',onPressed: (){AppHelperFunctions.navigateToScreen(context, const UserSetting());},),
                      Container(height: 2.h,color: AppColors.accent,),
                      ProfileButton(iconData: Icons.logout_outlined, btnName: 'Log out',onPressed: ()async{
                      await homeViewModel.logout().then((isTrue){
                        if(context.mounted){
                          AppHelperFunctions.navigateToScreenAndRemoveUntil(context, const Login());
                        }
                      });

                        },),
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

class ProfileButton extends StatelessWidget {
    const ProfileButton({
    super.key, required this.iconData, required this.btnName, this.onPressed,
  });
  final IconData iconData;
  final String btnName;
  final dynamic onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: onPressed,
      child: SizedBox(
        width: 358.w,
        height: 56.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 24.h,width: 24.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Icon(iconData,color: AppColors.darkerGrey,size: 18.sp,)),
            SizedBox(width: 5.w,),
            Text(btnName,style:AppTextTheme.myAppText161(AppColors.textColorBlack) ,)
          ],
        ),
      ),
    );
  }
}

class ProgressCountCard extends StatelessWidget {
  final String count;
  final String specification;
  const ProgressCountCard({
    super.key, required this.count, required this.specification,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(text: TextSpan(
      children: [
        TextSpan(
          text: count,style: AppTextTheme.myAppText161(AppColors.textColorBlack),
        ),WidgetSpan(child: SizedBox(width: 2.w,)),
        TextSpan(text: specification,style: AppTextTheme.myAppText12(AppColors.darkerGrey))
      ]
    ));
  }
}


// class WeeklyStatisticsChart extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: BarChart(
//         BarChartData(
//           alignment: BarChartAlignment.spaceAround,
//           maxY: 2000,
//           barTouchData: BarTouchData(enabled: false),
//           titlesData: FlTitlesData(
//             show: true,
//             bottomTitles: AxisTitles(
//               sideTitles: SideTitles(
//                 showTitles: true,
//                 getTitlesWidget: (double value, TitleMeta meta) {
//                   const style = TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 14,
//                   );
//                   switch (value.toInt()) {
//                     case 0:
//                       return Text('S', style: style);
//                     case 1:
//                       return Text('M', style: style);
//                     case 2:
//                       return Text('T', style: style);
//                     case 3:
//                       return Text('W', style: style);
//                     case 4:
//                       return Text('T', style: style);
//                     case 5:
//                       return Text('F', style: style);
//                     case 6:
//                       return Text('S', style: style);
//                     default:
//                       return Text('', style: style);
//                   }
//                 },
//               ),
//             ),
//             leftTitles: AxisTitles(
//               sideTitles: SideTitles(
//                 showTitles: true,
//                 reservedSize: 28,
//                 interval: 1000,
//                 getTitlesWidget: (value, meta) {
//                   return Text('${(value / 1000).toStringAsFixed(0)}k', style: TextStyle(color: Colors.black, fontSize: 12));
//                 },
//               ),
//             ),
//             topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//             rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//           ),
//           gridData: FlGridData(
//             show: true,
//             drawVerticalLine: false,
//           ),
//           borderData: FlBorderData(
//             show: false,
//           ),
//           barGroups: [
//             makeGroupData(0, 1500),
//             makeGroupData(1, 2000),
//             makeGroupData(2, 0),
//             makeGroupData(3, 800),
//             makeGroupData(4, 0),
//             makeGroupData(5, 2000),
//             makeGroupData(6, 400),
//           ],
//         ),
//       ),
//     );
//   }
//
//   BarChartGroupData makeGroupData(int x, double y) {
//     return BarChartGroupData(
//       barsSpace: 4,
//       x: x,
//       barRods: [
//         BarChartRodData(
//           toY: y,
//           color: Colors.black,
//           width: 12,
//           borderRadius: BorderRadius.circular(0),
//           backDrawRodData: BackgroundBarChartRodData(
//             show: true,
//             toY: 2000,
//             color: Colors.black.withOpacity(0.1),
//           ),
//         ),
//       ],
//     );
//   }
// }
