import 'package:capstone_project/constants/text_theme.dart';
import 'package:flutter/material.dart';

class DetailProductDescWidget extends StatelessWidget {
  final String desc;
  final String kode;
  final String type;
  final String category;
  final String price;
  const DetailProductDescWidget({
    super.key,
    required this.desc,
    required this.kode,
    required this.type,
    required this.category,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Deskripsi',
          style: ThemeTextStyle().labelLarge2,
        ),
        Text(
          desc,
          style: ThemeTextStyle().bodySmall,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Golongan Produk',
          style: ThemeTextStyle().labelLarge2,
        ),
        Text(
          'Obat Bebas (Hijau)',
          style: ThemeTextStyle().bodySmall,
        ),
        const SizedBox(
          height: 32,
        ),
        Text(
          'Kategori',
          style: ThemeTextStyle().labelLarge2,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          category,
          style: ThemeTextStyle().bodySmall,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          'Per $type',
          style: ThemeTextStyle().labelLarge2,
        ),
        Text(
          price,
          style: ThemeTextStyle().bodySmall,
        ),
        const SizedBox(
          height: 32,
        ),
        Text(
          'Peringatan',
          style: ThemeTextStyle().labelLarge2,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          'No. Registrasi',
          style: ThemeTextStyle().labelLarge2,
        ),
        Text(
          'BPOM: $kode',
          style: ThemeTextStyle().bodySmall,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          'Kemasan Obat',
          style: ThemeTextStyle().labelLarge2,
        ),
        Text(
          'Pemakian 3 bulan setelah kemasan di buka',
          style: ThemeTextStyle().bodySmall,
        )
      ],
    );
  }
}
