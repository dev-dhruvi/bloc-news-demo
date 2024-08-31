import 'package:bloc_news_app/core/extensions/app_context_extensions.dart';
import 'package:bloc_news_app/data/model/api/news_list_main.dart';
import 'package:bloc_news_app/views/news_detail/news_pages.dart';
import 'package:bloc_news_app/widget/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NewsDetailSliderScreen extends StatefulWidget {
  List<Article> newsList = [];

  NewsDetailSliderScreen({required this.newsList, super.key});

  @override
  State<NewsDetailSliderScreen> createState() => _NewsDetailSliderScreenState();
}

class _NewsDetailSliderScreenState extends State<NewsDetailSliderScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppWidgets.getAppBar(context, context.resources.strings?.newsHome ?? ""),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(context.resources.dimension.defaultMargin),
              child: PageView.builder(
                itemBuilder: (context, index) {
                  return NewsPages(articleData: widget.newsList[index]);
                },
                itemCount: widget.newsList.length,
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                // physics: const BouncingScrollPhysics(),
                onPageChanged: (value) {
                  currentPage = value;
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Shimmer.fromColors(
              baseColor: Colors.black,
              highlightColor: Colors.lightGreenAccent,
              child: const Text(
                "<<< Swipe left or Swipe right >>>",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
    );
  }
}
