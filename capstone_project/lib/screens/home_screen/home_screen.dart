import 'package:capstone_project/widgets/home_search_bar_widget.dart';
import 'package:capstone_project/widgets/homescreen_category_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/doctor.png',
                  ),
                  radius: 30,
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text('data'),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const HomeSearchBarWidget(title: 'Search'),
            const SizedBox(
              height: 10,
            ),
            const Text('Apa yang kamu butuhkan?'),
            const SizedBox(
              height: 8,
            ),
            const Row(
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
