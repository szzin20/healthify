import 'package:capstone_project/constants/text_theme.dart';
import 'package:flutter/material.dart';

class MonthYearWidget extends StatelessWidget {
  const MonthYearWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // get date
    DateTime now = DateTime.now();

    // get month
    List<String> monthName = [
      "Januari",
      "Februari",
      "Maret",
      "April",
      "Mei",
      "Juni",
      "Juli",
      "Agustus",
      "September",
      "Oktober",
      "November",
      "Desember"
    ];

    String monthNow = monthName[now.month - 1];

    // show month and year
    String showMonthYear = '$monthNow ${now.year}';

    return Text(
      showMonthYear,
      style: ThemeTextStyle().titleMedium,
    );
  }
}