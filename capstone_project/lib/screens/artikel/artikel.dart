import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/widgets/bottom_navigation_bar_widget.dart';
import 'package:capstone_project/widgets/menu_artikel_widget.dart';
import 'package:capstone_project/widgets/search_bar_widget.dart';
import 'package:capstone_project/widgets/all_list_artikel_widget.dart';
import 'package:flutter/material.dart';

class ArtikelScreen extends StatefulWidget {
  const ArtikelScreen({super.key});

  @override
  _ArtikelScreenState createState() => _ArtikelScreenState();
}

class _ArtikelScreenState extends State<ArtikelScreen> {
  int selectedChipIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Artikel',
                style: ThemeTextStyle().titleMedium.copyWith(
                      fontSize: 20,
                      color: const Color(0xffFBFBFB),
                    ),
              ),
              centerTitle: true,
              titlePadding: const EdgeInsets.only(
                  bottom: 14.0), // Adjust the bottom padding as needed
              background: Container(
                color: ThemeColor().primaryFrame,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: ThemeColor().primaryFrame,
              child: const SearchBarWidget(
                title: 'Cari Artikel',
              ),
            ),
          ),
          const SliverAppBar(
            backgroundColor: Colors.white,
            toolbarHeight: 40,
            floating: false,
            pinned: true,
            expandedHeight: 0,
            flexibleSpace: MenuArtikel(),
            bottom: PreferredSize(preferredSize: Size.zero, child: Text('')),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 10,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return const ListArticleWidget();
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(
        currentIndex: 3,
      ),
    );
  }
}
