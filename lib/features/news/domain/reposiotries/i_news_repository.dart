import 'package:places_search/core/domain/entities/result/request_operation.dart';
import 'package:places_search/features/common/domain/enitities/news_response_entity.dart';
import 'package:places_search/features/news/domain/enitites/news_item_entity.dart';

abstract interface class INewsRepository {
  /// Получить новости с автоматическим кэшированием
  RequestOperation<NewsResponseEntity> getNews({bool forceRefresh = false});

  /// Поиск новостей с кэшированием результатов
  RequestOperation<List<NewsItemEntity>> searchNews(
    String query, {
    int? limit,
    int? offset,
    bool forceRefresh = false,
  });

  /// Получить кэшированные новости (offline режим)
  Future<List<NewsItemEntity>> getCachedNews();

  /// Очистить кэш новостей
  Future<void> clearCache();
}
