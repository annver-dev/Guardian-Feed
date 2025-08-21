import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:places_search/features/common/domain/repositories/i_favorites_repository.dart';
import 'package:places_search/features/news/domain/enitites/news_item_entity.dart';
import 'package:places_search/features/news/domain/enitites/news_state.dart';
import 'package:places_search/features/news/ui/screens/news_model.dart';

abstract class INewsWM {
  /// [ValueListenable] состояния экрана мест.
  ValueListenable<NewsState> get newsStateListenable;

  /// Освобождение ресурсов.
  void dispose();
  void onNewsPressed(BuildContext context, NewsItemEntity news);

  void onLikePressed(NewsItemEntity news);

  bool isFavorite(NewsItemEntity news);

  Future<void> loadNews();

  /// Поиск мест.
  // Future<void> searchPlaces(String query);
}

/// Реализация WM для экрана списка мест.
class NewsWM implements INewsWM {
  final INewsModel _model;
  final IFavoritesRepository _favoritesRepository;

  /// @nodoc
  NewsWM(this._model, this._favoritesRepository) {
    _model.getNews();
  }

  @override
  ValueListenable<NewsState> get newsStateListenable =>
      _model.placesStateListenable;

  @override
  void dispose() => _model.dispose();

  @override
  void onNewsPressed(BuildContext context, NewsItemEntity news) {
    // AutoRouter.of(context).push(PlaceDetailScreenBuilder(place: place));
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
  Future<void> loadNews() => _model.getNews();

  // @override
  // Future<void> searchPlaces(String query) => _model.searchPlaces(query);
}
