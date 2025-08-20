import 'package:places_search/api/data/news_item_dto.dart';
import 'package:places_search/api/data/news_response_dto.dart';
import 'package:places_search/core/data/converter/converter.dart';
import 'package:places_search/features/common/domain/enitities/news_response_entity.dart';
import 'package:places_search/features/news/domain/enitites/news_fields_entity.dart';
import 'package:places_search/features/news/domain/enitites/news_item_entity.dart';

/// Конвертер из [NewsItemDto] в [NewsItemEntity].
typedef INewsDtoToEntityConverter = Converter<NewsItemEntity, NewsItemDto>;

/// Реализация [IPlaceDtoToEntityConverter].
final class NewsItemDtoToEntityConverter extends INewsDtoToEntityConverter {
  /// Конвертер для типа места.

  const NewsItemDtoToEntityConverter();

  @override
  NewsItemEntity convert(NewsItemDto input) {
    return NewsItemEntity(
      id: input.id,
      type: input.type,
      sectionId: input.sectionId,
      sectionName: input.sectionName,
      publicationDate: input.publicationDate,
      title: input.title,
      webUrl: input.url,
      apiUrl: input.apiUrl,
      isHosted: input.isHosted,
      pillarId: input.pillarId,
      pillarName: input.pillarName,
      fields:
          input.fields != null ? NewsFieldsEntity.fromDto(input.fields!) : null,
    );
  }
}

/// Конвертер из [NewsResponseDto] в [NewsResponseEntity].
typedef INewsResponseDtoToEntityConverter =
    Converter<NewsResponseEntity, NewsResponseDto>;

final class NewsResponseDtoToEntityConverter
    extends INewsResponseDtoToEntityConverter {
  final INewsDtoToEntityConverter _itemConverter;

  NewsResponseDtoToEntityConverter(this._itemConverter);

  NewsResponseEntity convert(NewsResponseDto dto) {
    return NewsResponseEntity(
      items: dto.newsItems.map<NewsItemEntity>(_itemConverter.convert).toList(),
      totalResults: dto.total,
    );
  }
}
