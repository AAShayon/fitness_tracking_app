import 'package:fitness_tracking_app/utils/constant/colors.dart';
import 'package:fitness_tracking_app/utils/theme/custom_themes/text_themes.dart';
import 'package:fitness_tracking_app/viewModel/landing_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
class Profile extends StatelessWidget {
  const Profile({super.key});

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
                              Text('Profile',style: AppTextTheme.myAppText20(const Color(0xff000B23)),),
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
          body: Text('Profile'),
        );
      }
    );
  }
}
