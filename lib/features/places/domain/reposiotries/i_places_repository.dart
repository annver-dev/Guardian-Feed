import 'package:places_search/core/domain/entities/result/request_operation.dart';
import 'package:places_search/features/common/domain/enitities/news_response_entity.dart';
import 'package:places_search/features/common/domain/enitities/place_entity.dart';
import 'package:places_search/features/news/news_item.dart';

/// Интерфейс репозитория для получения мест.
abstract interface class INewsRepository {
  /// Получить список мест.
  RequestOperation<NewsResponseEntity> getNews();

  // RequestOperation<List<NewsItemEntity>> searchNews(
  //   String query, {
  //   int? limit,
  //   int? offset,
  // });
}
