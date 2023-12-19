import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/provider/status_payment_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusPaymentDoctorScreen extends StatelessWidget {
  final int doctorId;
  final String selectedPaymentMethod;
  final int idTran;

  const StatusPaymentDoctorScreen({
    super.key,
    required this.doctorId,
    required this.selectedPaymentMethod, required this.idTran,
  });

  @override
  Widget build(BuildContext context) {
    final statusProvider = Provider.of<StatusPaymentProvider>(context);
    
    return Scaffold(
     appBar: AppBar(
        title: Text(
          'Riwayat Transaksi',
          style: ThemeTextStyle().titleMedium.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color(0XFFFBFBFB),
              ),
        ),
        backgroundColor: ThemeColor().primaryFrame,
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: statusProvider.fetchStatusData(idTran),
        builder: (context, snapshot) {
          if (snapshot.hasError || statusProvider.statusData == null) {
            // Log error details
            print('Error: ${snapshot.error}');
            return Center(child: Text('Failed to load status transaction'));
          } else {
            final statusData = statusProvider.statusData!; // Non-null assertion

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text('Status Pembayaran: ${statusData.results?.paymentStatus}'),
                Text('Metode Pembayaran: ${statusData.results?.paymentMethod}'),
                  Text('Status Pembayaran: ${statusData.results?.paymentStatus}'),
                const SizedBox(height: 20),
                Text('Transaksi Pembayaran: ${statusData.results?.paymentConfirmation}'),
                Text('Metode Pembayaran: $selectedPaymentMethod'),
                // Image.asset(getBankLogo(statusData.results?)),
                Text('Nama Dokter: ${statusData.results?.fullname}'),
                Text('Spesialisasi: ${statusData.results?.specialist}'),
                // Tambahkan informasi lain sesuai kebutuhan
                ElevatedButton(
                  onPressed: (statusData.results?.paymentStatus == "success")
                      ? () {
                          // Tambahkan logika untuk memulai konsultasi
                        }
                      : null,
                  child: Text('Mulai Konsultasi'),
                  style: ElevatedButton.styleFrom(
                    primary: (statusData.results?.paymentStatus == "success")
                        ? Colors.green
                        : Colors.grey,
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  String getBankLogo(int index) {
    // Sesuaikan dengan kebutuhan logo bank
    List<String> bankLogos = [
      'assets/images/bca.png',
      'assets/images/bri.png',
      'assets/images/bni.png',
    ];

    return bankLogos[index];
  }
}
