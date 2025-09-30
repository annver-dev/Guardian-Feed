import 'package:drift/drift.dart';
import 'package:places_search/core/db/database.dart';
import 'package:places_search/features/common/data/converters/news_converter.dart';
import 'package:places_search/features/news/domain/enitites/news_item_entity.dart';
import 'package:places_search/features/news/domain/reposiotries/i_database_repository.dart';

class NewsDatabase extends INewsDataBaseRepository {
  final AppDatabase _database;
  final INewsDbToEntityConverter _newsDbToEntityConverter;
  NewsDatabase(this._database, this._newsDbToEntityConverter);

  @override
  Future<void> cacheNewsItems(List<NewsItemEntity> news) async {
    try {
      for (final newsItem in news) {
        final companion = NewsCompanion(
          newsId: Value(newsItem.id),
          type: Value(newsItem.type),
          sectionId: Value(newsItem.sectionId),
          sectionName: Value(newsItem.sectionName),
          publicationDate: Value(newsItem.publicationDate),
          title: Value(newsItem.title),
          webUrl: Value(newsItem.webUrl),
          apiUrl: Value(newsItem.apiUrl),
          isHosted: Value(newsItem.isHosted),
          pillarId: Value(newsItem.pillarId),
          pillarName: Value(newsItem.pillarName),
          body: Value(newsItem.fields?.body),
          thumbnail: Value(
            newsItem.fields?.thumbnail?.isNotEmpty == true
                ? newsItem.fields!.thumbnail
                : null,
          ),
          author: Value(newsItem.fields?.author),
          isFavorite: Value(newsItem.isFavorite),
        );
        await _database.insertNews(companion);
      }
    } catch (e) {}
  }

  @override
  Future<List<NewsItemEntity>> getCachedNewsItems() async {
    try {
      final newsData = await _database.getAllNews();
      return newsData.map((news) => _convertToEntity(news)).toList();
    } catch (e) {
      return [];
    }
  }

  NewsItemEntity _convertToEntity(NewsItemDb news) {
    return _newsDbToEntityConverter.convert(news);
  }
}
