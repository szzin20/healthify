import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/models/riwayat_transaksi_model.dart';
import 'package:capstone_project/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class RiwayatTransaksiScreen extends StatefulWidget {
  final RiwayatTransaksiModel riwayatTransaksi;
  const RiwayatTransaksiScreen({super.key, required this.riwayatTransaksi});

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
    var riwayatTransaksiDetail = widget.riwayatTransaksi.results;
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
                    riwayatTransaksiDetail.paymentStatus == "pending"
                        ? "assets/icons/all_icon/pending.png"
                        : "assets/icons/all_icon/check_success.png",
                    height: 18,
                    width: 18,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    riwayatTransaksiDetail.paymentStatus.capitalize(),
                    style: ThemeTextStyle().titleMedium.copyWith(
                          fontWeight: FontWeight.w500,
                          color:
                              riwayatTransaksiDetail.paymentStatus == "pending"
                                  ? ThemeColor().starYellow
                                  : const Color(0xff008772),
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                DateFormat('d MMMM y, HH:mm', 'id_ID').format(
                    riwayatTransaksiDetail.createdAt
                        .add(const Duration(hours: 7))),
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
                        riwayatTransaksiDetail.paymentMethod.capitalize(),
                        style: ThemeTextStyle().titleSmall,
                      ),
                      Image.asset(
                        riwayatTransaksiDetail.paymentMethod
                                .toLowerCase()
                                .contains('bca')
                            ? 'assets/images/bca.png'
                            : riwayatTransaksiDetail.paymentMethod
                                    .toLowerCase()
                                    .contains('bri')
                                ? 'assets/images/bri.png'
                                : 'assets/images/bni.png',
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
                          Text('${riwayatTransaksiDetail.id} ',
                              style: ThemeTextStyle().titleSmall),
                          InkWell(
                            onTap: () {
                              _copyToClipboard(
                                  context, '${riwayatTransaksiDetail.id}');
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
                                          riwayatTransaksiDetail.fullname,
                                          style: ThemeTextStyle()
                                              .labelMedium
                                              .copyWith(
                                                color: const Color(0xff4e4e4e),
                                              ),
                                        ),
                                        Text(
                                          riwayatTransaksiDetail.specialist,
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
                                    color:
                                        riwayatTransaksiDetail.paymentStatus ==
                                                'pending'
                                            ? const Color(0xffFDE880)
                                            : const Color(0xFF199E50),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Text(
                                      riwayatTransaksiDetail.paymentStatus,
                                      textAlign: TextAlign.center,
                                      style: ThemeTextStyle()
                                          .labelSmall
                                          .copyWith(
                                              color: riwayatTransaksiDetail
                                                          .paymentStatus ==
                                                      'pending'
                                                  ? const Color(0xff4E4E4E)
                                                  : const Color(0xFFECECEC)),
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