import 'package:flutter/material.dart';
import 'package:green_alert/shared/themes.dart';

class HumidityContent extends StatelessWidget {
  const HumidityContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "45%",
            style: blackText.copyWith(fontWeight: bold, fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Status : ",
            style: blackText.copyWith(fontWeight: bold),
          ),
          Text(
            "Kelembapan tanah saat ini berada di batas bawah kisaran normal (40% - 60%). Ini menunjukkan bahwa tanah mulai mengering dan memerlukan perhatian segera.",
            // textAlign: TextAlign.justify,
            style: blackText,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            "Rekomendasi : ",
            style: blackText.copyWith(fontWeight: bold),
          ),
          Text(
            "Lakukan penyiraman untuk meningkatkan kelembapan tanah. Pastikan tanah mendapatkan air yang cukup untuk mencapai setidaknya 50%, agar kondisi tetap optimal untuk tanaman.",
            // textAlign: TextAlign.justify,
            style: blackText,
          ),
        ],
      ),
    );
  }
}
