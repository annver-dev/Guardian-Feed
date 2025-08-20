import 'package:flutter/foundation.dart';
import 'package:places_search/core/domain/entities/result/result.dart';
import 'package:places_search/features/news/domain/enitites/news_item_entity.dart';
import 'package:places_search/features/news/domain/enitites/news_state.dart';
import 'package:places_search/features/news/domain/reposiotries/i_news_repository.dart';

/// Модель для экрана мест.
class NewsModel implements INewsModel {
  final INewsRepository _placesRepository;
  // final IFavoritesRepository _favoritesRepository;

  NewsModel({
    required INewsRepository newsRepository,
    // required IFavoritesRepository favoritesRepository,
  }) : _placesRepository = newsRepository;
  //  _favoritesRepository = favoritesRepository

  // listen to favorites changes to update state.
  // _favoritesRepository.favoritesListenable.addListener(_onFavoritesChanged);

  final _placesState = ValueNotifier<NewsState>(const NewsStateLoading());

  List<NewsItemEntity>? _cachedRemoteNews;

  @override
  ValueListenable<NewsState> get placesStateListenable => _placesState;

  @override
  void dispose() {
    // _favoritesRepository.favoritesListenable.removeListener(
    //   _onFavoritesChanged,
    // );
    _placesState.dispose();
  }

  @override
  Future<void> getNews() async {
    _placesState.value = const NewsStateLoading();
    final placesResult = await _placesRepository.getNews();
    switch (placesResult) {
      case ResultOk(:final data):
        // _cachedRemoteNews = data;

        // _updateCombinedPlaces();
        _placesState.value = NewsStateData(data);

      case ResultFailed(:final error):
        _placesState.value = NewsStateFailure(error);
    }
  }

  // @override
  // Future<void> searchPlaces(String query) async {
  //   _placesState.value = const PlacesStateLoading();
  //   if (query.length > 3) {
  //     final placesResult = await _placesRepository.searchPlaces(query);
  //     switch (placesResult) {
  //       case ResultOk(:final data):
  //         _cachedRemotePlaces = data;
  //         _updateCombinedPlaces();
  //       case ResultFailed(:final error):
  //         _placesState.value = PlacesStateFailure(error);
  //     }
  //   }

  // void _onFavoritesChanged() {
  //   _updateCombinedPlaces();
  // }

  // void _updateCombinedPlaces() {
  //   final remote = _cachedRemoteNews;
  //   if (remote == null) return;

  //   final favorites = _favoritesRepository.favoritesListenable.value;
  //   final combined =
  //       remote
  //           .map(
  //             (place) => LikedPlaceEntity(
  //               place: place,
  //               isFavorite: favorites.any((f) => f.name == place.name),
  //             ),
  //           )
  //           .toList();

  //   _placesState.value = NewsState(combined);

  //   // @override
  //   // ValueListenable<List<PlaceEntity>> get favoritesPlaces =>
  //   //     _favoritesRepository.favoritesListenable;
  // }
}

/// Интерфейс модели для экрана мест.
abstract class INewsModel {
  /// [ValueListenable] состояния экрана мест.
  ValueListenable<NewsState> get placesStateListenable;

  /// [ValueListenable] списка избранных мест.
  // ValueListenable<List<PlaceEntity>> get favoritesPlaces;

  /// Освобождение ресурсов.
  void dispose();

  /// Получение списка мест.
  Future<void> getNews();
}
