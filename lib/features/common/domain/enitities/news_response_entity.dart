import 'package:places_search/features/news/news_item.dart';

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
