import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/provider/status_payment_provider/status_payment_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusPaymentDoctorScreen extends StatefulWidget {
  final int idTran;

  const StatusPaymentDoctorScreen({
    super.key,
    required this.idTran,
  });

  @override
  State<StatusPaymentDoctorScreen> createState() =>
      _StatusPaymentDoctorScreenState();
}

class _StatusPaymentDoctorScreenState extends State<StatusPaymentDoctorScreen> {
  bool _dataFetched = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_dataFetched) {
      Provider.of<StatusPaymentProvider>(context, listen: false)
          .fetchStatusData(widget.idTran);
      _dataFetched = true;
    }
  }

  @override
  Widget build(BuildContext context) {
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
      body: Consumer<StatusPaymentProvider>(
        builder: (context, snapshot, _) {
          final statusData = snapshot.statusData;
          if (snapshot.statusData == null) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.statusData?.meta?.success == false) {
            return const Center(
                child: Text('Failed to load status transaction'));
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'Status Pembayaran: ${statusData?.results?.paymentStatus}'),
                Text(
                    'Metode Pembayaran: ${statusData?.results?.paymentMethod}'),
                Text(
                    'Status Pembayaran: ${statusData?.results?.paymentStatus}'),
                const SizedBox(height: 20),
                Text(
                    'Transaksi Pembayaran: ${statusData?.results?.paymentConfirmation}'),
                Text('Metode Pembayaran: ${statusData?.results?.paymentMethod}'),
                // Image.asset(getBankLogo(statusData?.results?)),
                Text('Nama Dokter: ${statusData?.results?.fullname}'),
                Text('Spesialisasi: ${statusData?.results?.specialist}'),
                // Tambahkan informasi lain sesuai kebutuhan
                ElevatedButton(
                  onPressed: (statusData?.results?.paymentStatus == "success")
                      ? () {
                          // Tambahkan logika untuk memulai konsultasi
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: (statusData?.results?.paymentStatus == "success")
                        ? Colors.green
                        : Colors.grey,
                  ),
                  child: const Text('Mulai Konsultasi'),
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
