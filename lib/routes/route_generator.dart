import 'package:bloc_news_app/bloc/countries/country_bloc.dart';
import 'package:bloc_news_app/bloc/news/news_bloc.dart';
import 'package:bloc_news_app/data/model/api/news_list_main.dart';
import 'package:bloc_news_app/routes/routes_name.dart';
import 'package:bloc_news_app/views/country_list/country_list_center_screen.dart';
import 'package:bloc_news_app/views/news_detail/news_detail_screen.dart';
import 'package:bloc_news_app/views/news_detail/news_detail_slider_screen.dart';
import 'package:bloc_news_app/views/news_home/news_list_pagination_screen.dart';
import 'package:bloc_news_app/views/news_home/news_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteGenerator {
  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case RoutesName.newsListScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<NewsBloc>.value(
            value: NewsBloc(),
            child: const NewsListScreen(),
          ),
        );
      case RoutesName.newsDetailSliderScreen:
        return MaterialPageRoute(
          builder: (context) {
            return NewsDetailSliderScreen(newsList: args as List<Article>);
          },
        );
      case RoutesName.newsDetailScreen:
        return MaterialPageRoute(
          builder: (context) {
            return NewsDetailScreen(articleData: args as Article);
          },
        );
      // case RoutesName.countryListScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider<CountryBloc>.value(
      //       value: CountryBloc(),
      //       child: const CountryListScreen(),
      //     ),
      //   );

      case RoutesName.countryListCenterScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<CountryBloc>.value(
            value: CountryBloc(),
            child: CountryListCenterScreen(selectedCountry: args as String),
          ),
        );

      case RoutesName.newsListPaginationScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<NewsBloc>.value(
            value: NewsBloc(),
            child: const NewsListPaginationScreen(),
          ),
        );

      default:
        return _errorRoute();
    }
  }

  Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Error"),
        ),
        body: const Center(
          child: Text("Error while loading news page"),
        ),
      );
    });
  }
}
