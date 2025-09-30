import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:places_search/features/favorites/domain/i_favorites_repository.dart';
import 'package:places_search/features/news/domain/enitites/news_item_entity.dart';
import 'package:places_search/features/news/domain/enitites/news_state.dart';
import 'package:places_search/features/news/ui/screens/news_model.dart';
import 'package:places_search/router/router.dart';

abstract class INewsWM {
  /// [ValueListenable] состояния экрана мест.
  ValueListenable<NewsState> get newsStateListenable;

  /// [ValueListenable] для отслеживания изменений избранного.
  ValueListenable<List<NewsItemEntity>> get favoritesListenable;

  void dispose();
  void onNewsPressed(BuildContext context, NewsItemEntity news);
  void onLikePressed(NewsItemEntity news);
  bool isFavorite(NewsItemEntity news);
  Future<void> loadNews();
  Future<void> searchNews(String query);
}

class NewsWM implements INewsWM {
  final INewsModel _model;
  final IFavoritesRepository _favoritesRepository;

  /// @nodoc
  NewsWM(this._model, this._favoritesRepository) {
    _favoritesRepository.fetchFavorites();
    // Принудительно загружаем свежие данные с API при первом запуске
    _model.getNews(forceRefresh: true);
  }

  @override
  ValueListenable<NewsState> get newsStateListenable =>
      _model.newsStateListenable;

  @override
  ValueListenable<List<NewsItemEntity>> get favoritesListenable =>
      _favoritesRepository.favoritesListenable;

  @override
  void dispose() => _model.dispose();

  @override
  void onNewsPressed(BuildContext context, NewsItemEntity news) {
    AutoRouter.of(context).push(NewsDetailRouteBuilder(news: news));
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
  Future<void> loadNews() => _model.getNews(forceRefresh: true);

  @override
  Future<void> searchNews(String query) => _model.searchNews(query);
}
