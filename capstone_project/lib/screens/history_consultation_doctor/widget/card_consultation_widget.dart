
import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/screens/history_consultation_doctor/history_chat_screen.dart';
import 'package:flutter/material.dart';

class CardConsultationFinish extends StatelessWidget {
  const CardConsultationFinish({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Konsultasi dengan',
                style: ThemeTextStyle()
                    .labelMedium
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 23,
                    backgroundImage:
                        AssetImage('assets/images/doctor.png'),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    width: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dr. Putu Shinta Widari Tirka Sp.D.V.E",
                          style: ThemeTextStyle().labelMedium.copyWith(
                                color: const Color(0xff4e4e4e),
                              ),
                        ),
                        Text(
                          "Sp. Kulit & Kelamin",
                          style: ThemeTextStyle().labelMedium.copyWith(
                                color: const Color(0xff4e4e4e),
                              ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 114,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            width: 58,
                            height: 20,
                            decoration: BoxDecoration(
                              color: const Color(0xffa2f5ac),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              'Selesai',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xff003240),
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/Document.png",
                              height: 31,
                            ),
                            const SizedBox(width: 12),
                            SizedBox(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "1 Sep 2023",
                                    style: ThemeTextStyle()
                                        .labelMedium
                                        .copyWith(
                                          color: const Color(0xff757575),
                                        ),
                                  ),
                                  Text(
                                    "07:00",
                                    style: ThemeTextStyle()
                                        .labelMedium
                                        .copyWith(
                                          color: const Color(0xff757575),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ), // Spacer untuk mengisi ruang kosong dan mendorong elemen selanjutnya ke pojok kanan
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // halaman single doctor
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      fixedSize: const Size.fromWidth(175.0),
                    ).copyWith(
                      backgroundColor:
                          MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          return ThemeColor().primaryButtonActive;
                        },
                      ),
                    ),
                    child: Text(
                      'Pesan Ulang',
                      style: ThemeTextStyle().labelLarge.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HistoryChatScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(
                              color: ThemeColor().primaryButtonActive)),
                      fixedSize: const Size.fromWidth(175.0),
                    ).copyWith(),
                    child: Text(
                      'Riwayat Chat',
                      style: ThemeTextStyle().labelLarge.copyWith(
                            color: ThemeColor().primaryButtonActive,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
