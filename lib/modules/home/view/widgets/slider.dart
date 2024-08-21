import 'package:any_image_view/any_image_view.dart';
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
    CarouselController carouselController = CarouselController();
    return Consumer<HomeViewModel>(
      builder: (context, homeViewModel, child) {
        return SizedBox(
          height: 176.h,width: 212.w,
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: homeViewModel.pageController,
                  onPageChanged: homeViewModel.updatePageIndicator,
                  children: const [
                    DailyActivitiesCard(
                      activities: 'Jogging',
                      required: '5.00',
                      progressing: '2.32',
                      dateTime: 'Today,08:10 AM',
                      image: 'assets/app_icon_images/jogging.png',

                    ),
                    DailyActivitiesCard(
                      activities: 'Cycling',
                      required: '10.00',
                      progressing: '10.00',
                      dateTime: 'Today,08:10 AM',
                      image: 'assets/app_icon_images/cycling.png',
                    ),
                    DailyActivitiesCard(
                      activities: 'Yoga',
                      required: '5.00',
                      progressing: '2.00',
                      dateTime: 'Today,08:10 AM',
                      image: 'assets/app_icon_images/yoga.png',

                    ),
                  ],
                ),
              ),
              ///
              // Expanded(
              //   child: CarouselView(
              //     itemExtent: 250.w,  // Set the width for the item extent
              //     shrinkExtent: 176.h, // Set height for the carousel items
              //     controller: carouselController,
              //     children: const [
              //       DailyActivitiesCard(
              //         activities: 'Jogging',
              //         required: '5.00',
              //         progressing: '2.32',
              //         dateTime: 'Today, 08:10 AM',
              //         image: 'assets/app_icon_images/jogging.png',
              //       ),
              //       DailyActivitiesCard(
              //         activities: 'Cycling',
              //         required: '10.00',
              //         progressing: '10.00',
              //         dateTime: 'Today, 08:10 AM',
              //         image: 'assets/app_icon_images/cycling.png',
              //       ),
              //       DailyActivitiesCard(
              //         activities: 'Yoga',
              //         required: '5.00',
              //         progressing: '2.00',
              //         dateTime: 'Today, 08:10 AM',
              //         image: 'assets/app_icon_images/yoga.png',
              //       ),
              //     ],
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
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
    super.key, required this.dateTime, required this.image, required this.activities, required this.progressing, required this.required,

  });


  final String dateTime,image,activities,progressing,required;

  @override
  Widget build(BuildContext context) {

    return Consumer<HomeViewModel>(
      builder: (context,homeViewModel,child) {
        return Container(
          height: 136.h,width: 212.w,
          decoration: BoxDecoration(
              color: AppColors.accent,
              borderRadius: BorderRadius.circular(8)
          ),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 5.h,),
                  SizedBox(
                    height: 16.h,width: 170.w,
                    child: Row(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(left:5.w),
                          child:    Text('Today, 08:10 AM',
                            style: AppTextTheme.myAppText12(AppColors.darkGray),) ,
                        ),
                        SizedBox(width: 10.w,),
                        Icon(Icons.local_fire_department,
                            color: AppColors.red, size: 10.5.sp,),
                        // RichText(text: TextSpan(
                        //   children: [
                        //    TextSpan(
                        //      text: '238.2',
                        //      style: AppTextTheme.myAppText12(AppColors.customBlack)
                        //    ),
                        //     TextSpan(
                        //       text: 'cal',
                        //       style: AppTextTheme.myAppText12(AppColors.darkGray),
                        //     ),
                        //     TextSpan(
                        //       text: '$progressing',
                        //       style: AppTextTheme.myAppText20(AppColors.textPrimary),
                        //     ),
                        //
                        //   ]
                        // ),),
                        Text( '238.2',
                        style: AppTextTheme.myAppText16(AppColors.textColorBlack)
                        ),
                        Text('cal', style: AppTextTheme.myAppText12(AppColors.darkGray),)




                      ],
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  SizedBox(
                    height: 48.h,width: 188.w,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 48.h,width: 48.w,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: AnyImageView(
                            imagePath:   image,
                          ),
                        ),
                        SizedBox(width: 4.w,),
                        SizedBox(
                          height: 48.h,
                          width: 128.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '2.32',
                                    style: AppTextTheme.myAppText20(AppColors.textPrimary),
                                  ),
                                  TextSpan(
                                    text: '/5.00 miles',
                                    style: AppTextTheme.myAppText16(AppColors.darkGray),
                                  ),
                                ]
                              )),
                              Text('Jogging', style: AppTextTheme.myAppText12(AppColors.darkGray))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 156.w,top: 30.h),
                  child: InkWell(
                    onTap: homeViewModel.togglePause, // Toggle the state on tap
                    child: homeViewModel.onPause
                        ? Icon(Icons.pause_circle_filled, color: AppColors.vibrantOrange, size: 22.sp,)
                        : Icon(Icons.play_circle_filled, color: AppColors.vibrantOrange, size: 22.sp,),
                  ),
                  )
                ],
              ),
            ],
          ),
        );
      }
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



