abstract class BaseApiService {
  final String baseUrl = "newsapi.org";
  final String apiKey = "2d93796823af41f0affed04b1f780149";

  Future<dynamic> getAllNewsResponse(String url, String countryCode, String newsType);

  Future<dynamic> getAllNewsPaginationResponse(String url, String countryCode, int pageSize, int page);
}
