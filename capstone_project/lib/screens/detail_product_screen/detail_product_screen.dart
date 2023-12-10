import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/widgets/button_widget.dart';
import 'package:capstone_project/widgets/keranjang_button_widget.dart';
import 'package:flutter/material.dart';

class DetailProductScreen extends StatelessWidget {
  const DetailProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColor().primaryFrame,
        title: Text(
          'Keranjang',
          style: TextStyle(
            color: ThemeColor().textChat,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart_checkout,
              color: ThemeColor().textChat,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 18,
            left: 16,
            right: 16,
            bottom: 18,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(
                    height: 146,
                    width: 112,
                    child: Image(
                      image: AssetImage(
                        'assets/images/doctor.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 22,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'OB Combi Antitussive Rasa Menthol 60 ml',
                          style: ThemeTextStyle().titleMedium,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Rp. 18.000',
                          style: ThemeTextStyle().titleSmall,
                        ),
                        Text(
                          'Per botol',
                          style: ThemeTextStyle().bodyMedium,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10.0,
                            bottom: 10.0,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.share,
                                size: 20,
                                color: ThemeColor().primaryFrame,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                'Bagikan Tautan',
                                style: ThemeTextStyle().bodySmallShare,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Deskripsi',
                style: ThemeTextStyle().labelLarge2,
              ),
              Text(
                'OB COMBI ANTITUSSIVE RASA MENTHOL mengandung dextrometorphan Hbr dan Dipenhydramine Hcl. Obat ini digunakan untuk meringankan batuk tidak berdahak disertai alergi',
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
                'Komposisi',
                style: ThemeTextStyle().labelLarge2,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Dextromethorphan HBr 12,5 mg ; Diphenhydramine HCl 7,5 mg',
                style: ThemeTextStyle().bodySmall,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Per Botol',
                style: ThemeTextStyle().labelLarge2,
              ),
              Text(
                '60 ml',
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
                'BPOM: DBL2044401337A1',
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
              ),
              const SizedBox(
                height: 56,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: OutlineButtonWidget(
                        title: 'Tambah',
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ButtonWidget(
                        title: 'Beli Sekarang',
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
