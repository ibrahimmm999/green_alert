import 'package:flutter/material.dart';
import 'package:green_alert/shared/themes.dart';

class UvContent extends StatelessWidget {
  const UvContent({super.key, required this.uv});
  final String uv;

  @override
  Widget build(BuildContext context) {
    double newUv = double.parse(uv) / 10;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            newUv.toString(),
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
            newUv < 1
                ? "Indeks UV sangat rendah (< 1). Ini menunjukkan kondisi yang kurang optimal untuk fotosintesis."
                : newUv <= 8
                    ? "Indeks UV dalam kisaran normal (1 - 8). Ini menunjukkan kondisi yang baik untuk fotosintesis."
                    : "Indeks UV tinggi (> 8). Ini menunjukkan kondisi yang mungkin terlalu terik untuk beberapa tanaman.",
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
            newUv < 1
                ? "Pastikan tanaman mendapatkan paparan cahaya yang cukup sepanjang hari."
                : newUv <= 8
                    ? "Tidak diperlukan tindakan khusus. Pertahankan paparan cahaya yang cukup untuk tanaman."
                    : "Berikan naungan atau kurangi paparan sinar matahari langsung selama periode terik untuk melindungi tanaman dari kerusakan.",
            // textAlign: TextAlign.justify,
            style: blackText,
          ),
        ],
      ),
    );
  }
}
