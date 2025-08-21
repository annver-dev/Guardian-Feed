import 'package:flutter/foundation.dart';
import 'package:places_search/features/news/domain/enitites/news_item_entity.dart';

/// Интерфейс для работы с избранными
abstract interface class IFavoritesRepository {
  /// [ValueListenable] с локальным набором избранных карточек.
  ValueListenable<List<NewsItemEntity>> get favoritesListenable;

  Future<void> fetchFavorites();
  void dispose();
  void toggleFavorite(NewsItemEntity news);
  void removeFavorite(NewsItemEntity news);
  bool isFavorite(NewsItemEntity news);
}
