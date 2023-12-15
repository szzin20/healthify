import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:flutter/material.dart';

class ListArticleWidget extends StatelessWidget {
  const ListArticleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(
              right: 18.0,
              bottom: 18.0
            ),
            child: Stack(
              children: [
                SizedBox(
                  height: 160,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: const Image(
                      image: AssetImage('assets/images/doctor.png'),
                      fit: BoxFit.cover,
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
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Color(0xFF005E61),
                          Colors.transparent,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                Positioned(
                  child: Text(
                    'Pentingnya Menjaga Kesehatan Kulit',
                    style: ThemeTextStyle().titleSmallWhite,
                  ),
                  bottom: 20,
                  left: 20,
                  right: 126,
                ),
                Positioned(
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
                  bottom: 10,
                  right: 20,
                ),
              ],
            ),
          );
        },
        childCount: 10, 
      ),
    );

  }
}
