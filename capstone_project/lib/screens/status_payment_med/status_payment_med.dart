import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/models/paymed_model.dart';
import 'package:capstone_project/provider/status_payment_provider/status_med_payment_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class StatusPaymentMedScreen extends StatefulWidget {
  final PayMed riwayatTransaksi;
  const StatusPaymentMedScreen({super.key, required this.riwayatTransaksi});

  @override
  State<StatusPaymentMedScreen> createState() => _StatusPaymentMedScreenState();
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

class _StatusPaymentMedScreenState extends State<StatusPaymentMedScreen> {


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();


      Provider.of<StatusMedPaymentProvider>(context, listen: false)
          .fetchStatusData(widget.riwayatTransaksi.results?.id ?? 0);

  }

  @override
  Widget build(BuildContext context) {
    var medStatusTranDet = Provider.of<StatusMedPaymentProvider>(context);

    if (medStatusTranDet.statusData?.meta.success ?? false) {
      String formattedDateTime = DateFormat('dd MMM, HH:mm')
          .format(medStatusTranDet.statusData!.results.createdAt);
      return Consumer<StatusMedPaymentProvider>(
        builder: (context, medTranDet, _) {
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
                          medTranDet.statusData?.results
                                      .paymentStatus ==
                                  "pending"
                              ? "assets/icons/all_icon/pending.png"
                              : "assets/icons/all_icon/check_success.png",
                          height: 18,
                          width: 18,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          (medTranDet
                                      .statusData?.results.paymentStatus ??
                                  '')
                              .toUpperCase(),
                          style: ThemeTextStyle().titleMedium.copyWith(
                                fontWeight: FontWeight.w500,
                                color: (medTranDet.statusData?.results
                                                .paymentStatus ??
                                            '') ==
                                        "pending"
                                    ? ThemeColor().starYellow
                                    : const Color(0xff008772),
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      DateFormat('d MMMM y, HH:mm', 'id_ID').format(
                          medTranDet.statusData!.results.createdAt),
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
                              medTranDet.statusData?.results
                                      .medicineTransaction.paymentMethod ??
                                  ''.toUpperCase(),
                              style: ThemeTextStyle().titleSmall,
                            ),
                            Image.asset(
                              medTranDet.statusData!.results
                                      .medicineTransaction.paymentMethod
                                      .toLowerCase()
                                      .contains('bca')
                                  ? 'assets/images/bca.png'
                                  : medTranDet.statusData!.results
                                          .medicineTransaction.paymentMethod
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
                                Text(
                                    '${medTranDet.statusData!.results.id} ',
                                    style: ThemeTextStyle().titleSmall),
                                InkWell(
                                  onTap: () {
                                    _copyToClipboard(context,
                                        '${medTranDet.statusData!.results.id}');
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Rincian Pembayaran',
                              style: ThemeTextStyle()
                                  .titleMedium
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 12),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: medTranDet.statusData?.results
                                  .medicineTransaction.medicineDetails.length,
                              itemBuilder: (context, index) {
                                final total = (medTranDet
                                        .statusData
                                        ?.results
                                        .medicineTransaction
                                        .medicineDetails[index]
                                        .totalPriceMedicine ??
                                    0);
                                return _buildPaymentDetails(
                                  medTranDet
                                          .statusData
                                          ?.results
                                          .medicineTransaction
                                          .medicineDetails[index]
                                          .medicineId
                                          .toString() ??
                                      '',
                                  "Total: ${medTranDet.statusData?.results.medicineTransaction.medicineDetails[index].quantity ?? 0}",
                                  'Rp $total',
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 26),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Alamat Pengiriman',
                              style: ThemeTextStyle()
                                  .titleMedium
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              medTranDet.statusData?.results
                                      .medicineTransaction.name ??
                                  '',
                              style: ThemeTextStyle().titleSmall,
                            ),
                            Text(
                              medTranDet
                                      .statusData?.results.medicineTransaction.hp ??
                                  '',
                              style: ThemeTextStyle().titleSmall,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              medTranDet.statusData?.results
                                      .medicineTransaction.address ??
                                  '',
                              style: ThemeTextStyle().titleSmall,
                            ),
                          ],
                        ),
                        const SizedBox(height: 26),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Informasi Pengiriman',
                              style: ThemeTextStyle()
                                  .titleMedium
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            Builder(builder: (context) {
                              if (medTranDet.statusData?.results
                                      .paymentStatus ==
                                  "pending") {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    left: 12.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 48,
                                        child: Text(formattedDateTime),
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      const Icon(Icons.timer_sharp),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Pembayaran sedang diproses'),
                                          Text('Sedang di verifikasi'),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              } else {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    left: 12.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 48,
                                        child: Text(formattedDateTime),
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Icon(Icons.check_circle_outline_rounded, color: ThemeColor().iconActive,),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Sedang dalam pengiriman'),
                                          SizedBox(width: 250, child: Text('Paket sedang di kirim ke alamat yang bersangkutan')),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              }
                            })
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      );
    } else if (medStatusTranDet.statusData == null) {
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
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
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
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }

  Widget _buildPaymentDetails(String line1, String line2, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(line1, style: ThemeTextStyle().titleSmall),
            Text(line2, style: ThemeTextStyle().labelSmall),
          ],
        ),
        Text(amount, style: ThemeTextStyle().titleSmall),
      ],
    );
  }
}
