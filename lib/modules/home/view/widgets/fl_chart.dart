import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fitness_tracking_app/utils/constant/colors.dart';

class CustomChart extends StatefulWidget {
  @override
  _CustomChartState createState() => _CustomChartState();
}

class _CustomChartState extends State<CustomChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late List<FlSpot> spots;
  final double minX = 0.0;
  final double maxX = 6.0;

  @override
  void initState() {
    super.initState();

    // Initialize the spots with default values
    spots = [
      FlSpot(0, 2.2),
      FlSpot(1, 2.2),
      FlSpot(2, 3.2),
      FlSpot(3, 2.8),
      FlSpot(4, 2),
      FlSpot(5, 2.2),
      FlSpot(6, 1.8),
    ];

    // Set up the animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6), // Longer duration for smooth animation
    )..addListener(() {
      setState(() {
        // Update the chart values during the animation
        double t = _animationController.value;
        double translationX = maxX * t;

        spots = [
          FlSpot(minX + translationX, 2.2),
          FlSpot(1 + translationX, 2.2),
          FlSpot(2 + translationX, 3.2),
          FlSpot(3 + translationX, 2.8),
          FlSpot(4 + translationX, 2),
          FlSpot(5 + translationX, 2.2),
          FlSpot(maxX + translationX, 1.8),
        ];
      });
    });

    // Start the animation
    _animationController.repeat(reverse: false);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: 170.w,
      child: LineChart(
        LineChartData(
          minX: minX,
          maxX: maxX + 0.0, // Adjust to ensure smooth transition
          minY: 0,
          maxY: 4,
          borderData: FlBorderData(show: false),
          gridData: const FlGridData(show: false),
          titlesData: const FlTitlesData(show: false),
          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              color: Colors.transparent,
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [const Color(0xFFF97316).withOpacity(0.5), Colors.transparent],
                  stops: const [0.5, 1.0],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              spots: spots,
              barWidth: 2,
              dotData: FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
