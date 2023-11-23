import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyPieChart extends StatelessWidget {
  const MyPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(
            value:20,
            color: Color(0xffB2E9A5),

          ),
          PieChartSectionData(
            value:30,
            color: Color(0xff79c38e),

          ),
          PieChartSectionData(
            value:20,
            color: Color(0xff9AA7B1),

          ),
          PieChartSectionData(
            value:30,
            color: Color(0xff89E1D1),

          ),
        ],
      ),
    );
  }
}