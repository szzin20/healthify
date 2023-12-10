import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/screens/history/widget/month_year_widget.dart';
import 'package:capstone_project/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class ConsultationHistoryScreen extends StatelessWidget {
  const ConsultationHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Riwayat Konsultasi',
          style: ThemeTextStyle().titleMedium.copyWith(
                fontSize: 20,
                color: const Color(0xffFBFBFB),
              ),
        ),
        centerTitle: true,
        backgroundColor: ThemeColor().primaryFrame,
      ),
      body: Column(
        children: [
          Container(
            color: ThemeColor().primaryFrame,
            child: const SearchBarWidget(title: "Cari Konsultasi..."),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: MonthYearWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
