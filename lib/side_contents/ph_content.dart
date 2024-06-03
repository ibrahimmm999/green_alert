import 'package:flutter/material.dart';
import 'package:green_alert/shared/themes.dart';

class PhContent extends StatelessWidget {
  const PhContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "6.6",
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
            "Nilai pH tanah berada dalam kisaran normal (5.5 - 7.5) dan optimal (6.0 - 7.0). Peningkatan kecil ke 6.6 tidak menimbulkan kekhawatiran dan tetap dalam batas yang baik.",
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
            "Tidak diperlukan tindakan khusus. Pertahankan pemantauan rutin untuk memastikan stabilitas pH tanah.",
            // textAlign: TextAlign.justify,
            style: blackText,
          ),
        ],
      ),
    );
  }
}
