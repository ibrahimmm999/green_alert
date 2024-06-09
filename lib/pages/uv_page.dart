import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:green_alert/models/graphpoint_model.dart';
import 'package:green_alert/shared/themes.dart';
import 'package:green_alert/widgets/chart_data.dart';
import 'package:intl/intl.dart';

class UvPage extends StatelessWidget {
  const UvPage({super.key});

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
    final now = DateTime.now();
    final last7Days =
        List.generate(7, (index) => now.subtract(Duration(days: 6 - index)))
            .toList();
    final formattedDates = last7Days
        .map((date) => DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(date));
    final reversedDates = formattedDates.toList().reversed;
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
              width: 88,
            ),
            Text(
              "Index UV",
              style: blackText.copyWith(fontSize: 20, fontWeight: bold),
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
              "Statistik Index UV 7 hari terakhir",
              style: yellowText.copyWith(fontSize: 16, fontWeight: semibold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 32, bottom: 12),
            child: ChartData(
              graphPoints,
              color: yellow,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Data",
                  style: yellowText.copyWith(fontSize: 20, fontWeight: bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: reversedDates
                      .map((e) => Text(
                            e.toString(),
                            style: blackText.copyWith(fontWeight: bold),
                          ))
                      .toList(),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "5.0",
                      style: yellowText.copyWith(fontWeight: bold),
                    ),
                    Text("9.6", style: yellowText.copyWith(fontWeight: bold)),
                    Text("8.0", style: yellowText.copyWith(fontWeight: bold)),
                    Text("6.1", style: yellowText.copyWith(fontWeight: bold)),
                    Text("5.2", style: yellowText.copyWith(fontWeight: bold)),
                    Text("2.1", style: yellowText.copyWith(fontWeight: bold)),
                    Text("5.0", style: yellowText.copyWith(fontWeight: bold)),
                  ],
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
                horizontal: defaultMargin - 10, vertical: 12),
            height: 1,
            color: yellow,
          ),
        ],
      ),
    );
  }
}
