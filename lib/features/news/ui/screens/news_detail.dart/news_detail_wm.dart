import 'package:flutter/foundation.dart';
import 'package:places_search/features/favorites/domain/i_favorites_repository.dart';
import 'package:places_search/features/news/domain/enitites/news_item_entity.dart';

abstract class INewsDetailWM {
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
class NewsDetailWM implements INewsDetailWM {
  final IFavoritesRepository _favoritesRepository;

  /// Конструктор NewsDetailWM.
  NewsDetailWM(this._favoritesRepository);

  @override
  void dispose() {
    // Освобождение ресурсов если необходимо
  }

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
