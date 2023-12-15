import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/models/article_list_model.dart';
import 'package:flutter/material.dart';

class ListArticleWidget extends StatelessWidget {
  final List<Result> result;
  const ListArticleWidget({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 18.0,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Artikel Kesehatan',
                style: ThemeTextStyle().titleSmall,
              ),
              Text(
                'Lihat Semua',
                style: ThemeTextStyle().titleSmallBlue,
              ),
            ],
          ),
          ListView.builder(
            padding: const EdgeInsets.only(top: 20),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: result.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  bottom: 20.0,
                ),
                child: Stack(
                  children: [
                    SizedBox(
                      height: 160,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image(
                          image: NetworkImage(result[index].image),
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Center(
                              child: Text('No Image'),
                            );
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Color(0xFF005E61),
                                Colors.transparent,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(8.0)),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 20,
                      right: 126,
                      child: Text(
                        result[index].title,
                        style: ThemeTextStyle().titleSmallWhite,
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 20,
                      child: Row(
                        children: [
                          Icon(
                            Icons.remove_red_eye_outlined,
                            color: ThemeColor().white,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            '245k',
                            style: ThemeTextStyle().labelSmallWhite,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
