
import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_tracking_app/modules/activity/view/widget/activites_list_card.dart';
import 'package:fitness_tracking_app/modules/activity/view/widget/reusable_activites.dart';
import 'package:fitness_tracking_app/modules/home/viewModel/home_view_model.dart';
import 'package:fitness_tracking_app/utils/constant/colors.dart';
import 'package:fitness_tracking_app/utils/theme/custom_themes/text_themes.dart';
import 'package:fitness_tracking_app/view/widgets/fade_in_animation.dart';
import 'package:fitness_tracking_app/viewModel/setting_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  State<Activity> createState() => _ActivityState();
}

bool isOn = true;
DateTime selectedDate = DateTime.now(); // Initially set to today

class _ActivityState extends State<Activity> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
        builder: (context, landingViewModel, child) {
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'Daily Activity',
                              style: AppTextTheme.myAppText20(
                                  const Color(0xff000B23)),
                            ),
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
                                border: Border.all(color: AppColors.grey),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                      top: 10.sp,
                                      right: 8.sp,
                                      child: landingViewModel.onPause
                                          ? Container(
                                              width: 6.19.sp,
                                              height: 6.19.sp,
                                              decoration: BoxDecoration(
                                                color: AppColors.vibrantOrange,
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                            )
                                          : const SizedBox.shrink()),
                                  Center(
                                    child: Image.asset(
                                      'assets/app_icon_images/notifications.png',
                                      width: 24.sp,
                                      height: 24.sp,
                                    ),
                                  ),
                                  Positioned(
                                      top: 10.sp,
                                      right: 8.sp,
                                      child: landingViewModel.onPause
                                          ? Container(
                                              width: 6.19.sp,
                                              height: 6.19.sp,
                                              decoration: BoxDecoration(
                                                color: AppColors.vibrantOrange,
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                            )
                                          : const SizedBox.shrink())
                                ],
                              )),
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
            SizedBox(
              height: 14.h,
            ),
            Container(
              width: 390.h,
              height: 133.h,
              color: AppColors.primaryLight,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 14.h,
                    ),
                    Text(
                      'Today your activities',
                      style: AppTextTheme.myAppText20(AppColors.textColorBlack),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      color: AppColors.primaryLight,
                      height: 59.h,
                      width: 358.w,
                      child: GridView.builder(
                          itemCount: 7,
                          // Displaying 7 days
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 10.w,
                            crossAxisCount: 1,
                            childAspectRatio: 59 / 42.57,
                          ),
                          itemBuilder: (context, index) {
                            // Center today in the middle (index 3)
                            DateTime date = DateTime.now()
                                .subtract(Duration(days: 3 - index));
                            final dayName =
                                DateFormat('EEE').format(date); // Get day name

                            return FadeInAnimation(
                              direction: FadeInDirection.rtl,
                              delay: .2 + index,
                              fadeOffset: index == 0 ? 80 : 80.0 * index,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedDate =
                                          date; // Update selected date
                                    });
                                  },
                                  child: Container(
                                    width: 42.57.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            color: const Color(0xffE4E4E4),
                                            width: 1.sp),
                                        color: date.day == selectedDate.day
                                            ? AppColors.vibrantOrange
                                            : Colors.white),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(dayName,
                                            style: AppTextTheme.myAppText12(
                                                date.day == selectedDate.day
                                                    ? AppColors.primaryLight
                                                    : AppColors.vibrantOrange)),
                                        Text(DateFormat('dd').format(date),
                                            // Get day number
                                            style: AppTextTheme.myAppText16(
                                                date.day == selectedDate.day
                                                    ? AppColors.primaryLight
                                                    : AppColors.vibrantOrange)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 14.h,
            ),
            Container(
              height: 412.h,
              width: 390.w,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('You\'ve burned',
                            style: AppTextTheme.myAppText16(
                                AppColors.textColorBlack)),
                        Row(
                          children: [
                            Icon(Icons.local_fire_department,
                                color: AppColors.red, size: 20.sp),
                            Text(
                              '1,116.5 ',
                              style: AppTextTheme.myAppText24(
                                  AppColors.primaryDark),
                            ),
                            Text(
                              'cal',
                              style: AppTextTheme.myAppText12(
                                  AppColors.customGray),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      width: 358.w,
                      height: 140.h,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: const Column(
                          children: [
                            ReusableActivity(
                              color: AppColors.customYellow,
                              activityName: 'Jogging',
                              img: 'assets/app_icon_images/jogging.png',
                              percentText: '22',
                              value: .22,
                            ),
                            ReusableActivity(
                              activityName: 'Cycling',
                              img: 'assets/app_icon_images/cycling.png',
                              percentText: '50',
                              color: AppColors.customBlue,
                              value: .50,
                            ),
                            ReusableActivity(
                              activityName: 'Yoga',
                              img: 'assets/app_icon_images/yoga.png',
                              percentText: '13',
                              color: AppColors.customRed,
                              value: .13,
                            ),
                            ReusableActivity(
                              activityName: 'Others',
                              percentText: '15',
                              color: AppColors.customBlack,
                              value: .15,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      height: 69.h,
                      width: 358.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.lightGrey),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.location_on_rounded,
                                  color: AppColors.grey,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text('Distance',
                                    style: AppTextTheme.myAppText16(
                                        AppColors.dark)),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Align(
                                alignment: Alignment.bottomRight,
                                child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: 'You have covered',
                                        style: AppTextTheme.myAppText12(
                                            AppColors.textColorDarkGray)),
                                    TextSpan(
                                        text: ' 14.8 ',
                                        style: AppTextTheme.myAppText20(
                                            AppColors.textColorBlack)),
                                    TextSpan(
                                        text: 'm',
                                        style: AppTextTheme.myAppText12(
                                            AppColors.textColorDarkGray))
                                  ]),
                                )),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      width: 358.w,
                      height: 78.h,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Container(
                              height: 78.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.r),
                              color: AppColors.accent
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: 14.h,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/app_icon_images/shoe.png',
                                          height: 18.sp,
                                          width: 18.sp,
                                        ),
                                        SizedBox(
                                          width: 4.w,
                                        ),
                                        Text(
                                          'Steps',
                                          style: AppTextTheme.myAppText16(
                                              AppColors.textColorBlack),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                      '19,124',
                                      style: AppTextTheme.myAppText20(
                                          AppColors.textColorBlack),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 10.w,
                            color: Colors.white,
                          ),
                          Flexible(
                            child: Container(
                              height: 78.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.r),color: AppColors.accent),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: 14.h,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.timer,color: AppColors.customBlue,),
                                        SizedBox(
                                          width: 4.w,
                                        ),
                                        Text(
                                          'Time',
                                          style: AppTextTheme.myAppText16(
                                              AppColors.textColorBlack),
                                        )
                                      ],
                                    ),
                                   RichText(text: TextSpan(
                                     children: [
                                       TextSpan(
                                         text: '2',
                                         style: AppTextTheme.myAppText20(AppColors.textColorBlack)
                                       ),
                                       WidgetSpan(child: SizedBox(width: 2.w,)),
                                       TextSpan(
                                           text: 'h',
                                           style: AppTextTheme.myAppText12(AppColors.textColorDarkGray)
                                       ),
                                       WidgetSpan(child: SizedBox(width: 2.w,)),
                                       TextSpan(
                                           text: '14',
                                           style: AppTextTheme.myAppText20(AppColors.textColorBlack)
                                       ),WidgetSpan(child: SizedBox(width: 2.w,)),
                                       TextSpan(
                                           text: 'm',
                                           style: AppTextTheme.myAppText12(AppColors.textColorDarkGray)
                                       ),
                                     ]
                                   )),
                                    SizedBox(height: 5.w,)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 409.h,
              width: 390.w,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 14.h,),
                    Text('Activities',style: AppTextTheme.myAppText20(AppColors.textColorBlack),),
                    SizedBox(height: 20.h,),
                    // ActivitiesVerticalCard(),
                    const ActivitiesVerticalCard(
                      activities: 'Jogging',
                      required: '5.00',
                      progressing: '2.32',
                      image: 'assets/app_icon_images/jogging.png', cal: '238.2',
                    ),
                    SizedBox(height:20.h),
                    const ActivitiesVerticalCard(
                      activities: 'Cycling',
                      required: '10.0',
                      progressing: '10.0',
                      image: 'assets/app_icon_images/cycling.png', cal: '563.3',
                    ),
                    SizedBox(height:20.h),
                    const ActivitiesVerticalCard(
                      activities: 'Yoga',
                      min: '30',
                      progressing: '30',
                      image: 'assets/app_icon_images/yoga.png', cal: '238.2',
                    ),


                  ],
                ),
              ),
            ),
            
          ],
        ),
      );
    });
  }
}


