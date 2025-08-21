import 'package:drift/drift.dart';
import 'package:places_search/core/db/database.dart';
import 'package:places_search/features/news/domain/enitites/news_item_entity.dart';
import 'package:places_search/features/news/domain/enitites/news_fields_entity.dart';
import 'package:places_search/features/news/domain/reposiotries/i_database_repository.dart';

class NewsDatabase extends NewsDataBaseRepository {
  final AppDatabase _database;
  NewsDatabase(this._database);

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
          body: Value(newsItem.fields?.body ?? ''),
          thumbnail: Value(newsItem.fields?.thumbnail ?? ''),
          author: Value(newsItem.fields?.author ?? ''),
          isFavorite: Value(newsItem.isFavorite),
        );
        await _database.insertNews(companion);
      }
    } catch (e) {
      // Логируем ошибку, но не прерываем выполнение
      // Логируем ошибку, но не прерываем выполнение
      // print('Ошибка при сохранении новостей: $e');
    }
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

  NewsItemEntity _convertToEntity(New news) {
    return NewsItemEntity(
      id: news.newsId,
      type: news.type,
      sectionId: news.sectionId,
      sectionName: news.sectionName,
      publicationDate: news.publicationDate,
      title: news.title,
      webUrl: news.webUrl,
      apiUrl: news.apiUrl,
      isHosted: news.isHosted,
      pillarId: news.pillarId,
      pillarName: news.pillarName,
      fields: NewsFieldsEntity(
        body: news.body != null && news.body!.isNotEmpty ? news.body : null,
        thumbnail:
            news.thumbnail != null && news.thumbnail!.isNotEmpty
                ? news.thumbnail
                : null,
        author:
            news.author != null && news.author!.isNotEmpty ? news.author : null,
      ),
      isFavorite: news.isFavorite,
    );
  }
}
