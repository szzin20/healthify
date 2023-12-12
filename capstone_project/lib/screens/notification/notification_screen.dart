import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/screens/notification/detail_notification_screen.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifikasi',
          style: ThemeTextStyle().titleMedium.copyWith(
                fontSize: 20,
                color: const Color(0xffFBFBFB),
              ),
        ),
        centerTitle: true,
        backgroundColor: ThemeColor().primaryFrame,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Kamu sedang sakit? Konsultasikan dengan dokter Sekarang yuk!",
                  style: ThemeTextStyle().labelLargeBold,
                ),
                const SizedBox(height: 6),
              ],
            ),
            subtitle: Text(
              "Hari ini 20.00 Wib",
              style: ThemeTextStyle()
                  .labelMedium
                  .copyWith(color: ThemeColor().primaryButton),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailNotificationScreen(),
                ),
              );
            },
          ),
          Divider(color: ThemeColor().icon),
          ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Produk kamu belum dibayar, bayar sekarang yuk!",
                  style: ThemeTextStyle().labelLargeBold,
                ),
                const SizedBox(height: 6), 
              ],
            ),
            subtitle: Text(
              "Hari ini 20.00 Wib",
              style: ThemeTextStyle()
                  .labelMedium
                  .copyWith(color: ThemeColor().primaryButton),
            ),
            onTap: () {},
          ),
          Divider(
            color: ThemeColor().primaryButton,
          ),
        ],
      ),
    );
  }
}
