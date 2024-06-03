import 'package:flutter/material.dart';
import 'package:green_alert/shared/themes.dart';

class UvContent extends StatelessWidget {
  const UvContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "3.1",
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
            "cahaya UV berada dalam kisaran normal (0-11). Nilai 3.1 menunjukkan kondisi yang baik untuk fotosintesis.",
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
            "Tidak diperlukan tindakan khusus. Pastikan tanaman tetap mendapatkan paparan cahaya yang cukup sepanjang hari.",
            // textAlign: TextAlign.justify,
            style: blackText,
          ),
        ],
      ),
    );
  }
}
