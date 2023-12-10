import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class DetailDoctorScreen extends StatelessWidget {
  const DetailDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 196,
                  width: double.infinity,
                  color: Colors.blue,
                ),
                const Positioned(
                  top: 18,
                  left: 24,
                  child: Text(
                    'data',
                  ),
                ),
                const Positioned(
                  top: 18,
                  right: 24,
                  child: Text(
                    'jj',
                  ),
                ),
                const Positioned(
                  top: 156,
                  right: 24,
                  child: Text(
                    'jj',
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                top: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Dr. Putu Shinta Widari Tirka Sp.D.V.E',
                    style: ThemeTextStyle().headlineName,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Sp. Kulit & Kelamin',
                    style: ThemeTextStyle().labelMedium,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Rp 79.000',
                    style: ThemeTextStyle().labelLarge2,
                  ),
                  Row(
                    children: [
                      Text(
                        'data',
                        style: ThemeTextStyle().labelSmall,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text('data', style: ThemeTextStyle().labelSmall),
                      const Expanded(
                        child: SizedBox(),
                      ),
                      Text(
                        'data',
                        style: ThemeTextStyle().labelSmallBold,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Tentang Dokter',
                    style: ThemeTextStyle().headlineMedium,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Spesialis kulit dan kelamin berpengalaman dengan lebih dari 8 tahun pengalaman klinis, memiliki keahlian dalam mendiagnosis dan merawat berbagai kondisi kulit serta masalah kesehatan kelamin.',
                    style: ThemeTextStyle().bodySmall,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nomor STR',
                            style: ThemeTextStyle().labelMedium,
                          ),
                          Text(
                            '9911602319118526',
                            style: ThemeTextStyle().bodySmall,
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.map,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Lokasi Praktik',
                            style: ThemeTextStyle().labelMedium,
                          ),
                          Text(
                            'RSUD H. Soewondo Kendal, Jawa Tengah',
                            style: ThemeTextStyle().bodySmall,
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.school,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Lokasi Praktik',
                            style: ThemeTextStyle().labelMedium,
                          ),
                          Text(
                            'RSUD H. Soewondo Kendal, Jawa Tengah',
                            style: ThemeTextStyle().bodySmall,
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Cerita Pasien',
                    style: ThemeTextStyle().labelMedium,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 150,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: 3,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 310,
                        padding: const EdgeInsets.only(
                          top: 10.0,
                          bottom: 10,
                          right: 10,
                          left: 8,
                        ),
                        child: Container(
                          color: ThemeColor().textChat,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const CircleAvatar(
                                    backgroundColor: Colors.blue,
                                    maxRadius: 30,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Ferdy Sambo',
                                        style: ThemeTextStyle().labelMedium,
                                      ),
                                      const Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            size: 10,
                                          ),
                                          Icon(
                                            Icons.star,
                                            size: 10,
                                          ),
                                          Icon(
                                            Icons.star,
                                            size: 10,
                                          ),
                                          Icon(
                                            Icons.star,
                                            size: 10,
                                          ),
                                          Icon(
                                            Icons.star,
                                            size: 10,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 48,
                                  ),
                                  Text(
                                    '07 Oktober 2023',
                                    style: ThemeTextStyle().bodySmall,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Kemarin ada anggota saya kena tembak sama oknum. Tapi bekas pelurunya ga ilang2 tuh. Akhirnya konsultasi trus dikasih saran produk penghilang luka',
                                style: ThemeTextStyle().bodySmall,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                bottom: 32.0,
              ),
              child: ButtonWidget(
                title: 'Chat Sekarang',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
