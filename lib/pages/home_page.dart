import 'package:flutter/material.dart';
import 'package:green_alert/pages/humidity_page.dart';
import 'package:green_alert/pages/kondisi_tanaman.dart';
import 'package:green_alert/pages/ph_page.dart';
import 'package:green_alert/pages/profile_page.dart';
import 'package:green_alert/pages/settings_page.dart';
import 'package:green_alert/providers/data_provider.dart';
import 'package:green_alert/shared/themes.dart';
import 'package:green_alert/pages/uv_page.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    DataProvider dataProvider = Provider.of<DataProvider>(context);
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfilePage())),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(90),
                      child: Image.asset(
                        'assets/avatar.png',
                        fit: BoxFit.cover,
                        height: 48,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "WELCOME",
                      style: greenText.copyWith(
                          fontSize: 14, fontWeight: semibold),
                    ),
                    Text(
                      "Olivia",
                      style: greenText.copyWith(fontWeight: bold, fontSize: 18),
                    )
                  ],
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.settings_outlined),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingsPage()));
                  },
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget sehat() {
      return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const KondisiTanamanPage()));
        },
        child: Padding(
          padding:
              const EdgeInsets.only(top: 24, bottom: 36, left: 24, right: 24),
          child: Container(
            color: white,
            width: double.infinity,
            child: Row(
              children: [
                Image.asset(
                  'assets/daun.png',
                  height: 70,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sehat",
                      style: greenText.copyWith(fontSize: 18, fontWeight: bold),
                    ),
                    Text(
                      "Kondisi tanaman saat ini optimal",
                      style: blackText.copyWith(fontWeight: medium),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }

    Widget humidity() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Kelembaban Tanah",
                  style: blackText.copyWith(fontSize: 20, fontWeight: bold),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HumidityPage()));
                  },
                  child: Text(
                    "Lihat Detail",
                    style: greenText.copyWith(fontWeight: bold),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            CircularPercentIndicator(
              lineWidth: 24,
              circularStrokeCap: CircularStrokeCap.round,
              animation: true,
              radius: 80,
              center:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  "${dataProvider.listData.last['humidity']} %",
                  style: blackText.copyWith(fontSize: 20, fontWeight: bold),
                )
              ]),
              backgroundColor: white2,
              progressColor: blue,
              percent:
                  double.parse(dataProvider.listData.last['humidity']) / 100,
            )
          ],
        ),
      );
    }

    Widget uv() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Index UV",
                  style: blackText.copyWith(fontSize: 20, fontWeight: bold),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UvPage()));
                  },
                  child: Text(
                    "Lihat Detail",
                    style: greenText.copyWith(fontWeight: bold),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            CircularPercentIndicator(
              lineWidth: 24,
              circularStrokeCap: CircularStrokeCap.round,
              animation: true,
              radius: 80,
              center:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  (double.parse(dataProvider.listData.last['uv']) / 10)
                      .toString(),
                  style: blackText.copyWith(fontSize: 20, fontWeight: bold),
                )
              ]),
              backgroundColor: white2,
              progressColor: yellow,
              percent: double.parse(dataProvider.listData.last['uv']) / 100,
            )
          ],
        ),
      );
    }

    Widget ph() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "pH Tanah",
                  style: blackText.copyWith(fontSize: 20, fontWeight: bold),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PhPage()));
                  },
                  child: Text(
                    "Lihat Detail",
                    style: greenText.copyWith(fontWeight: bold),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            CircularPercentIndicator(
              lineWidth: 24,
              circularStrokeCap: CircularStrokeCap.round,
              animation: true,
              radius: 80,
              center:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  "${dataProvider.listData.last['ph']}",
                  style: blackText.copyWith(fontSize: 20, fontWeight: bold),
                )
              ]),
              backgroundColor: white2,
              progressColor: brown,
              percent: double.parse(dataProvider.listData.last['ph']) / 14,
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: ListView(
          children: [
            header(),
            sehat(),
            humidity(),
            uv(),
            ph(),
            const SizedBox(
              height: 32,
            )
          ],
        ),
      ),
    );
  }
}
