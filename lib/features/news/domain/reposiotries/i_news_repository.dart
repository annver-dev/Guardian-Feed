import 'package:places_search/core/domain/entities/result/request_operation.dart';
import 'package:places_search/features/common/domain/enitities/news_response_entity.dart';
import 'package:places_search/features/news/domain/enitites/news_item_entity.dart';

abstract interface class INewsRepository {
  RequestOperation<NewsResponseEntity> getNews();

  RequestOperation<List<NewsItemEntity>> searchNews(
    String query, {
    int? limit,
    int? offset,
  });
}
