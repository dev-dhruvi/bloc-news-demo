import 'package:bloc_news_app/bloc/news/news_bloc.dart';
import 'package:bloc_news_app/core/constants/app_assets.dart';
import 'package:bloc_news_app/core/extensions/app_context_extensions.dart';
import 'package:bloc_news_app/data/model/api/news_list_main.dart';
import 'package:bloc_news_app/main.dart';
import 'package:bloc_news_app/routes/routes_name.dart';
import 'package:bloc_news_app/views/navigation_drawer/navigation_action.dart';
import 'package:bloc_news_app/views/navigation_drawer/navigation_drawer.dart';
import 'package:bloc_news_app/widget/app_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  late NewsBloc _newsBloc;
  String selectedCountries = "in";
  String newsType = "";
  List<Article> _newsList = [];

  @override
  void initState() {
    _newsBloc = BlocProvider.of(context);
    _newsBloc.add(NewsFetchDataEvent(selectedCountries, newsType));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppWidgets.getAppBarWithSingleIcon(context, context.resources.strings?.newsHome ?? "", () {
        _moveToCountryListScreen();
      }, const Icon(Icons.language)),
      drawer: CustomNavigationDrawer(
        countryMenuClick: (events) {
          Navigator.pop(context);
          switch (events) {
            case NavigationAction.country:
              _moveToCountryListScreen();
              break;
            case NavigationAction.about:
              print("CLICK -> ${events.name}");
              break;
            case NavigationAction.allNews:
              newsType = events.name;
              _newsBloc.add(NewsFetchDataEvent(selectedCountries, newsType));
              break;
            case NavigationAction.technology:
              newsType = events.name;
              _newsBloc.add(NewsFetchDataEvent(selectedCountries, newsType));
              break;
            case NavigationAction.business:
              newsType = events.name;
              _newsBloc.add(NewsFetchDataEvent(selectedCountries, newsType));
              break;
            case NavigationAction.entertainment:
              newsType = events.name;
              _newsBloc.add(NewsFetchDataEvent(selectedCountries, newsType));
              break;
            case NavigationAction.health:
              newsType = events.name;
              _newsBloc.add(NewsFetchDataEvent(selectedCountries, newsType));
              break;
            case NavigationAction.science:
              newsType = events.name;
              _newsBloc.add(NewsFetchDataEvent(selectedCountries, newsType));
              break;
            case NavigationAction.sports:
              newsType = events.name;
              _newsBloc.add(NewsFetchDataEvent(selectedCountries, newsType));
              break;
            case NavigationAction.allNewsSlider:
              if (_newsList.isNotEmpty) {
                Navigator.of(context, rootNavigator: true).pushNamed(RoutesName.newsDetailSliderScreen, arguments: _newsList);
              }
              break;
            case NavigationAction.lngEnglish:
              MyApp.setLocale(context, const Locale("en"));
              break;
            case NavigationAction.lngHindi:
              MyApp.setLocale(context, const Locale("hi"));
              break;
            case NavigationAction.newsPagination:
              Navigator.of(context, rootNavigator: true).pushNamed(RoutesName.newsListPaginationScreen);
              break;
          }
        },
      ),
      body: BlocConsumer<NewsBloc, NewsState>(
        builder: (context, state) {
          if (kDebugMode) {
            print("${RoutesName.newsListScreen} -->> $state");
          }
          if (state is NewsPageLoading) {
            return AppWidgets.getCenterLoadingView();
          } else if (state is NewsPageLoaded) {
            if (state.data.articles.isNotEmpty == true) {
              _newsList = state.data.articles;
            } else {
              return AppWidgets.getBuildNoResult(context, context.resources.strings?.noNewsFound ?? "");
            }
          } else if (state is NewsPageError) {
            return AppWidgets.getBuildNoResult(context, state.errorMessage);
          }
          return _newsListView();
        },
        listener: (context, state) {},
      ),
    );
  }

  Widget _newsListView() {
    return ListView.builder(
      itemCount: _newsList.length,
      itemBuilder: (context, index) {
        return _newsListItems(_newsList[index]);
      },
    );
  }

  Widget _newsListItems(Article article) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context, rootNavigator: true).pushNamed(RoutesName.newsDetailScreen, arguments: article);
        },
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16, left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.source?.name ?? "NA",
                        style: context.resources.style.headingTextStyle,
                      ),
                      Text(
                        article.title,
                        style: context.resources.style.subHeadingTextStyle.copyWith(fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  article.urlToImage,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      AppAssets.imgNoImageFound,
                      width: 150,
                      height: 100,
                      fit: BoxFit.cover,
                    );
                  },
                  fit: BoxFit.cover,
                  width: 150,
                  height: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _moveToCountryListScreen() async {
    final result = await Navigator.of(context, rootNavigator: true).pushNamed(RoutesName.countryListCenterScreen, arguments: selectedCountries);
    if (kDebugMode) {
      print("SELECTED COUNTRY CODE: $result");
    }
    selectedCountries = result as String;
    _newsBloc.add(NewsFetchDataEvent(selectedCountries, newsType));
  }
}
