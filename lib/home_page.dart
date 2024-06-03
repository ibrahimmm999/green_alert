import 'package:flutter/material.dart';
import 'package:green_alert/kondisi_tanaman.dart';
import 'package:green_alert/shared/themes.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(90),
                    child: Image.asset(
                      'assets/avatar.png',
                      fit: BoxFit.cover,
                      height: 48,
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
                  icon: Icon(Icons.notifications_none_rounded),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.settings_outlined),
                  onPressed: () {},
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
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => KondisiTanamanPage()));
        },
        child: Padding(
          padding:
              const EdgeInsets.only(top: 24, bottom: 36, left: 24, right: 24),
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
                Text(
                  "Lihat Detail",
                  style: greenText.copyWith(fontWeight: bold),
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
                  "45%",
                  style: blackText.copyWith(fontSize: 20, fontWeight: bold),
                )
              ]),
              backgroundColor: white2,
              progressColor: blue,
              percent: 0.45,
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
                Text(
                  "Lihat Detail",
                  style: greenText.copyWith(fontWeight: bold),
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
                  "3.1",
                  style: blackText.copyWith(fontSize: 20, fontWeight: bold),
                )
              ]),
              backgroundColor: white2,
              progressColor: yellow,
              percent: 0.31,
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
                Text(
                  "Lihat Detail",
                  style: greenText.copyWith(fontWeight: bold),
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
                  "6.6",
                  style: blackText.copyWith(fontSize: 20, fontWeight: bold),
                )
              ]),
              backgroundColor: white2,
              progressColor: brown,
              percent: 0.66,
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
