import 'package:capstone_project/constants/text_theme.dart';
import 'package:flutter/material.dart';

class DetailDoctorInfoWidget extends StatelessWidget {
  final String str;
  final String pendidikan;
  const DetailDoctorInfoWidget(
      {super.key, required this.str, required this.pendidikan});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            const Icon(
              Icons.star,
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nomor STR',
                  style: ThemeTextStyle().labelMedium,
                ),
                Text(
                  str,
                  style: ThemeTextStyle().bodySmall,
                ),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            const Icon(
              Icons.map,
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Lokasi Praktik',
                  style: ThemeTextStyle().labelMedium,
                ),
                Text(
                  'RSUD H. Soewondo Kendal, Jawa Tengah',
                  style: ThemeTextStyle().bodySmall,
                ),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Column(
              children: [
                SizedBox(
                  height: 4,
                ),
                Icon(
                  Icons.school,
                ),
              ],
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Riwayat Pendidikan',
                  style: ThemeTextStyle().labelMedium,
                ),
                Text(
                  pendidikan,
                  style: ThemeTextStyle().bodySmall,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
