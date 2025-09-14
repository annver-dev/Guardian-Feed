import 'package:flutter/foundation.dart';
import 'package:places_search/core/data/repositories/base_repository.dart';
import 'package:places_search/features/favorites/domain/i_favorites_repository.dart';
import 'package:places_search/features/news/domain/enitites/news_item_entity.dart';

/// Реализация [IFavoritesRepository].
final class FavoritesRepository extends BaseRepository
    implements IFavoritesRepository {
  
  final ValueNotifier<List<NewsItemEntity>> _favoritesNotifier = 
      ValueNotifier<List<NewsItemEntity>>([]);

  @override
  ValueListenable<List<NewsItemEntity>> get favoritesListenable => _favoritesNotifier;

  @override
  Future<void> fetchFavorites() async {
    _favoritesNotifier.value = [];
  }

  @override
  bool isFavorite(NewsItemEntity news) {
    return _favoritesNotifier.value.any((favorite) => favorite.id == news.id);
  }

  @override
  void removeFavorite(NewsItemEntity news) {
    final currentFavorites = List<NewsItemEntity>.from(_favoritesNotifier.value);
    currentFavorites.removeWhere((favorite) => favorite.id == news.id);
    _favoritesNotifier.value = currentFavorites;
  }

  @override
  void toggleFavorite(NewsItemEntity news) {
    if (isFavorite(news)) {
      removeFavorite(news);
    } else {
      final currentFavorites = List<NewsItemEntity>.from(_favoritesNotifier.value);
      currentFavorites.add(news);
      _favoritesNotifier.value = currentFavorites;
    }
  }

  @override
  void dispose() {
    _favoritesNotifier.dispose();
  }
}
