import 'package:places_search/api/service/api_client.dart';
import 'package:places_search/core/data/repositories/base_repository.dart';
import 'package:places_search/core/domain/entities/result/request_operation.dart';
import 'package:places_search/features/common/data/converters/news_converter.dart';
import 'package:places_search/features/common/domain/enitities/news_response_entity.dart';
import 'package:places_search/features/news/domain/enitites/news_item_entity.dart';
import 'package:places_search/features/news/domain/reposiotries/i_news_repository.dart';

/// Реализация [INewsRepository].
final class NewsRepository extends BaseRepository implements INewsRepository {
  final ApiClient _apiClient;
  final INewsResponseDtoToEntityConverter _newsResponseDtoToEntityConverter;
  final INewsDtoToEntityConverter _newsDtoToEntityConverter;

  NewsRepository({
    required ApiClient apiClient,
    required INewsResponseDtoToEntityConverter newsResponseDtoToEntityConverter,
    required INewsDtoToEntityConverter newsDtoToEntityConverter,
  }) : _apiClient = apiClient,
       _newsResponseDtoToEntityConverter = newsResponseDtoToEntityConverter,
       _newsDtoToEntityConverter = newsDtoToEntityConverter;

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

  @override
  RequestOperation<List<NewsItemEntity>> searchNews(
    String query, {
    int? limit,
    int? offset,
  }) async {
    return makeApiCall<List<NewsItemEntity>>(() async {
      final newsDtos = await _apiClient.searchNews(
        q: query,
        limit: limit,
        offset: offset,
      );
      final newsEntities =
          _newsDtoToEntityConverter.convertMultiple(newsDtos).toList();
      return newsEntities;
    });
  }
}
