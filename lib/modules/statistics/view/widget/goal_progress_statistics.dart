import 'package:fitness_tracking_app/utils/theme/custom_themes/text_themes.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoalProgress extends StatelessWidget {
  const GoalProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 316.h,
      width: 390.w,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Goal Progress',
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                TimePeriodDropdown(),
                // DropdownButton<String>(
                //   underline: SizedBox(),
                //   icon: Icon(Icons.arrow_drop_down),
                //   items: <String>['See All'].map((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //       child: Text(value,
                //           style: TextStyle(
                //               fontSize: 12.sp, color: Colors.orange)),
                //     );
                //   }).toList(),
                //   onChanged: (_) {},
                // ),
              ],
            ),
            SizedBox(height: 16.h),
            // Bar chart
            Expanded(
              child: BarChart(
                BarChartData(
                  maxY: 100,
                  barGroups: [
                    makeGroupData(0, 50, 60, 80),
                    makeGroupData(1, 30, 70, 40),
                    makeGroupData(2, 40, 50, 70),
                    makeGroupData(3, 20, 80, 30),
                    makeGroupData(4, 50, 60, 90),
                    makeGroupData(5, 40, 30, 60),
                    makeGroupData(6, 70, 40, 60),
                  ],
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          const style = TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          );
                          switch (value.toInt()) {
                            case 0:
                              return Text('Mon', style: style);
                            case 1:
                              return Text('Tue', style: style);
                            case 2:
                              return Text('Wed', style: style);
                            case 3:
                              return Text('Thu', style: style);
                            case 4:
                              return Text('Fri', style: style);
                            case 5:
                              return Text('Sat', style: style);
                            case 6:
                              return Text('Sun', style: style);
                            default:
                              return Text('');
                          }
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 20,
                        getTitlesWidget: (value, meta) {
                          return Text('${value.toInt()}%',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10.sp,
                              ));
                        },
                      ),
                    ),
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  gridData: FlGridData(
                    show: true,
                    horizontalInterval: 20,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: Colors.grey.withOpacity(0.5),
                        strokeWidth: 1,
                      );
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  barTouchData: BarTouchData(enabled: false),
                  alignment: BarChartAlignment.spaceBetween,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            // Legend
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLegendItem(Colors.cyan, 'Workout'),
                _buildLegendItem(Colors.orange, 'Calories'),
                _buildLegendItem(Colors.purple, 'Steps'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2, double y3) {
    return BarChartGroupData(
      x: x,
      barsSpace: 4,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: Colors.cyan,
          width: 6,
        ),
        BarChartRodData(
          toY: y2,
          color: Colors.orange,
          width: 6,
        ),
        BarChartRodData(
          toY: y3,
          color: Colors.purple,
          width: 6,
        ),
      ],
    );
  }

  Widget _buildLegendItem(Color color, String text) {
    return Row(
      children: [
        CircleAvatar(
          radius: 5.sp,
          backgroundColor: color,
        ),
        SizedBox(width: 4.w),
        Text(
          text,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(width: 16.w),
      ],
    );
  }
}



class TimePeriodDropdown extends StatefulWidget {
  const TimePeriodDropdown({super.key});

  @override
  _TimePeriodDropdownState createState() => _TimePeriodDropdownState();
}

class _TimePeriodDropdownState extends State<TimePeriodDropdown> {
  String selectedPeriod = 'Weekly'; // Initial value

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.h,width: 93.w,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffDADADA)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: selectedPeriod,
            items: <String>['Daily', 'Weekly', 'Monthly', 'Yearly']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: AppTextTheme.myAppText12(Color(0xff494949)),
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedPeriod = newValue!;
              });
            },
            icon: Icon(
              Icons.keyboard_arrow_down_sharp,
              color: Colors.black,size: 12.sp,
            ),
          ),
        ),
      ),
    );
  }
}
