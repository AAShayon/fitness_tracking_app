import 'package:fitness_tracking_app/modules/home/viewModel/home_view_model.dart';
import 'package:fitness_tracking_app/utils/constant/colors.dart';
import 'package:fitness_tracking_app/utils/theme/custom_themes/text_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class SliderScreen extends StatelessWidget {
  const SliderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Consumer<HomeViewModel>(
      builder: (context, homeViewModel, child) {
        return SizedBox(
          height: height / 6,
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: homeViewModel.pageController,
                  onPageChanged: homeViewModel.updatePageIndicator,
                  children: const [
                    DailyActivitiesCard(
                      img: "assets/app_icon_images/jogging.png",
                      title: 'Meeting With MD',
                      btnText: 'Join Meeting',
                      iconData: Icons.video_call,
                      discription:
                      'About Project details project Management System',
                    ),
                    DailyActivitiesCard(
                      img: "assets/project_assets/notice.png",
                      title: 'Meeting With MD',
                      btnText: 'View Notice',
                      iconData: Icons.video_call,
                      discription:
                      'About Project details project Management System',
                      show: false,
                    ),
                    DailyActivitiesCard(
                      img: "assets/project_assets/notice.png",
                      title: 'Meeting With MD',
                      btnText: 'Join Meeting',
                      iconData: Icons.video_call,
                      discription:
                      'About Project details project Management System',
                      show: true,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: SmoothPageIndicator(
                  controller: homeViewModel.pageController,
                  onDotClicked:homeViewModel.dotNavigationClick ,
                  count: 3,
                  effect: WormEffect(
                    dotWidth: 10.w,
                    dotHeight: 10.h,
                    activeDotColor: AppColors.darkGray,
                    dotColor: Colors.grey,
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

class DailyActivitiesCard extends StatelessWidget {
  const DailyActivitiesCard({
    super.key,
     required this.img, required this.title, required this.discription, required this.btnText, this.show=true, required this.iconData,
  });


  final String img,title,discription,btnText;
  final bool show;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 136.h,width: 212.w,
      decoration: BoxDecoration(
          color: AppColors.accent,
          borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ActivitiesImage(img: img,),
                Padding(
                  padding:  EdgeInsets.only(left:5.w),
                  child:  const ActivitiesTimeAndCal(datetime: 'Today ,08:10 AM',),
                ),
                Icon(Icons.local_fire_department,
                    color: AppColors.red, size: 10.5.sp,),
                ActivitiesTimeAndCal(progressing: '2.32',required: '5.00',),
                ActivitiesTimeAndCal(activities: 'Jogging',)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ActivitiesImage extends StatelessWidget {
  const ActivitiesImage({
    super.key, required this.img,
  });
  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49.62.h,width: 55.w,decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
            color: Colors.blue.withOpacity(.5)
        )
    ),
      child: Center(child: Image.asset(img,height: 36.h,width: 36.w,)),
    );
  }
}


class ActivitiesTimeAndCal extends StatelessWidget {
  final String? datetime,cal,progressing,required,activities;
  const ActivitiesTimeAndCal({
    super.key,  this.datetime,  this.cal, this.progressing, this.required, this.activities,
  });

  @override
  Widget build(BuildContext context) {
    return  RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$datetime  ',
            style: AppTextTheme.myAppText12(AppColors.darkGray),
          ),
          // WidgetSpan(child: SizedBox(width: 5.w,)
          // ),
          TextSpan(
            text: '$cal',
            style: AppTextTheme.myAppText16(const Color(0xff110C11).withOpacity(.75)),
          ),
          TextSpan(
            text: 'cal',
            style: AppTextTheme.myAppText12(AppColors.darkGray),
          ),
          TextSpan(
            text: '$progressing',
            style: AppTextTheme.myAppText20(AppColors.textPrimary),
          ),
          TextSpan(
            text: '/$required miles',
            style: AppTextTheme.myAppText16(AppColors.darkGray),
          ),
          TextSpan(
            text: '$activities',
            style: AppTextTheme.myAppText12(AppColors.darkGray),
          ),
        ],
      ),
    );
  }
}
