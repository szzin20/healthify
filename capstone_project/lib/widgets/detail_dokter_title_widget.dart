import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:flutter/material.dart';

class DetailDoctorTitleWidget extends StatelessWidget {
  final String nama;
  final String specialist;
  final String price;
  final String experience;
  const DetailDoctorTitleWidget({
    super.key,
    required this.nama,
    required this.specialist,
    required this.price,
    required this.experience,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          nama,
          style: ThemeTextStyle().headlineName,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          specialist,
          style: ThemeTextStyle().labelMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          price,
          style: ThemeTextStyle().labelLarge2,
        ),
        Row(
          children: [
            Icon(
              Icons.star,
              size: 12,
              color: ThemeColor().starYellow,
            ),
            Text(
              '4,7',
              style: ThemeTextStyle().labelSmall,
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              '(71 Ulasan)',
              style: ThemeTextStyle().labelSmall,
            ),
            const Expanded(
              child: SizedBox(),
            ),
            ImageIcon(
              const AssetImage('assets/icons/all_icon/update.png'),
              size: 24,
              color: ThemeColor().iconActive,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              experience,
              style: ThemeTextStyle().labelSmallBold,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Tentang Dokter',
          style: ThemeTextStyle().headlineMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Spesialis kulit dan kelamin berpengalaman dengan lebih dari 8 tahun pengalaman klinis, memiliki keahlian dalam mendiagnosis dan merawat berbagai kondisi kulit serta masalah kesehatan kelamin.',
          style: ThemeTextStyle().bodySmall,
        ),
      ],
    );
  }
}
