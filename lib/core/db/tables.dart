import 'package:drift/drift.dart';

@DataClassName('NewsItemDb')
class News extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get newsId => text().unique()(); // ID новости из API
  TextColumn get type => text()();
  TextColumn get sectionId => text()();
  TextColumn get sectionName => text()();
  DateTimeColumn get publicationDate => dateTime()();
  TextColumn get title => text()();
  TextColumn get webUrl => text()();
  TextColumn get apiUrl => text()();
  BoolColumn get isHosted => boolean()();
  TextColumn get pillarId => text()();
  TextColumn get pillarName => text()();

  // Поля из NewsFieldsEntity
  TextColumn get body => text().nullable()();
  TextColumn get thumbnail => text().nullable()();
  TextColumn get author => text().nullable()();

  // Поле для избранного
  BoolColumn get isFavorite => boolean().withDefault(const Constant(false))();

  // Дата добавления в избранное
  DateTimeColumn get dateAdded =>
      dateTime().withDefault(Constant(DateTime.now()))();
}
