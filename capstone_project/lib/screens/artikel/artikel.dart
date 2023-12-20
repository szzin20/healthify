import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/provider/article_provider/all_articles_provider.dart';
import 'package:capstone_project/widgets/bottom_navigation_bar_widget.dart';
import 'package:capstone_project/widgets/menu_artikel_widget.dart';
import 'package:capstone_project/widgets/search_bar_widget.dart';
import 'package:capstone_project/widgets/all_list_artikel_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ArtikelScreen extends StatefulWidget {
  const ArtikelScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ArtikelScreenState createState() => _ArtikelScreenState();
}

class _ArtikelScreenState extends State<ArtikelScreen> {
  int selectedChipIndex = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<AllArticlesProvider>(context, listen: false).fetchArticles();
    });
  }

  void searchArticles(String query) {
    Provider.of<AllArticlesProvider>(context, listen: false)
        .fetchArticlesByTitle(query);
  }

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
              titlePadding: const EdgeInsets.only(bottom: 14.0),
              background: Container(
                color: ThemeColor().primaryFrame,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: ThemeColor().primaryFrame,
              child: SearchBarWidget(
                onChanged: (String query) {
                  if (query.isEmpty) {
                    Provider.of<AllArticlesProvider>(context, listen: false)
                        .clearSearch();
                  } else {
                    Provider.of<AllArticlesProvider>(context, listen: false)
                        .fetchArticlesByTitle(query);
                  }
                },
                title: 'Cari Artikel',
                onSubmitted: searchArticles,
              ),
            ),
          ),
          const SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            toolbarHeight: 40,
            floating: false,
            pinned: true,
            expandedHeight: 0,
            flexibleSpace: MenuArtikel(),
            bottom: PreferredSize(preferredSize: Size.zero, child: Text('')),
          ),
          Consumer<AllArticlesProvider>(
              builder: (context, articlesListProvider, _) {
            return SliverPadding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 4),
              sliver: ListArticleWidget(
                result: articlesListProvider.articles,
                loading: articlesListProvider.loading,
              ),
            );
          }),
        ],
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(
        currentIndex: 3,
      ),
    );
  }
}
