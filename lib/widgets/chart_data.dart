import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:green_alert/models/graphpoint_model.dart';
import 'package:green_alert/shared/themes.dart';
import 'package:intl/intl.dart';

class ChartData extends StatelessWidget {
  final List<GraphPoint> points;
  const ChartData(this.points, {super.key, required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final last7Days =
        List.generate(7, (index) => now.subtract(Duration(days: 6 - index)))
            .toList(); // Ensure dates are in correct order
    final formattedDates =
        last7Days.map((date) => DateFormat('dd/MM').format(date)).toList();

    return AspectRatio(
      aspectRatio: 1.6,
      child: LineChart(LineChartData(
          titlesData: FlTitlesData(
              topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  int index = value.toInt();
                  if (index >= 0 && index < formattedDates.length) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 28),
                      child: Text(formattedDates[index],
                          style: blackText.copyWith(
                              fontSize: 10, fontWeight: bold)),
                    );
                  }
                  return const Text('');
                },
                reservedSize: 40,
              ))),
          lineTouchData: const LineTouchData(
            enabled: false,
          ),
          borderData: FlBorderData(show: false),
          gridData: FlGridData(
            getDrawingHorizontalLine: (value) {
              return FlLine(
                  color: Colors.black.withOpacity(0.1),
                  dashArray: null,
                  strokeWidth: 1);
            },
            show: true,
            drawVerticalLine: false,
            horizontalInterval: 1,
          ),
          lineBarsData: [
            LineChartBarData(
                color: color,
                spots: points.map((e) => FlSpot(e.x, e.y)).toList(),
                isCurved: false,
                dotData: const FlDotData(show: true))
          ])),
    );
  }
}
