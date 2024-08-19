// import 'package:fitness_tracking_app/utils/constant/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// class Home extends StatefulWidget {
//   const Home({super.key});
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     bool isOn=true;
//     return Scaffold(
//       appBar:  AppBar(
//         toolbarHeight: 104.h,
//         actions: [
//           Padding(
//             padding:  EdgeInsets.only(right:18.w ),
//             child: InkWell(
//               splashColor: Colors.transparent,
//               hoverColor: Colors.transparent,
//               onTap: (){
//                 setState(() {
//                   isOn=!isOn;});
//               },
//               child: Container(
//                 width:35.sp ,height: 35.sp,
//                 decoration: BoxDecoration(
//                     color:Color(0xffF4F5F6),
//
//                     borderRadius: BorderRadius.circular(100)
//                 ),
//                 child: Stack(
//                   children: [
//                     Positioned(
//                         top: 10.sp,
//                         right: 8.sp,
//                         child:isOn ?
//                         Container(
//                           width: 6.19.sp,
//                           height: 6.19.sp,
//                           decoration: BoxDecoration(
//                             color:AppColors.red,
//                             borderRadius: BorderRadius.circular(100),
//                           ),
//                         ):SizedBox.shrink()
//                     ),
//                     Center(
//                       child: Image.asset('assets/app_icon_images/notifications.png',width: 24.sp,height: 24.sp,),
//                     ),
//                     Positioned(
//                         top: 10.sp,
//                         right: 8.sp,
//                         child:isOn ? Container(
//                           width: 6.19.sp,
//                           height: 6.19.sp,
//                           decoration: BoxDecoration(
//                             color:AppColors.red,
//                             borderRadius: BorderRadius.circular(100),
//                           ),
//                         ):SizedBox.shrink()
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//       body: Center(child: Text('Home')),
//     );
//   }
// }
import 'package:fitness_tracking_app/utils/constant/colors.dart';
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
        preferredSize: Size(390.w, 104.h), // AppBar height
        child: Padding(
          padding: EdgeInsets.only(top: 34.h), // Padding from top
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // User Profile Image
                    CircleAvatar(
                      radius: 22.sp,
                      backgroundImage: AssetImage('assets/profile_image.png'), // Use your profile image here
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
                      color: Color(0xffF4F5F6),
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
      ),
      body: Center(child: Text('Home')),
    );
  }
}
