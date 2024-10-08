
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLinearProgressIndicator extends StatelessWidget {
  final Gradient? gradient;
  final double value;
  final Color colorStatus;
  final Color? color;
  final double width;
  final double height;

   const CustomLinearProgressIndicator({
    super.key,
     this.gradient,
    required this.value, required this.colorStatus,  this.width=325 ,this.height=4, this.color
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: colorStatus, // Background color
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        Container(
          height: 4.sp,
          width: MediaQuery.of(context).size.width * value, // Width adjusts according to progress
          decoration: BoxDecoration(
            color: color,
            gradient: gradient,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ],
    );
  }
}
