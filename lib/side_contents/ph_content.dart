import 'package:flutter/material.dart';
import 'package:green_alert/shared/themes.dart';

class PhContent extends StatelessWidget {
  const PhContent({super.key, required this.ph});
  final String ph;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ph,
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
            double.parse(ph) < 5.5
                ? "Nilai pH tanah sangat rendah (< 5.5). Ini menunjukkan kondisi tanah yang sangat asam."
                : double.parse(ph) <= 6
                    ? "Nilai pH tanah rendah (5.5 - 6.0). Tanah sedikit asam."
                    : double.parse(ph) <= 7 && double.parse(ph) > 6
                        ? "Nilai pH tanah dalam kisaran normal (6.0 - 7.0). Ini menunjukkan kondisi tanah yang baik untuk pertumbuhan tanaman."
                        : "Nilai pH tanah tinggi (> 7.0). Tanah sedikit alkalin.",
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
            double.parse(ph) < 5.5
                ? "Tambahkan kapur pertanian untuk meningkatkan pH tanah dan mencapai kisaran optimal."
                : double.parse(ph) <= 6
                    ? "Monitor pH tanah dan tambahkan kapur pertanian jika diperlukan."
                    : double.parse(ph) <= 7 && double.parse(ph) > 6
                        ? "Tidak diperlukan tindakan khusus. Pertahankan pemantauan rutin untuk memastikan stabilitas pH tanah."
                        : "Tambahkan sulfur pertanian untuk menurunkan pH tanah dan mencapai kisaran optimal.",
            // textAlign: TextAlign.justify,
            style: blackText,
          ),
        ],
      ),
    );
  }
}
