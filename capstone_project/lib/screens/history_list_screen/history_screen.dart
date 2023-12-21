import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/screens/history_list_screen/consultation_history_screen.dart';
import 'package:capstone_project/widgets/bottom_navigation_bar_widget.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Riwayat',
          style: ThemeTextStyle().titleMedium.copyWith(
                fontSize: 20,
                color: const Color(0xffFBFBFB),
              ),
        ),
        centerTitle: true,
        backgroundColor: ThemeColor().primaryFrame,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 16),
        child: Column(
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xffFBFBFB),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff000000).withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 24,
                      offset: const Offset(0, 1),
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Riwayat Transaksi",
                        style: ThemeTextStyle().titleSmall,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {Navigator.of(context).pushNamed('/medHistory');},
                      child: Image.asset(
                        "assets/icons/all_icon/chevron-right.png",
                        width: 26,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xffFBFBFB),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff000000).withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 24,
                      offset: const Offset(0, 1),
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Riwayat Konsultasi",
                        style: ThemeTextStyle().titleSmall,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const ConsultationHistoryScreen(),
                          ),
                        );
                      },
                      child: Image.asset(
                        "assets/icons/all_icon/chevron-right.png",
                        width: 26,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(currentIndex: 2),
    );
  }
}
