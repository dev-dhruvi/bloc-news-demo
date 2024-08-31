part of 'news_bloc.dart';

abstract class NewsEvent {}

class NewsFetchDataEvent extends NewsEvent {
  final String countryCode;
  final String newsType;

  NewsFetchDataEvent(this.countryCode, this.newsType);
}

class NewsFetchDataPaginationEvent extends NewsEvent {
  final String countryCode;
  final String newsType;

  NewsFetchDataPaginationEvent(this.countryCode, this.newsType);
}
