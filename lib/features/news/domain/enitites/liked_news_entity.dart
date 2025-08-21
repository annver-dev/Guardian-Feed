import 'package:equatable/equatable.dart';
import 'package:places_search/features/news/domain/enitites/news_item_entity.dart';

/// Entity that combines information about a [NewsItemEntity] and whether it is currently liked (added to favourites).
class LikedNewsEntity extends Equatable {
  const LikedNewsEntity({required this.news, required this.isFavorite});
  final NewsItemEntity news;
  final bool isFavorite;
  @override
  List<Object?> get props => [news, isFavorite];
}
