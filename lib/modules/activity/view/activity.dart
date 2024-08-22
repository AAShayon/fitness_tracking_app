import 'package:fitness_tracking_app/modules/home/viewModel/home_view_model.dart';
import 'package:fitness_tracking_app/utils/constant/colors.dart';
import 'package:fitness_tracking_app/utils/theme/custom_themes/text_themes.dart';
import 'package:fitness_tracking_app/viewModel/landing_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  State<Activity> createState() => _ActivityState();
}
bool isOn = true;
class _ActivityState extends State<Activity> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LandingViewModel>(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  landingViewModel.goBackToPreviousIndex();
                                  // Provider.of<LandingViewModel>(context,listen: false)
                                  //     .goBackToPreviousIndex();
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
                              Text('Daily Activity',style: AppTextTheme.myAppText20(const Color(0xff000B23)),),
                            ],
                          ),

                          InkWell(
                            splashColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            onTap: () {
                              landingViewModel.togglePause();
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
                                        child:landingViewModel.onPause ?
                                        Container(
                                          width: 6.19.sp,
                                          height: 6.19.sp,
                                          decoration: BoxDecoration(
                                            color:AppColors.vibrantOrange,
                                            borderRadius: BorderRadius.circular(100),
                                          ),
                                        ):SizedBox.shrink()
                                    ),
                                    Center(
                                      child: Image.asset('assets/app_icon_images/notifications.png',width: 24.sp,height: 24.sp,),
                                    ),
                                    Positioned(
                                        top: 10.sp,
                                        right: 8.sp,
                                        child:landingViewModel.onPause? Container(
                                          width: 6.19.sp,
                                          height: 6.19.sp,
                                          decoration: BoxDecoration(
                                            color:AppColors.vibrantOrange,
                                            borderRadius: BorderRadius.circular(100),
                                          ),
                                        ):SizedBox.shrink()
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
          body: Text('Activity'),
        );
      }
    );
  }
}
