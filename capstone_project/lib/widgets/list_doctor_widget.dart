import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/models/doctor_list_model.dart';
import 'package:capstone_project/screens/view_available_doctor/doctor_screen.dart';
import 'package:flutter/material.dart';

class ListDoctorWidget extends StatelessWidget {
  final List<Result> result;
  const ListDoctorWidget({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Rekomendasi Dokter',
                style: ThemeTextStyle().titleSmall,
              ),
              GestureDetector(
                child: Text(
                  'Lihat Semua',
                  style: ThemeTextStyle().titleSmallBlue,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DoctorScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 202,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: result.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/detailDoctor',
                      arguments: result[index].id);
                },
                child: Container(
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
                                child: Image(
                                  image: NetworkImage(
                                      result[index].profilePicture),
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Center(
                                      child: Text('No Image'),
                                    );
                                  },
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
                          result[index].fullname,
                          style: ThemeTextStyle().labelMedium,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          result[index].specialist,
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
                          result[index].price.toString(),
                          style: ThemeTextStyle().labelSmallBold,
                        ),
                      ],
                    ),
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
