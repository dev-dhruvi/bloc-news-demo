import 'package:bloc_news_app/data/repository/news/news_repo.dart';
import 'package:bloc_news_app/data/service/api_end_points.dart';
import 'package:bloc_news_app/data/service/base_api_service.dart';
import 'package:bloc_news_app/data/service/network_api_service.dart';
import 'package:flutter/services.dart';

class NewsRepoImp extends NewsRepo {
  final BaseApiService _apiService = NetworkApiService();
  static const int _pageSize = 10;

  /// This method read data from server
  @override
  Future getNewsData(String countryCode, String newsType) async {
    try {
      dynamic response = await _apiService.getAllNewsResponse(ApiEndPoints().getNewsList, countryCode, newsType);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future getNewsPaginationData(String countryCode, String newsType, int page) async {
    try {
      dynamic response = await _apiService.getAllNewsPaginationResponse(ApiEndPoints().getNewsList, countryCode, _pageSize, page);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /// This method read data from local JSON file
  @override
  Future getCountriesData() async {
    try {
      dynamic response = await rootBundle.loadString("assets/json/countries_data.json");
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
