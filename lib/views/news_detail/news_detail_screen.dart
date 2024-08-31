import 'package:bloc_news_app/core/constants/app_assets.dart';
import 'package:bloc_news_app/core/constants/app_colors.dart';
import 'package:bloc_news_app/core/extensions/app_context_extensions.dart';
import 'package:bloc_news_app/core/utils/utils.dart';
import 'package:bloc_news_app/data/model/api/news_list_main.dart';
import 'package:bloc_news_app/widget/app_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewsDetailScreen extends StatefulWidget {
  final Article articleData;

  const NewsDetailScreen({super.key, required this.articleData});

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppWidgets.getAppBar(context, context.resources.strings?.newsDetails ?? ""),
      body: Padding(
        padding: EdgeInsets.all(context.resources.dimension.defaultMargin),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  widget.articleData.source?.name ?? "NA",
                  style: context.resources.style.whiteTextStyle.copyWith(
                    color: AppColors.colorAccent.shade800,
                    fontSize: 14,
                  ),
                ),
              ),
              //News title text
              Text(
                widget.articleData.title,
                style: context.resources.style.headingTextStyle.copyWith(color: Colors.black, fontSize: 24),
              ),
              Text(
                DateFormat("dd MMMM yyyy").format(widget.articleData.publishedAt ?? DateTime.now()),
                style: context.resources.style.subHeadingTextStyle.copyWith(color: Colors.grey.shade700, fontSize: 14),
              ),
              //Space between widget
              AppWidgets.getDefaultSizedBox(context),
              //Top image view with bottom start text
              Image.network(
                widget.articleData.urlToImage,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(AppAssets.imgNoImageFound);
                },
                fit: BoxFit.fitWidth,
                width: MediaQuery.of(context).size.width,
              ),
              AppWidgets.getDefaultSizedBox(context),
              //News description with 'Read more' text
              Container(
                alignment: AlignmentDirectional.topStart,
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: widget.articleData.description,
                    style: context.resources.style.subHeadingTextStyle.copyWith(color: Colors.black, fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                          text: context.resources.strings?.textReadMore ?? "",
                          style: context.resources.style.linkTextStyle,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Utils.launchURL(widget.articleData.url);
                              if (kDebugMode) {
                                print("Click on read more: ${widget.articleData.url}");
                              }
                            }),
                    ],
                  ),
                ),
              ),
              Text(
                widget.articleData.content,
                style: context.resources.style.subHeadingTextStyle.copyWith(color: Colors.black, fontSize: 16),
              ),

              //Space between widget
              AppWidgets.getDefaultSizedBox(context),
              //Author name
              Container(
                alignment: AlignmentDirectional.topStart,
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: context.resources.strings?.newsAuthorTitle ?? "",
                    style: context.resources.style.subHeadingTextStyle,
                    children: <TextSpan>[
                      TextSpan(
                        text: widget.articleData.author.isEmpty ? context.resources.strings!.textNoAuthor : widget.articleData.author,
                        style: context.resources.style.headingTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
