import 'package:places_search/core/db/database.dart';
import 'package:places_search/core/db/tables.dart';
import 'package:places_search/features/news/domain/enitites/news_fields_entity.dart';

class NewsItemEntity {
  final String id;
  final String type;
  final String sectionId;
  final String sectionName;
  final DateTime publicationDate;
  final String title;
  final String webUrl;
  final String apiUrl;
  final bool isHosted;
  final String pillarId;
  final String pillarName;
  final NewsFieldsEntity? fields;
  final bool isFavorite;

  NewsItemEntity({
    required this.id,
    required this.type,
    required this.sectionId,
    required this.sectionName,
    required this.publicationDate,
    required this.title,
    required this.webUrl,
    required this.apiUrl,
    required this.isHosted,
    required this.pillarId,
    required this.pillarName,
    required this.fields,
    this.isFavorite = false,
  });

  NewsItemEntity copyWith({
    String? id,
    String? type,
    String? sectionId,
    String? sectionName,
    DateTime? publicationDate,
    String? title,
    String? webUrl,
    String? apiUrl,
    bool? isHosted,
    String? pillarId,
    String? pillarName,
    NewsFieldsEntity? fields,
    bool? isFavorite,
  }) {
    return NewsItemEntity(
      id: id ?? this.id,
      type: type ?? this.type,
      sectionId: sectionId ?? this.sectionId,
      sectionName: sectionName ?? this.sectionName,
      publicationDate: publicationDate ?? this.publicationDate,
      title: title ?? this.title,
      webUrl: webUrl ?? this.webUrl,
      apiUrl: apiUrl ?? this.apiUrl,
      isHosted: isHosted ?? this.isHosted,
      pillarId: pillarId ?? this.pillarId,
      pillarName: pillarName ?? this.pillarName,
      fields: fields ?? this.fields,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
