import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/screens/history_list_screen/widget/card_consultation_progress.dart';
import 'package:capstone_project/screens/history_list_screen/widget/card_consultation_widget.dart';
import 'package:capstone_project/screens/history_list_screen/widget/month_year_widget.dart';
import 'package:capstone_project/widgets/searchbar_with_filter_widget.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: ThemeColor().primaryFrame,
              child: SearchBarFilterWidget(
                title: 'Cari Konsultasi',
                onTap: () {
                  // memunculkan dialog filter
                  _showFilterDialog(context);
                },
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: MonthYearWidget(),
              ),
            ),
            const CardConsultationFinish(),
            const SizedBox(
              height: 10,
            ),
            const CardConsultationProgress(),
            const SizedBox(
              height: 10,
            ),
            const CardConsultationProgress(),
          ],
        ),
      ),
    );
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          backgroundColor: const Color(0xffFBFBFB),
          contentPadding: const EdgeInsets.fromLTRB(
              16, 16, 16, 16), // Sesuaikan sesuai kebutuhan Anda
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Filter Berdasarkan Status',
                style: ThemeTextStyle()
                    .titleSmall
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close),
              )
            ],
          ),
          content: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(
                      color: ThemeColor().backgroundBeliSekarang,
                      width: 2,
                    ),
                  ),
                ).copyWith(),
                child: Text(
                  'Selesai',
                  style: ThemeTextStyle().labelLarge.copyWith(
                        color: ThemeColor().backgroundBeliSekarang,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(
                      color: ThemeColor().backgroundBeliSekarang,
                      width: 2,
                    ),
                  ),
                ).copyWith(),
                child: Text(
                  'Berlangsung',
                  style: ThemeTextStyle().labelLarge.copyWith(
                        color: ThemeColor().backgroundBeliSekarang,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              const SizedBox(
                width: 90,
              ),
            ],
          ),
        );
      },
    );
  }
}
