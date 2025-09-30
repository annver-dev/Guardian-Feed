import 'package:places_search/api/data/news_fields_dto.dart';
import 'package:places_search/core/db/database.dart';

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

  static fromDb(NewsItemDb dbItem) {
    return NewsFieldsEntity(
      body: dbItem.body,
      thumbnail: dbItem.thumbnail,
      author: dbItem.author,
    );
  }
}
