import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:walktron/widgets/widgets.dart';

class ActivityView extends StatelessWidget {
  final List<int> weeklyData = [10, 12, 4, 16, 20, 16, 14];
  final List<int> hourlyData = [
    5,
    7,
    10,
    11,
    17,
    18,
    14,
    15,
    12,
    11,
    8,
    7,
    11,
    19,
    6,
    8,
    10,
    12,
    18,
    16,
    14,
    17,
    11,
    13
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // HeadingWidget(text1: 'EXERCISE', text2: '',),
          // ActivityPieChart(),
          // HeadingWidget(text1: 'GOAL COMPLIANCE', text2: '',),
          WeeklyBarChartWidget(
            weeklyData: weeklyData,
            maximumValueOnYAxis: 22,
          ),
          // HeadingWidget(text1: 'EXERCISE AVG', text2: '',),
          HourlyBarChartWidget(
            hourlyData: hourlyData,
            maximumValueOnYAxis: 22,
          ),
        ],
      ),
    );
  }
}
