import 'package:json_annotation/json_annotation.dart';
import 'package:places_search/api/data/news_item_dto.dart';
part 'news_response_dto.g.dart';

@JsonSerializable()
class NewsWrapperDto {
  @JsonKey(name: 'response')
  final NewsResponseDto response;

  NewsWrapperDto({required this.response});

  factory NewsWrapperDto.fromJson(Map<String, dynamic> json) =>
      _$NewsWrapperDtoFromJson(json);

  Map<String, dynamic> toJson() => _$NewsWrapperDtoToJson(this);
}

@JsonSerializable()
class NewsResponseDto {
  final String status;
  final String userTier;
  final int total;
  final int startIndex;
  final int pageSize;
  final int currentPage;
  final int pages;
  final String orderBy;
  @JsonKey(name: 'results')
  final List<NewsItemDto> newsItems;

  NewsResponseDto({
    required this.status,
    required this.userTier,
    required this.total,
    required this.startIndex,
    required this.pageSize,
    required this.currentPage,
    required this.pages,
    required this.orderBy,
    required this.newsItems,
  });

  factory NewsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$NewsResponseDtoToJson(this);
}
