import 'package:drift/drift.dart';
import 'package:drift_sqflite/drift_sqflite.dart';
import 'package:flutter/foundation.dart';
import 'tables.dart';
part 'database.g.dart';

@DriftDatabase(tables: [News])
class AppDatabase extends _$AppDatabase {
  static AppDatabase? _instance;

  AppDatabase._() : super(_openConnection());

  static AppDatabase get instance {
    try {
      _instance ??= AppDatabase._();
      return _instance!;
    } catch (e) {
      debugPrint('Ошибка при создании базы данных: $e');
      _instance = null;
      _instance = AppDatabase._();
      return _instance!;
    }
  }

  @override
  int get schemaVersion => 1;

  // Запросы для работы с новостями:
  Future<List<NewsItemDb>> getAllNews() => select(news).get();
  Future<List<NewsItemDb>> getFavoriteNews() =>
      (select(news)..where((tbl) => tbl.isFavorite)).get();
  Future<int> insertNews(NewsCompanion entry) => into(news).insert(entry);
  Future<bool> updateNews(NewsItemDb entry) => update(news).replace(entry);
  Future<int> deleteNews(int id) =>
      (delete(news)..where((tbl) => tbl.id.equals(id))).go();
  Future<NewsItemDb?> getNewsByApiId(String apiId) =>
      (select(news)..where((tbl) => tbl.newsId.equals(apiId))).getSingleOrNull();
  Future<int> toggleFavorite(String apiId, bool isFavorite) => (update(news)
    ..where(
      (tbl) => tbl.newsId.equals(apiId),
    )).write(NewsCompanion(isFavorite: Value(isFavorite)));
}

DatabaseConnection _openConnection() {
  return DatabaseConnection(
    SqfliteQueryExecutor.inDatabaseFolder(
      path: 'app_database.db',
      logStatements: kDebugMode,
    ),
  );
}
