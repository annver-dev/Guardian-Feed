import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:places_search/features/common/domain/enitities/place_entity.dart';
import 'package:places_search/features/common/domain/repositories/i_favorites_repository.dart';
import 'package:places_search/features/places/domain/enitites/places_state.dart';
import 'package:places_search/features/places/ui/screens/places_model.dart';

/// WM для экрана списка мест.
abstract class INewsWM {
  /// [ValueListenable] состояния экрана мест.
  ValueListenable<NewsState> get placesStateListenable;

  /// Освобождение ресурсов.
  void dispose();

  /// Обработчик нажатия на карточку места.
  void onPlacePressed(BuildContext context, PlaceEntity place);

  /// Обработчик нажатия на кнопку "лайк".
  void onLikePressed(PlaceEntity place);

  /// Проверяет, добавлено ли место в избранное.
  // bool isFavorite(PlaceEntity place);

  /// Загрузка списка мест.
  Future<void> loadPlaces();

  /// Поиск мест.
  // Future<void> searchPlaces(String query);
}

/// Реализация WM для экрана списка мест.
class NewsWM implements INewsWM {
  final INewsModel _model;
  // final IFavoritesRepository _favoritesRepository;

  /// @nodoc
  NewsWM(this._model) {
    _model.getPlaces();
  }

  @override
  ValueListenable<NewsState> get placesStateListenable =>
      _model.placesStateListenable;

  @override
  void dispose() => _model.dispose();

  @override
  void onPlacePressed(BuildContext context, PlaceEntity place) {
    // AutoRouter.of(context).push(PlaceDetailScreenBuilder(place: place));
  }

  @override
  void onLikePressed(PlaceEntity place) {
    // _favoritesRepository.toggleFavorite(place);
  }

  // @override
  // bool isFavorite(PlaceEntity place) {
  //   // return _favoritesRepository.isFavorite(place);
  // }

  @override
  Future<void> loadPlaces() => _model.getPlaces();

  // @override
  // Future<void> searchPlaces(String query) => _model.searchPlaces(query);
}
