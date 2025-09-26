import 'package:flutter/foundation.dart';
import 'package:places_search/features/favorites/domain/i_favorites_repository.dart';
import 'package:places_search/features/news/domain/enitites/news_item_entity.dart';

abstract class IFavoritesDetailWM {
  /// Освобождение ресурсов.
  void dispose();

  /// Добавить/удалить новость из избранного.
  void onLikePressed(NewsItemEntity news);

  /// Проверить, находится ли новость в избранном.
  bool isFavorite(NewsItemEntity news);

  /// [ValueListenable] для отслеживания изменений избранного.
  ValueListenable<List<NewsItemEntity>> get favoritesListenable;
}

/// Реализация WM для экрана детали новости.
class FavoritesDetailWM implements IFavoritesDetailWM {
  final IFavoritesRepository _favoritesRepository;

  /// Конструктор NewsDetailWM.
  FavoritesDetailWM(this._favoritesRepository) {
    // Загружаем избранные новости при создании WM
    _favoritesRepository.fetchFavorites();
  }

  @override
  void dispose() {}

  @override
  void onLikePressed(NewsItemEntity news) {
    _favoritesRepository.toggleFavorite(news);
  }

  @override
  bool isFavorite(NewsItemEntity news) {
    return _favoritesRepository.isFavorite(news);
  }

  @override
  ValueListenable<List<NewsItemEntity>> get favoritesListenable =>
      _favoritesRepository.favoritesListenable;
}
