import 'package:places_search/features/news/domain/enitites/news_item_entity.dart';

/// Класс для описания интерфейса по работе с БД
abstract class NewsDataBaseRepository {
  Future<void> cacheNewsItems(List<NewsItemEntity> news);
  Future<List<NewsItemEntity>> getCachedNewsItems();
}
