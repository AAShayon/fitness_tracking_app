import 'package:fitness_tracking_app/modules/home/view/widgets/slider.dart';
import 'package:fitness_tracking_app/utils/constant/colors.dart';
import 'package:fitness_tracking_app/utils/theme/custom_themes/text_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DailyActivities extends StatelessWidget {
  const DailyActivities({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 232.h,
        width: 390.w,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 30.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Daily Activities',
                      style: AppTextTheme.myAppText20(AppColors.textPrimary),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'See all',
                          style:
                              AppTextTheme.myAppText16(AppColors.vibrantOrange),
                        ))
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              SliderScreen(),
            ],
          ),
        ));
  }
}

//
// import 'package:fitness_tracking_app/modules/home/view/widgets/slider.dart';
// import 'package:fitness_tracking_app/utils/constant/colors.dart';
// import 'package:fitness_tracking_app/utils/theme/custom_themes/text_themes.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class DailyActivities extends StatelessWidget {
//   const DailyActivities({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 232.h,
//       width: 390.w,
//       color: Colors.white,
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 22.w),
//         child: Column(
//           children: [
//             SizedBox(height: 10.h),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Daily Activities',
//                   style: AppTextTheme.myAppText20(AppColors.textPrimary),
//                 ),
//                 TextButton(
//                   onPressed: () {},
//                   child: Text(
//                     'See all',
//                     style: AppTextTheme.myAppText16(AppColors.vibrantOrange),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16.h),
//             SliderScreen(),
//           ],
//         ),
//       ),
//     );
//   }
// }