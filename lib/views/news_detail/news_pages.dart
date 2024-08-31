import 'package:bloc_news_app/core/constants/app_assets.dart';
import 'package:bloc_news_app/core/extensions/app_context_extensions.dart';
import 'package:bloc_news_app/core/utils/utils.dart';
import 'package:bloc_news_app/data/model/api/news_list_main.dart';
import 'package:bloc_news_app/widget/app_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class NewsPages extends StatelessWidget {
  final Article articleData;

  const NewsPages({required this.articleData, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        color: Colors.white,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.network(
                articleData.urlToImage,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(AppAssets.imgNoImageFound);
                },
                fit: BoxFit.cover,
                height: 250,
                width: double.infinity,
              ),
            ),
            //Top image view with bottom start text
            Container(
              width: MediaQuery.of(context).size.width,
              color: AppColors.colorAccent.shade800,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  articleData.source?.name ?? "NA",
                  style: context.resources.style.whiteTextStyle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Space between widget
                  AppWidgets.getDefaultSizedBox(context),
                  //News title text
                  Text(
                    articleData.title,
                    style: context.resources.style.headingTextStyle.copyWith(fontSize: 28, color: Colors.black),
                  ),
                  //Space between widget
                  AppWidgets.getDefaultSizedBox(context),
                  //News description with 'Read more' text
                  Container(
                    alignment: AlignmentDirectional.topStart,
                    child: RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        text: articleData.description == "" ? "" : "${articleData.description}...\n",
                        style: context.resources.style.subHeadingTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                        children: <TextSpan>[
                          TextSpan(
                              text: context.resources.strings?.textReadMore ?? "",
                              style: context.resources.style.linkTextStyle,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Utils.launchURL(articleData.url);
                                }),
                        ],
                      ),
                    ),
                  ),
                  //Space between widget
                  AppWidgets.getDefaultSizedBox(context),
                  //Author name
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.colorAccent.shade800,
                    ),
                    padding: EdgeInsets.all(8),
                    child: RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        text: context.resources.strings?.newsAuthorTitle ?? "",
                        style: context.resources.style.subHeadingTextStyle.copyWith(fontSize: 14, color: Colors.white),
                        children: <TextSpan>[
                          TextSpan(text: articleData.author, style: context.resources.style.headingTextStyle.copyWith(fontSize: 14, color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                  AppWidgets.getDefaultSizedBox(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
