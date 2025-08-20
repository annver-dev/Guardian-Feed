import 'package:flutter/foundation.dart';
import 'package:places_search/core/domain/entities/failure/failure.dart';
import 'package:places_search/features/common/domain/enitities/news_response_entity.dart';
import 'package:places_search/features/places/domain/enitites/liked_place_entity.dart';

/// Состояния экрана мест.
@immutable
sealed class NewsState {
  const NewsState();
}

/// Состояние загрузки.
final class NewsStateLoading extends NewsState {
  const NewsStateLoading();
}

/// Состояние ошибки.
final class NewsStateFailure extends NewsState {
  /// Ошибка.
  final Failure failure;

  const NewsStateFailure(this.failure);

  @override
  int get hashCode => failure.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsStateFailure &&
          runtimeType == other.runtimeType &&
          failure == other.failure;
}

/// Состояние с данными.
final class NewsStateData extends NewsState {
  /// Список мест.
  final NewsResponseEntity news;

  const NewsStateData(this.news);

  @override
  int get hashCode => news.hashCode;

  // @override
  // bool operator ==(Object other) =>
  //     identical(this, other) ||
  //     other is NewsStateData &&
  //         runtimeType == other.runtimeType &&
  //         listEquals(news, other.news);
}
