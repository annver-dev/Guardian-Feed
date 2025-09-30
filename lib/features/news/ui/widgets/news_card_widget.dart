import 'package:flutter/material.dart';
import 'package:places_search/features/common/logic/format_date.dart';
import 'package:places_search/features/common/logic/get_section_color.dart';
import 'package:places_search/features/news/domain/enitites/news_item_entity.dart';
import 'package:places_search/uikit/buttons/bookmark_button.dart';
import 'package:places_search/uikit/themes/colors/app_color_theme.dart';
import 'package:places_search/uikit/themes/text/app_text_theme.dart';

enum PlaceCardType { place, favorite }

class PlaceCardWidget extends StatelessWidget {
  final NewsItemEntity newsItemEntity;
  final VoidCallback onCardTap;
  final VoidCallback onLikeTap;
  final PlaceCardType cardType;

  final bool isFavorite;

  const PlaceCardWidget({
    required this.newsItemEntity,
    required this.onCardTap,
    required this.onLikeTap,
    this.cardType = PlaceCardType.place,
    this.isFavorite = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cardHeight = MediaQuery.of(context).size.height * 0.15;
    var imageWidth = cardHeight * 1.2;
    final colorTheme = AppColorTheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return InkWell(
      onTap: onCardTap,
      child: Container(
        height: cardHeight,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Material(
          color: colorTheme.newsCardBackground,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          clipBehavior: Clip.antiAlias,
          elevation: 2,

          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    width: imageWidth,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(16),
                      ),
                      child:
                          (newsItemEntity.fields?.thumbnail != null &&
                                  newsItemEntity.fields!.thumbnail!.isNotEmpty)
                              ? Image.network(
                                newsItemEntity.fields!.thumbnail!,
                                fit: BoxFit.cover,
                                errorBuilder:
                                    (_, __, ___) => Container(
                                      color: colorTheme.surface,
                                      child: const Center(
                                        child: Icon(Icons.image_not_supported),
                                      ),
                                    ),
                              )
                              : Container(
                                color: colorTheme.surface,
                                child: const Center(
                                  child: Icon(Icons.image_not_supported),
                                ),
                              ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Категория новости
                          Container(
                            decoration: BoxDecoration(
                              color: getSectionColor(
                                newsItemEntity.sectionName,
                                context,
                              ),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: colorTheme.inactive,
                                width: 1,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            child: Text(
                              newsItemEntity.sectionName,
                              style: textTheme.smallBold.copyWith(
                                color: colorTheme.neutralWhite,
                                fontSize: 11,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Expanded(
                            child: Text(
                              newsItemEntity.title,
                              style: textTheme.textMedium.copyWith(
                                color: colorTheme.newsText,
                                fontWeight: FontWeight.w600,
                                height: 1.3,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                size: 14,
                                color: colorTheme.newsSubtext,
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  formatDate(newsItemEntity.publicationDate),
                                  style: textTheme.small.copyWith(
                                    color: colorTheme.newsSubtext,
                                    fontSize: 12,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              InkWell(
                                onTap: onLikeTap,
                                child: BookmarkButton(isFavorite: isFavorite),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
