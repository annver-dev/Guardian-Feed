import 'package:places_search/api/service/api_client.dart';
import 'package:places_search/core/data/repositories/base_repository.dart';
import 'package:places_search/core/domain/entities/result/request_operation.dart';
import 'package:places_search/features/common/data/converters/news_converter.dart';
import 'package:places_search/features/common/domain/enitities/news_response_entity.dart';

import 'package:places_search/features/common/domain/enitities/place_entity.dart';
import 'package:places_search/features/news/news_item.dart';
import 'package:places_search/features/places/domain/reposiotries/i_places_repository.dart';

/// Реализация [INewsRepository].
final class NewsRepository extends BaseRepository implements INewsRepository {
  final ApiClient _apiClient;
  final INewsResponseDtoToEntityConverter _newsResponseDtoToEntityConverter;

  NewsRepository({
    required ApiClient apiClient,
    required INewsResponseDtoToEntityConverter newsResponseDtoToEntityConverter,
  }) : _apiClient = apiClient,
       _newsResponseDtoToEntityConverter = newsResponseDtoToEntityConverter;

  @override
  RequestOperation<NewsResponseEntity> getNews() {
    return makeApiCall<NewsResponseEntity>(() async {
      final newsDtos = await _apiClient.getNews();
      final newsResponseEntity = _newsResponseDtoToEntityConverter.convert(
        newsDtos.response,
      );
      return newsResponseEntity;
    });
  }

  // @override
  // RequestOperation<List<PlaceEntity>> searchPlaces(
  //   String query, {
  //   int? limit,
  //   int? offset,
  // }) async {
  //   return makeApiCall<List<PlaceEntity>>(() async {
  //     final placesDtos = await _apiClient.searchPlaces(
  //       q: query,
  //       limit: limit,
  //       offset: offset,
  //     );
  //     final placesEntities =
  //         _placeDtoToEntityConverter.convertMultiple(placesDtos).toList();
  //     return placesEntities;
  //   });
  // }
}
