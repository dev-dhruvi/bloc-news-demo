import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_news_app/data/model/api/news_list_main.dart';
import 'package:bloc_news_app/data/repository/news/news_repo_imp.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  //News repo instance
  final _newsRepo = NewsRepoImp();
  int page = 1;
  bool haveMoreData = false;

  NewsBloc() : super(NewsInitial()) {
    on<NewsFetchDataEvent>(_fetchNewsList);
    on<NewsFetchDataPaginationEvent>(_fetchNewsListPagination);
  }

  FutureOr<void> _fetchNewsList(
      NewsEvent event, Emitter<NewsState> emit) async {
    if (event is NewsFetchDataEvent) {
      emit(NewsPageLoading());
      await _newsRepo
          .getNewsData(event.countryCode, event.newsType)
          .onError((error, stackTrace) => emit(NewsPageError(error.toString())))
          .then((value) {
        NewsListMain newsListMain = NewsListMain.fromJson(value);
        if (newsListMain.status == "ok") {
          emit(NewsPageLoaded(newsListMain));
        } else {
          emit(NewsPageError(newsListMain.message));
        }
      });
    }
  }

  FutureOr<void> _fetchNewsListPagination(
      NewsEvent event, Emitter<NewsState> emit) async {
    if (event is NewsFetchDataPaginationEvent) {
      if (page == 1) {
        emit(NewsPageLoadingMore());
      }
      await _newsRepo
          .getNewsPaginationData(event.countryCode, event.newsType, page)
          .onError((error, stackTrace) => emit(NewsPageError(error.toString())))
          .then((value) {
        NewsListMain newsListMain = NewsListMain.fromJson(value);
        if (newsListMain.status == "ok") {
          emit(NewsMorePageLoaded(newsListMain));
          page++;
        } else {
          emit(NewsPageError(newsListMain.message));
        }
      });
    }
  }
}
