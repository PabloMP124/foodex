import "package:fl_chart/fl_chart.dart";
import "package:flutter/material.dart";
import "package:foodex/components/bargraph/bar_data.dart";

class MyBarGraph extends StatelessWidget {
  final List weeklySummary;
  const MyBarGraph({
    super.key,
    required this.weeklySummary,
  });

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      monAmount: weeklySummary[0],
      tweAmount: weeklySummary[1],
      wedAmount: weeklySummary[2],
      thuAmount: weeklySummary[3],
      friAmount: weeklySummary[4],
    );
    myBarData.initializeBarData();

    return BarChart(BarChartData(
      maxY: 100,
      minY: 0,
      gridData: FlGridData(show: false),
      borderData: FlBorderData(show: false),
      titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: getBottomTitles,
            ),
          ),
      ),
      barGroups: myBarData.barData
          .map(
            (data) => BarChartGroupData(
              x: data.x,
              barRods: [
                BarChartRodData(
                  toY: data.y,
                  color: Color(0xff79c38e),
                  width: 25,
                  borderRadius: BorderRadius.circular(4),
                  backDrawRodData: BackgroundBarChartRodData(
                    show: true,
                    toY: 100,
                    color: Colors.white,
                  )
                ),
              ],
            ),
          )
          .toList(),
    ));
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff2B2C40),
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );

  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text("Lu", style: style);
      break;
    case 1:
      text = const Text("Ma", style: style);
      break;
    case 2:
      text = const Text("Mi", style: style);
      break;
    case 3:
      text = const Text("Ju", style: style);
      break;
    case 4:
      text = const Text("Vi", style: style);
      break;
    default:
      text = const Text("", style: style);
      break;
  }

  return SideTitleWidget(child: text, axisSide: meta.axisSide);
}
