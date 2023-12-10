import 'package:capstone_project/widgets/home_search_bar_widget.dart';
import 'package:capstone_project/widgets/homescreen_category_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/doctor.png',
                  ),
                  radius: 30,
                ),
                SizedBox(
                  width: 8,
                ),
                Text('data'),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            HomeSearchBarWidget(title: 'Search'),
            SizedBox(
              height: 10,
            ),
            Text('Apa yang kamu butuhkan?'),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                HomeScreenCategoryWidget(
                  iconWidget: Icon(
                    Icons.abc,
                  ),
                  text: 'Konsultasi',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
