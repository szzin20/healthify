import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/screens/payment_detail/payment_detail_screen.dart';
import 'package:capstone_project/widgets/voucher_text_field.dart';
import 'package:flutter/material.dart';

class ConsultationFeeScreen extends StatefulWidget {
  const ConsultationFeeScreen({super.key});

  @override
  State<ConsultationFeeScreen> createState() => _ConsultationFeeState();
}

int selectedPaymentMethod = -1; // -1 menunjukkan tidak ada yang dipilih

final List<String> paymentMethods = [
  ' Manual Transfer BCA ',
  ' Manual Transfer BRI ',
  ' Manual Transfer BNI ',
];

class _ConsultationFeeState extends State<ConsultationFeeScreen> {
  TextEditingController voucherCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pembayaran',
          style: ThemeTextStyle().titleMedium.copyWith(
                fontWeight: FontWeight.bold,
                color: ThemeColor().white,
              ),
        ),
        backgroundColor: ThemeColor().primaryFrame,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20),
              Text(
                'Rincian Pembayaran',
                style: ThemeTextStyle()
                    .titleMedium
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildPaymentDetails('Dr. Putu Shinta Widari Tirka Sp.D.V.E',
                  '(Konsultasi 30 menit)', 'Rp 79.000'),
              const SizedBox(height: 20),
              _buildPaymentDetails2('Biaya Layanan', 'Rp 1.000'),
              const SizedBox(height: 40),
              Text(
                'Kode Voucher',
                style: ThemeTextStyle().titleMedium.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              VoucherTextField(
                hintText: 'Masukkan kode voucher',
                controller: voucherCodeController,
              ),
              const SizedBox(height: 38),
              Text(
                'Metode Pembayaran',
                style: ThemeTextStyle().titleMedium.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 14),
              _buildPaymentMethodContainer(),
              const SizedBox(height: 140),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildPaymentDetails3('Untuk Dibayar', 'Rp 80.000'),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          // Tambahkan logika pembayaran dokter di sini
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PaymentDetailScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ThemeColor().primaryFrame,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 20,
                          ),
                        ),
                        child: Text('Pesan Sekarang',
                            style: ThemeTextStyle().titleMedium.copyWith(
                                  color: ThemeColor().white,
                                )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
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

  Widget _buildPaymentDetails2(String line1, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(line1, style: ThemeTextStyle().titleSmall),
          ],
        ),
        Text(amount, style: ThemeTextStyle().titleSmall),
      ],
    );
  }

  Widget _buildPaymentDetails3(String line1, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(line1, style: ThemeTextStyle().labelSmall),
            Text(
              amount,
              style: ThemeTextStyle().titleMedium2.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPaymentMethodContainer() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      child: _buildPaymentMethodList(),
    );
  }

  Widget _buildPaymentMethodList() {
    List<String> bankLogos = [
      'assets/images/bca.png',
      'assets/images/bri.png',
      'assets/images/bni.png',
    ];

    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) => const Divider(color: Colors.grey),
      itemCount: paymentMethods.length,
      itemBuilder: (context, index) {
        return RadioListTile(
          title: Row(children: [
            Container(),
            Image.asset(
              bankLogos[index],
              width: 40,
              height: 40,
            ),
            const SizedBox(width: 6),
            Text(paymentMethods[index]),
          ]),
          value: index,
          groupValue: selectedPaymentMethod,
          onChanged: (int? value) {
            setState(() {
              selectedPaymentMethod = value!;
            });
          },
          activeColor: ThemeColor().primaryFrame,
        );
      },
    );
  }
}