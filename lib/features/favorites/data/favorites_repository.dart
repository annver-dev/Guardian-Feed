import 'package:flutter/foundation.dart';
import 'package:places_search/core/data/repositories/base_repository.dart';
import 'package:places_search/features/favorites/domain/i_database_repository.dart';
import 'package:places_search/features/favorites/domain/i_favorites_repository.dart';
import 'package:places_search/features/news/domain/enitites/news_item_entity.dart';
import 'package:places_search/features/news/domain/enitites/news_fields_entity.dart';

/// Реализация [IFavoritesRepository].
final class FavoritesRepository extends BaseRepository
    implements IFavoritesRepository {
  final IFavoritesDataBaseRepository _database;
  final ValueNotifier<List<NewsItemEntity>> _favoritesNotifier =
      ValueNotifier<List<NewsItemEntity>>([]);

  FavoritesRepository({required IFavoritesDataBaseRepository database})
    : _database = database;

  @override
  ValueListenable<List<NewsItemEntity>> get favoritesListenable =>
      _favoritesNotifier;

  @override
  Future<List<NewsItemEntity?>> fetchFavorites() async {
    try {
      final favorites = await _database.getFavoriteNews();
      final validFavorites = favorites.whereType<NewsItemEntity>().toList();
      _favoritesNotifier.value = validFavorites;
      return favorites;
    } catch (e) {
      _favoritesNotifier.value = [];
      return [];
    }
  }

  @override
  bool isFavorite(NewsItemEntity news) {
    return _favoritesNotifier.value.any((favorite) => favorite.id == news.id);
  }

  @override
  void removeFavorite(NewsItemEntity news) async {
    final currentFavorites = List<NewsItemEntity>.from(
      _favoritesNotifier.value,
    );
    currentFavorites.removeWhere((favorite) => favorite.id == news.id);
    _favoritesNotifier.value = currentFavorites;
    // Обновляем в базе данных
    await _database.toggleFavorite(news.id, false);
  }

  @override
  void toggleFavorite(NewsItemEntity news) async {
    if (isFavorite(news)) {
      removeFavorite(news);
    } else {
      final currentFavorites = List<NewsItemEntity>.from(
        _favoritesNotifier.value,
      );
      currentFavorites.add(news);
      _favoritesNotifier.value = currentFavorites;

      // Проверяем, существует ли запись в базе данных
      final existingNews = await _database.getNewsByApiId(news.id);
      if (existingNews != null) {
        // Обновляем существующую запись
        await _database.toggleFavorite(news.id, true);
      } else {
        // Вставляем новую запись
        await _database.insertNews(
          NewsItemEntity(
            id: news.id,
            type: news.type,
            sectionId: news.sectionId,
            sectionName: news.sectionName,
            publicationDate: news.publicationDate,
            title: news.title,
            webUrl: news.webUrl,
            apiUrl: news.apiUrl,
            isHosted: news.isHosted,
            pillarId: news.pillarId,
            pillarName: news.pillarName,
            fields: NewsFieldsEntity(
              body: news.fields?.body,
              thumbnail: news.fields?.thumbnail,
              author: news.fields?.author,
            ),
            isFavorite: true,
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _favoritesNotifier.dispose();
  }
}
