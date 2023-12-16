import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RiwayatTransaksiScreen extends StatefulWidget {
  const RiwayatTransaksiScreen({Key? key}) : super(key: key);

  @override
  State<RiwayatTransaksiScreen> createState() => _RiwayatTransaksiScreenState();
}

void _copyToClipboard(BuildContext context, String text) {
  Clipboard.setData(ClipboardData(text: text));
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.grey,
      content: Container(
        height: 18,
        alignment: Alignment.center,
        child: const Text(
          'Id Transaksi berhasil di salin',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14),
        ),
      ),
    ),
  );
}

class _RiwayatTransaksiScreenState extends State<RiwayatTransaksiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Riwayat Transaksi',
          style: ThemeTextStyle().titleMedium.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
        ),
        backgroundColor: ThemeColor().primaryFrame,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Text(
                'Transaksi Pembayaran',
                style: ThemeTextStyle().titleMedium.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/all_icon/pending.png",
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Pending',
                    style: ThemeTextStyle().titleMedium.copyWith(
                          fontWeight: FontWeight.w500,
                          color: ThemeColor().starYellow,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                '16 Oktober 2023, 18:30',
                style: ThemeTextStyle().bodyMedium.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Metode Pembayaran',
                    style: ThemeTextStyle().bodyMedium.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'BCA Virtual Account',
                        style: ThemeTextStyle().titleSmall,
                      ),
                      Image.asset(
                        'assets/images/bca.png',
                        width: 40,
                        height: 40,
                      ),
                    ],
                  ),
                  const SizedBox(height: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Id Transaksi',
                        style: ThemeTextStyle().titleSmall,
                      ),
                      Row(
                        children: [
                          Text('9106 ', style: ThemeTextStyle().titleSmall),
                          InkWell(
                            onTap: () {
                              _copyToClipboard(context, '9106');
                            },
                            child: Text(
                              ' SALIN',
                              style: ThemeTextStyle().titleSmall.copyWith(
                                  color: ThemeColor().info,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 26),
                  Text(
                    'Konsultasi dengan',
                    style: ThemeTextStyle().bodyMedium.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Stack(
                            children: [
                              Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 23,
                                    backgroundImage:
                                        AssetImage('assets/images/doctor.png'),
                                  ),
                                  const SizedBox(width: 12),
                                  SizedBox(
                                    width: 190,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Dr. Putu Shinta Widari Tirka Sp.D.V.E",
                                          style: ThemeTextStyle()
                                              .labelMedium
                                              .copyWith(
                                                color: const Color(0xff4e4e4e),
                                              ),
                                        ),
                                        Text(
                                          "Sp. Kulit & Kelamin",
                                          style: ThemeTextStyle()
                                              .labelMedium
                                              .copyWith(
                                                color: const Color(0xff4e4e4e),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                right: 0,
                                top: 0.7,
                                child: Container(
                                  width: 58,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffFDE880),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'pending',
                                      textAlign: TextAlign.center,
                                      style: ThemeTextStyle()
                                          .labelSmall
                                          .copyWith(
                                              color: const Color(0xff4E4E4E)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              // halaman chat yang sedang berlangsung
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              fixedSize: const Size.fromWidth(175.0),
                            ).copyWith(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  return ThemeColor().primaryButton;
                                },
                              ),
                            ),
                            child: Text(
                              'Mulai Konsultasi',
                              style: ThemeTextStyle().labelLarge.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ],
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
