import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:green_alert/models/graphpoint_model.dart';
import 'package:green_alert/shared/themes.dart';
import 'package:green_alert/widgets/chart_data.dart';

class HumidityPage extends StatelessWidget {
  const HumidityPage({super.key});

  List<LineChartBarData> get secondLineBarsData => [
        secondLineBarsData1,
        secondLineBarsData2,
        secondLineBarsData3,
      ];

  LineChartBarData get secondLineBarsData1 => LineChartBarData(
        isCurved: true,
        curveSmoothness: 0,
        barWidth: 4,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(
            show: true, color: const Color(0xFFA9907E).withOpacity(.2)),
        color: const Color(0xFFA9907E),
        spots: const [
          FlSpot(0, 0),
          FlSpot(0, 1),
          FlSpot(1, 2),
          FlSpot(2, 2),
          FlSpot(3, 3),
          FlSpot(5, 2),
        ],
      );

  LineChartBarData get secondLineBarsData2 => LineChartBarData(
        isCurved: true,
        curveSmoothness: 0,
        barWidth: 4,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        color: const Color(0xFFCD5C08),
        spots: const [
          FlSpot(0, 2),
          FlSpot(1, 2),
          FlSpot(2, 1),
          FlSpot(3, 1),
          FlSpot(4, 4),
          FlSpot(5, 2),
        ],
      );

  LineChartBarData get secondLineBarsData3 => LineChartBarData(
        isCurved: true,
        curveSmoothness: 0,
        barWidth: 4,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        color: const Color(0xFF5F6F52),
        spots: const [
          FlSpot(0, 4),
          FlSpot(1, 3),
          FlSpot(2, 3),
          FlSpot(2, 4),
          FlSpot(4, 3),
          FlSpot(5, 5),
        ],
      );

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
            color: white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: const Offset(0.0, 4.0),
                blurRadius: 4.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ],
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        width: double.infinity,
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                  size: 28,
                )),
            const SizedBox(
              width: 48,
            ),
            Text(
              "Kelembapan Tanah",
              style: purpleText.copyWith(fontSize: 20, fontWeight: bold),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          header(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
            child: Text(
              "Statistik Kelembapan tanah 7 hari terakhir",
              style: blueText.copyWith(fontSize: 16, fontWeight: semibold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 32),
            child: ChartData(graphPoints),
          )
        ],
      ),
    );
  }
}
