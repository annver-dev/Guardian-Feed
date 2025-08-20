import 'package:places_search/api/data/news_fields_dto.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:places_search/api/data/news_response_dto.dart';
part 'news_item_dto.g.dart';

@JsonSerializable()
class NewsItemDto {
  final String id;
  final String type;
  @JsonKey(name: 'webTitle')
  final String title;
  @JsonKey(name: 'webUrl')
  final String url;
  @JsonKey(name: 'webPublicationDate')
  final DateTime publicationDate;
  @JsonKey(name: 'fields')
  final NewsFieldsDto? fields;

  NewsItemDto({
    required this.id,
    required this.type,
    required this.title,
    required this.url,
    required this.publicationDate,
    this.fields,
  });

  factory NewsItemDto.fromJson(Map<String, dynamic> json) =>
      _$NewsItemDtoFromJson(json);
}
