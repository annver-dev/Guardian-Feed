import 'package:places_search/api/data/news_fields_dto.dart';

class NewsFieldsEntity {
  final String? body;
  final String? thumbnail;
  final String? author;

  NewsFieldsEntity({this.body, this.thumbnail, this.author});

  static fromDto(NewsFieldsDto newsFieldsDto) {
    return NewsFieldsEntity(
      body: newsFieldsDto.body,
      thumbnail: newsFieldsDto.thumbnail,
      author: newsFieldsDto.author,
    );
  }
}
