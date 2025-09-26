import 'package:places_search/api/service/api_client.dart';
import 'package:places_search/core/data/repositories/base_repository.dart';
import 'package:places_search/core/domain/entities/result/request_operation.dart';
import 'package:places_search/features/common/data/converters/news_converter.dart';
import 'package:places_search/features/common/domain/enitities/news_response_entity.dart';
import 'package:places_search/features/news/domain/enitites/news_item_entity.dart';
import 'package:places_search/features/news/domain/reposiotries/i_news_repository.dart';
import 'package:places_search/features/news/domain/reposiotries/i_database_repository.dart';

/// Реализация [INewsRepository] с поддержкой кэширования.
final class NewsRepository extends BaseRepository implements INewsRepository {
  final ApiClient _apiClient;
  final INewsResponseDtoToEntityConverter _newsResponseDtoToEntityConverter;
  final INewsDtoToEntityConverter _newsDtoToEntityConverter;
  final INewsDataBaseRepository _databaseRepository;

  NewsRepository({
    required ApiClient apiClient,
    required INewsResponseDtoToEntityConverter newsResponseDtoToEntityConverter,
    required INewsDtoToEntityConverter newsDtoToEntityConverter,
    required INewsDataBaseRepository databaseRepository,
  }) : _apiClient = apiClient,
       _newsResponseDtoToEntityConverter = newsResponseDtoToEntityConverter,
       _newsDtoToEntityConverter = newsDtoToEntityConverter,
       _databaseRepository = databaseRepository;

  @override
  RequestOperation<NewsResponseEntity> getNews({bool forceRefresh = false}) {
    return makeApiCall<NewsResponseEntity>(() async {
      if (!forceRefresh) {
        final cachedNews = await _databaseRepository.getCachedNewsItems();
        if (cachedNews.isNotEmpty) {
          return NewsResponseEntity(
            items: cachedNews,
            totalResults: cachedNews.length,
          );
        }
      }

      // Получаем данные из API
      final newsDtos = await _apiClient.getNews();
      final newsResponseEntity = _newsResponseDtoToEntityConverter.convert(
        newsDtos.response,
      );

      // Кэшируем полученные данные
      await _databaseRepository.cacheNewsItems(newsResponseEntity.items);

      return newsResponseEntity;
    });
  }

  @override
  RequestOperation<List<NewsItemEntity>> searchNews(
    String query, {
    int? limit,
    int? offset,
    bool forceRefresh = false,
  }) async {
    return makeApiCall<List<NewsItemEntity>>(() async {
      // Для поиска всегда обращаемся к API, так как результаты могут изменяться
      final newsDtos = await _apiClient.searchNews(
        q: query,
        limit: limit,
        offset: offset,
      );
      final newsEntities =
          _newsDtoToEntityConverter.convertMultiple(newsDtos).toList();

      // Кэшируем результаты поиска
      if (newsEntities.isNotEmpty) {
        await _databaseRepository.cacheNewsItems(newsEntities);
      }

      return newsEntities;
    });
  }

  @override
  Future<List<NewsItemEntity>> getCachedNews() async {
    try {
      return await _databaseRepository.getCachedNewsItems();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<void> clearCache() async {}
}
