import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/provider/status_payment_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusPaymentDoctorScreen extends StatelessWidget {
  final int medPayId;
  final String selectedPaymentMethod;

  const StatusPaymentDoctorScreen({
    Key? key,
    required this.medPayId,
    required this.selectedPaymentMethod,
  }) : super(key: key);

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
        future: statusProvider.fetchStatusData(1),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || statusProvider.statusData == null) {
            // Log error details
            print('Error: ${snapshot.error}');
            return const Center(child: Text('Failed to load status transaction'));
          } else {
            final statusData = statusProvider.statusData!; // Non-null assertion

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text('Status Pembayaran: ${statusData["payment_status"]}'),
                Text('Metode Pembayaran: ${statusData["selectedPaymentMethod"] ?? "Unknown"}'),
                  Text('Status Pembayaran: ${statusData["payment_status"]}'),
                const SizedBox(height: 20),
                Text('Transaksi Pembayaran: ${statusData["payment_status"]}'),
                Text('Metode Pembayaran: $selectedPaymentMethod'),
                Image.asset(getBankLogo(statusData["selectedPaymentMethod"])),
                Text('Nama Dokter: ${statusData["fullname"]}'),
                Text('Spesialisasi: ${statusData["specialist"]}'),
                // Tambahkan informasi lain sesuai kebutuhan
                ElevatedButton(
                  onPressed: (statusData["payment_status"] == "success")
                      ? () {
                          // Tambahkan logika untuk memulai konsultasi
                        }
                      : null,
                  child: const Text('Mulai Konsultasi'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: (statusData["payment_status"] == "success")
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