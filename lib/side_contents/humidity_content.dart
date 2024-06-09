import 'package:flutter/material.dart';
import 'package:green_alert/shared/themes.dart';

class HumidityContent extends StatelessWidget {
  const HumidityContent({super.key, required this.humidity});
  final String humidity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$humidity %",
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
            double.parse(humidity) < 30
                ? "Kelembapan tanah sangat rendah (< 30%). Ini menunjukkan bahwa tanah sangat kering dan membutuhkan perhatian segera."
                : double.parse(humidity) <= 40
                    ? "Kelembapan tanah berada di bawah kisaran normal (30% - 40%). Tanah mulai mengering dan membutuhkan perhatian."
                    : double.parse(humidity) <= 60 &&
                            double.parse(humidity) >= 40
                        ? " Kelembapan tanah dalam kisaran normal (40% - 60%). Ini menunjukkan kondisi tanah yang baik untuk pertumbuhan tanaman."
                        : "Kelembapan tanah di atas kisaran normal (> 60%). Ini menunjukkan bahwa tanah terlalu basah.",
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
            double.parse(humidity) < 30
                ? "Segera lakukan penyiraman untuk meningkatkan kelembapan tanah. Pastikan tanah mendapatkan air yang cukup untuk mencapai setidaknya 50%."
                : double.parse(humidity) <= 40
                    ? "Lakukan penyiraman untuk meningkatkan kelembapan tanah. Pastikan tanah mendapatkan air yang cukup untuk mencapai setidaknya 50%."
                    : double.parse(humidity) <= 60 &&
                            double.parse(humidity) > 40
                        ? "Tidak diperlukan tindakan khusus. Pertahankan penyiraman rutin untuk menjaga kelembapan tanah."
                        : "Kurangi frekuensi penyiraman untuk mencegah kelembapan berlebihan yang dapat menyebabkan penyakit tanaman.",
            style: blackText,
          ),
        ],
      ),
    );
  }
}
