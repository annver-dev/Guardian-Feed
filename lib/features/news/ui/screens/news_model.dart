import 'package:flutter/foundation.dart';
import 'package:places_search/core/domain/entities/result/result.dart';
import 'package:places_search/features/common/domain/enitities/news_response_entity.dart';
import 'package:places_search/features/favorites/domain/i_favorites_repository.dart';
import 'package:places_search/features/news/domain/enitites/news_item_entity.dart';
import 'package:places_search/features/news/domain/enitites/news_state.dart';
import 'package:places_search/features/news/domain/reposiotries/i_news_repository.dart';

/// Модель для экрана новостей.
class NewsModel implements INewsModel {
  final INewsRepository _newsRepository;
  final IFavoritesRepository _favoritesRepository;

  NewsModel({
    required INewsRepository newsRepository,
    required IFavoritesRepository favoritesRepository,
  }) : _newsRepository = newsRepository,
       _favoritesRepository = favoritesRepository {
    // Слушаем изменения в избранном для обновления состояния
    _favoritesRepository.favoritesListenable.addListener(_onFavoritesChanged);
  }

  final _newsState = ValueNotifier<NewsState>(const NewsStateLoading());
  List<NewsItemEntity>? _cachedRemoteNews;
  String? _currentSearchQuery;

  @override
  ValueListenable<NewsState> get newsStateListenable => _newsState;

  @override
  ValueListenable<List<NewsItemEntity>> get favoritesNews =>
      _favoritesRepository.favoritesListenable;

  @override
  void dispose() {
    _favoritesRepository.favoritesListenable.removeListener(
      _onFavoritesChanged,
    );
    _newsState.dispose();
  }

  @override
  Future<void> getNews() async {
    _newsState.value = const NewsStateLoading();
    _currentSearchQuery = null;
    
    final newsResult = await _newsRepository.getNews();
    switch (newsResult) {
      case ResultOk(:final data):
        _cachedRemoteNews = data.items;
        _updateCombinedNews();

      case ResultFailed(:final error):
        _newsState.value = NewsStateFailure(error);
    }
  }

  @override
  Future<void> searchNews(String query) async {
    _newsState.value = const NewsStateLoading();
    _currentSearchQuery = query;
    
    if (query.isEmpty) {
      // Если запрос пустой, показываем все новости
      await getNews();
      return;
    }
    
    if (query.length < 3) {
      // Слишком короткий запрос - показываем пустой результат
      _newsState.value = NewsStateData(NewsResponseEntity(items: [], totalResults: 0));
      return;
    }

    // Поиск среди кешированных новостей
    final cached = _cachedRemoteNews;
    if (cached != null) {
      final filtered = cached.where((news) {
        return news.title.toLowerCase().contains(query.toLowerCase()) ||
               (news.fields?.body?.toLowerCase().contains(query.toLowerCase()) ?? false);
      }).toList();
      
      _updateNewsWithFavorites(filtered);
    } else {
      // Если кеша нет, загружаем новости и затем фильтруем
      await getNews();
      if (_cachedRemoteNews != null) {
        await searchNews(query); // Рекурсивно вызываем поиск
      }
    }
  }

  void _onFavoritesChanged() {
    _updateCombinedNews();
  }

  void _updateCombinedNews() {
    final remote = _cachedRemoteNews;
    if (remote == null) return;

    List<NewsItemEntity> newsToShow = remote;
    
    // Если есть активный поиск, фильтруем результаты
    if (_currentSearchQuery != null && _currentSearchQuery!.isNotEmpty) {
      newsToShow = remote.where((news) {
        final query = _currentSearchQuery!.toLowerCase();
        return news.title.toLowerCase().contains(query) ||
               (news.fields?.body?.toLowerCase().contains(query) ?? false);
      }).toList();
    }
    
    _updateNewsWithFavorites(newsToShow);
  }
  
  void _updateNewsWithFavorites(List<NewsItemEntity> newsList) {
    final favorites = _favoritesRepository.favoritesListenable.value;
    
    // Обновляем статус избранного для каждой новости
    final updatedNews = newsList.map((news) {
      final isFavorite = favorites.any((f) => f.id == news.id);
      return news.copyWith(isFavorite: isFavorite);
    }).toList();

    final newsResponse = NewsResponseEntity(
      items: updatedNews,
      totalResults: updatedNews.length,
    );
    _newsState.value = NewsStateData(newsResponse);
  }
}

/// Интерфейс модели для экрана новостей.
abstract class INewsModel {
  /// [ValueListenable] состояния экрана новостей.
  ValueListenable<NewsState> get newsStateListenable;

  /// [ValueListenable] списка избранных новостей.
  ValueListenable<List<NewsItemEntity>> get favoritesNews;

  /// Освобождение ресурсов.
  void dispose();

  /// Получение списка новостей.
  Future<void> getNews();
  
  /// Поиск новостей по запросу.
  Future<void> searchNews(String query);
}
