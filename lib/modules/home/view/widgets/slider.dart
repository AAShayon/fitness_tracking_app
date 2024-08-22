import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:fitness_tracking_app/modules/home/view/widgets/daily_activities_card.dart';
import 'package:fitness_tracking_app/modules/home/viewModel/home_view_model.dart';
import 'package:fitness_tracking_app/utils/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SliderScreen extends StatelessWidget {
  const SliderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, homeViewModel, child) {
        return SizedBox(
          height: 176.h,
          width: 390.w,
          child: Column(
            children: [
              Expanded(
                child: CarouselSlider(
                  // carouselController: homeViewModel.carouselController,  // Use the controller from HomeViewModel
                  options: CarouselOptions(
                    height: 176.h,
                    viewportFraction: 0.6,
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      homeViewModel.updatePageIndicator(index); // Update the page index in viewModel
                    },
                  ),
                  items: const [
                    DailyActivitiesCard(
                      activities: 'Jogging',
                      required: '5.00',
                      progressing: '2.32',
                      image: 'assets/app_icon_images/jogging.png', cal: '238.2',
                    ),
                    DailyActivitiesCard(
                      activities: 'Cycling',
                      required: '10.0',
                      progressing: '10.0',
                      image: 'assets/app_icon_images/cycling.png', cal: '563.3',
                    ),
                    DailyActivitiesCard(
                      activities: 'Yoga',
                      min: '30',
                      progressing: '30',
                      image: 'assets/app_icon_images/yoga.png', cal: '238.2',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: DotsIndicator(
                  dotsCount: 3,  // The number of pages
                  position: homeViewModel.currentPageIndex, // Cast the current page index to double
                  decorator: DotsDecorator(
                    activeColor: AppColors.darkGray,
                    color: Colors.grey,
                    size: Size.square(10.w),  // Normal dot size
                    activeSize: Size.square(12.w),  // Active dot size
                  ),
                  onTap: (index) {
                    homeViewModel.dotNavigationClick(index.toInt());  // Navigate to the clicked dot
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
