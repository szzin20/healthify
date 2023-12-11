import 'package:capstone_project/widgets/bottom_navigation_bar_widget.dart';
import 'package:capstone_project/widgets/category_list_widget.dart';
import 'package:capstone_project/widgets/home_search_bar_widget.dart';
import 'package:capstone_project/widgets/list_article_widget.dart';
import 'package:capstone_project/widgets/list_doctor_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 66,
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
              const CategoryListWidget(),
              const SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 112,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      8.0,
                    ),
                    child: const Image(
                      image: AssetImage('assets/images/doctor.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              const ListDoctorWidget(),
              const SizedBox(
                height: 32,
              ),
              const ListArticleWidget()
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(currentIndex: 0,),
    );
  }
}
