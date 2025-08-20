import 'package:json_annotation/json_annotation.dart';
part 'news_fields_dto.g.dart';

@JsonSerializable()
class NewsFieldsDto {
  final String? body;
  final String? thumbnail;
  final String? author;

  NewsFieldsDto({this.body, this.thumbnail, this.author});

  factory NewsFieldsDto.fromJson(Map<String, dynamic> json) =>
      _$NewsFieldsDtoFromJson(json);
}
