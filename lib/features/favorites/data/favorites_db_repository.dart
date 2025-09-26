import 'package:drift/drift.dart';
import 'package:places_search/core/db/database.dart';
import 'package:places_search/features/common/data/converters/news_converter.dart';
import 'package:places_search/features/favorites/domain/i_database_repository.dart';
import 'package:places_search/features/news/domain/enitites/news_item_entity.dart';

class FavoritesDataBaseRepository implements IFavoritesDataBaseRepository {
  final AppDatabase _database;
  final INewsDbToEntityConverter _newsDbToEntityConverter;

  FavoritesDataBaseRepository(
    AppDatabase database,
    this._newsDbToEntityConverter,
  ) : _database = database;

  @override
  Future<List<NewsItemEntity?>> getFavoriteNews() async {
    return await _database.getFavoriteNews().then(
      (value) => value.map((e) => _newsDbToEntityConverter.convert(e)).toList(),
    );
  }

  @override
  Future<NewsItemEntity?> getNewsByApiId(String newsApiId) {
    return _database
        .getNewsByApiId(newsApiId)
        .then((value) => _newsDbToEntityConverter.convert(value));
  }

  @override
  Future<void> insertNews(NewsItemEntity news) {
    final companion = NewsCompanion(
      newsId: Value(news.id),
      type: Value(news.type),
      sectionId: Value(news.sectionId),
      sectionName: Value(news.sectionName),
      publicationDate: Value(news.publicationDate),
      title: Value(news.title),
      webUrl: Value(news.webUrl),
      apiUrl: Value(news.apiUrl),
      isHosted: Value(news.isHosted),
      pillarId: Value(news.pillarId),
      pillarName: Value(news.pillarName),
      body: Value(news.fields?.body),
      thumbnail: Value(
        news.fields?.thumbnail?.isNotEmpty == true
            ? news.fields!.thumbnail
            : null,
      ),
      author: Value(news.fields?.author),
      isFavorite: Value(news.isFavorite),
    );
    return _database.insertNews(companion);
  }

  @override
  Future<void> toggleFavorite(String newsApiId, bool isFavorite) {
    return _database.toggleFavorite(newsApiId, isFavorite);
  }
}
