import 'package:places_search/features/news/domain/enitites/news_item_entity.dart';

class NewsResponseEntity {
  final List<NewsItemEntity> items;
  final int totalResults;
  final bool hasMore;

  NewsResponseEntity({
    required this.items,
    required this.totalResults,
    this.hasMore = false,
  });
}
