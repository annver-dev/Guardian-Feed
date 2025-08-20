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
  });
}
