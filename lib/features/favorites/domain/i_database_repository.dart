import 'package:places_search/features/news/domain/enitites/news_item_entity.dart';

/// Класс для описания интерфейса по работе с БД
abstract class IFavoritesDataBaseRepository {
  Future<NewsItemEntity?> getNewsByApiId(String newsApiId);
  Future<List<NewsItemEntity?>> getFavoriteNews();
  Future<void> toggleFavorite(String newsApiId, bool isFavorite);
  Future<void> insertNews(NewsItemEntity news);
}
