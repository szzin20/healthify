import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class DetailNotificationScreen extends StatelessWidget {
  const DetailNotificationScreen({super.key});

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
          Image.asset("assets/images/detail_notification.png"),
          const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 34, vertical: 16),
            child: ButtonWidget(
              title: "Konsultasi Sekarang",
            ),
          )
        ],
      ),
    );
  }
}
