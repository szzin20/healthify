import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:flutter/material.dart';

class ListDoctorWidget extends StatelessWidget {
  const ListDoctorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Rekomendasi Dokter',
            ),
            Text(
              'Lihat Semua',
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 202,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.only(right: 18.0),
                color: ThemeColor().searchBar,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        12.0,
                      ),
                      color: ThemeColor().white),
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: 130,
                            height: 90,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4.0),
                              child: const Image(
                                image: AssetImage('assets/images/doctor.png'),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 4,
                            bottom: 4,
                            child: Container(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              decoration: BoxDecoration(
                                color: ThemeColor().kirimButton,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'Online',
                                style: ThemeTextStyle().labelExtraSmallWhite,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'hjhgg',
                        style: ThemeTextStyle().labelMedium,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'hjhgg',
                        style: ThemeTextStyle().bodySmall,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      SizedBox(
                        width: 130,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    size: 10,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    '4,7',
                                    style: ThemeTextStyle().labelSmall,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              '74 ulasan',
                              style: ThemeTextStyle().labelSmall,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'hjhgg',
                        style: ThemeTextStyle().labelSmallBold,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
