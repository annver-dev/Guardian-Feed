import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'tables.dart';

part 'database.g.dart';

@DriftDatabase(tables: [News])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Запросы для работы с новостями:
  Future<List<New>> getAllNews() => select(news).get();
  Future<List<New>> getFavoriteNews() => (select(news)..where((tbl) => tbl.isFavorite)).get();
  Future<int> insertNews(NewsCompanion entry) => into(news).insert(entry);
  Future<bool> updateNews(NewsCompanion entry) => update(news).replace(entry);
  Future<int> deleteNews(int id) => (delete(news)..where((tbl) => tbl.id.equals(id))).go();
  Future<New?> getNewsByApiId(String apiId) => (select(news)..where((tbl) => tbl.newsId.equals(apiId))).getSingleOrNull();
  Future<int> toggleFavorite(String apiId, bool isFavorite) => 
    (update(news)..where((tbl) => tbl.newsId.equals(apiId))).write(NewsCompanion(isFavorite: Value(isFavorite)));
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'app.db'));
    return NativeDatabase.createInBackground(file);
  });
}
