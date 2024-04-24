

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/responsive.dart';
import '../../../config/theme/app_color.dart';

Widget _bottomTitleWidgets(double value, TitleMeta meta) {
  final style = GoogleFonts.readexPro(
    fontSize: Responsive.isMobile() ? 12.sp : 14.sp,
  );
  Widget text;
  switch (value.toInt()) {
    case 1:
      text = Text('10:00', style: style);
      break;
    case 3:
      text = Text('12:00', style: style);
      break;
    case 5:
      text = Text('14:00', style: style);
      break;
    case 7:
      text = Text('16:00', style: style);
      break;
    case 9:
      text = Text('18:00', style: style);
      break;
    default:
      text = Text('', style: style);
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}

LineChartData portfolioBalanceChartData() {
  List<Color> gradientColors = [
    Colors.blueAccent,
    primaryColor,
  ];
  return LineChartData(
    gridData: const FlGridData(
      show: false,
    ),
    lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
            getTooltipColor: (touchedSpot) => Colors.white)),
    titlesData: const FlTitlesData(
      show: true,
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
        ),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          interval: 1,
          getTitlesWidget: _bottomTitleWidgets,
        ),
      ),
      leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
    ),
    borderData: FlBorderData(
      show: true,
      border: const Border(bottom: BorderSide(color: primaryColor)),
    ),
    minX: 0,
    maxX: 12,
    minY: 0,
    maxY: 5,
    lineBarsData: [
      LineChartBarData(
        color: primaryColor,
        spots: const [
          FlSpot(0, 2),
          FlSpot(1.6, 2),
          FlSpot(3.3, 1),
          FlSpot(5, 4),
          FlSpot(6, 4),
          FlSpot(7, 4.25),
          FlSpot(7.5, 2),
          FlSpot(8.2, 2.5),
          FlSpot(8.8, 1.5),
          FlSpot(9.5, 4.3),
          FlSpot(10.5, 2.8),
          FlSpot(11, 4.3),
        ],
        isCurved: true,
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: const FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            stops: const [0.2, 0.5],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ),
    ],
  );
}
