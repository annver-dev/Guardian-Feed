import 'package:places_search/api/data/news_fields_dto.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:places_search/api/data/news_response_dto.dart';
part 'news_item_dto.g.dart';

@JsonSerializable()
class NewsItemDto {
  final String id;
  final String type;
  final String sectionId;
  final String sectionName;
  @JsonKey(name: 'webPublicationDate')
  final DateTime publicationDate;
  @JsonKey(name: 'webTitle')
  final String title;
  @JsonKey(name: 'webUrl')
  final String url;
  final String apiUrl;
  final bool isHosted;
  final String pillarId;
  final String pillarName;
  @JsonKey(name: 'fields')
  final NewsFieldsDto? fields;

  NewsItemDto({
    required this.id,
    required this.type,
    required this.sectionId,
    required this.sectionName,
    required this.publicationDate,
    required this.title,
    required this.url,
    required this.apiUrl,
    required this.isHosted,
    required this.pillarId,
    required this.pillarName,
    this.fields,
  });

  factory NewsItemDto.fromJson(Map<String, dynamic> json) =>
      _$NewsItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$NewsItemDtoToJson(this);
}
