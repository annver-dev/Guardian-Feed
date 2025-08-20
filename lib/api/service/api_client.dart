import 'package:dio/dio.dart';
import 'package:places_search/api/data/news_item_dto.dart';
import 'package:places_search/api/data/news_response_dto.dart';
import 'package:places_search/api/service/api_urls.dart';
import 'package:places_search/features/feed/news_feed.dart';
import 'package:retrofit/retrofit.dart';
part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET(ApiUrls.places)
  Future<NewsWrapperDto> getNews();

  @GET(ApiUrls.search)
  Future<List<NewsItemDto>> searchNews({
    @Query('q') required String q,
    @Query('limit') int? limit,
    @Query('offset') int? offset,
  });
}
