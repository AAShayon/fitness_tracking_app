import 'package:any_image_view/any_image_view.dart';
import 'package:fitness_tracking_app/modules/home/view/widgets/custom_linear_progress_indicator.dart';
import 'package:fitness_tracking_app/utils/constant/colors.dart';
import 'package:fitness_tracking_app/utils/theme/custom_themes/text_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ReusableActivity extends StatelessWidget {
  final String activityName, percentText;
  final String? img;
  final Color color;
  final double value;

  const ReusableActivity({
    super.key,
    required this.activityName,
    this.img,
    required this.percentText,
    required this.color,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24.h,
      child: Row(
        children: [
          Container(
            width: 91.w,
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  width: 2.w,
                  color: Colors.grey,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  activityName,
                  style: AppTextTheme.myAppText12(AppColors.textColorBlack),
                ),
                Container(
                  height: 24.h,
                  width: 24.w,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: AnyImageView(
                    imagePath: img,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 20.w),
          Container(
            width: 221.w,
            child: Row(
              children: [
                Container(
                  width: 190.w * value,
                  child: CustomLinearProgressIndicator(
                    colorStatus: Colors.transparent,
                    value: value,
                    color: color,
                    height: 1.h,
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  '$percentText%',
                  style: AppTextTheme.myAppText16(color),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

