import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/provider/article_provider/article_byid_provider.dart';
import 'package:capstone_project/widgets/detail_article_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DetailArticleScreen extends StatefulWidget {
  const DetailArticleScreen({super.key});

  @override
  State<DetailArticleScreen> createState() => _DetailArticleScreenState();
}

class _DetailArticleScreenState extends State<DetailArticleScreen> {
  int articleId = 0;
  bool _dataFetched = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_dataFetched) {
      articleId = ModalRoute.of(context)?.settings.arguments as int;
      Provider.of<ArticleByIdProvider>(context, listen: false)
          .fetchArticles(articleId);
      _dataFetched = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final articleProvider = Provider.of<ArticleByIdProvider>(context);
    final article = articleProvider;
    if (article.loading == true) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (article.articles?.meta?.success == false) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Artikel',
            style: ThemeTextStyle().titleMedium.copyWith(
                  color: ThemeColor().white,
                ),
          ),
          centerTitle: true,
          backgroundColor: ThemeColor().primaryFrame,
          foregroundColor: ThemeColor().white,
        ),
        body: const Padding(
          padding: EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
            left: 16.0,
            right: 16.0,
          ),
          child: Center(
            child: Text('Gagal Mendapatkan Article'),
          ),
        ),
      );
    } else {
      String formattedDate = article.articles?.results?.createdAt != null
    ? DateFormat('yyyy-MM-dd').format(article.articles!.results!.createdAt!)
    : '';

      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Artikel',
            style: ThemeTextStyle().titleMedium.copyWith(
                  color: ThemeColor().white,
                ),
          ),
          centerTitle: true,
          backgroundColor: ThemeColor().primaryFrame,
          foregroundColor: ThemeColor().white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 16.0,
              right: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailArticleHeaderWidget(
                  title: article.articles?.results?.title ?? '',
                  name: article.articles?.results?.fullname ?? '',
                  date: formattedDate,
                ),
                const SizedBox(
                  height: 18,
                ),
                Stack(
                  children: [
                    SizedBox(
                      height: 160,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image(
                          image: NetworkImage(
                              article.articles?.results?.image ?? ''),
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
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  article.articles?.results?.content ?? '',
                  textAlign: TextAlign.justify,
                  style: ThemeTextStyle().bodyMedium,
                )
              ],
            ),
          ),
        ),
        floatingActionButton: SpeedDial(
          icon: Icons.more_horiz,
          activeIcon: Icons.close,
          iconTheme:
              IconThemeData(color: ThemeColor().backgroundBubbleChat, size: 54),
          backgroundColor: ThemeColor().backgroundFloating,
          foregroundColor: ThemeColor().backgroundFloating,
          elevation: 6.0,
          shape: const CircleBorder(),
          children: [
            SpeedDialChild(
              child: const FaIcon(FontAwesomeIcons.whatsapp),
              backgroundColor: ThemeColor().backgroundFloating,
              label: 'Whatsapp',
              labelStyle: const TextStyle(fontSize: 18.0),
              onTap: () {},
            ),
            SpeedDialChild(
              child: const FaIcon(FontAwesomeIcons.paperPlane),
              backgroundColor: ThemeColor().backgroundFloating,
              label: 'Telegram',
              labelStyle: const TextStyle(fontSize: 18.0),
              onTap: () {},
            ),
            SpeedDialChild(
              child: const FaIcon(FontAwesomeIcons.copy),
              backgroundColor: ThemeColor().backgroundFloating,
              label: 'Copy Link',
              labelStyle: const TextStyle(fontSize: 18.0),
              onTap: () {},
            ),
          ],
        ),
      );
    }
  }
}
