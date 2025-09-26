import 'package:flutter/material.dart';
import 'package:places_search/features/news/domain/enitites/news_item_entity.dart';
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

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    if (difference.inDays > 0) {
      return '${difference.inDays} дн. назад';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} ч. назад';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} мин. назад';
    } else {
      return 'Только что';
    }
  }

  @override
  Widget build(BuildContext context) {
    var cardHeight = MediaQuery.of(context).size.height * 0.25;
    var imageHeight = cardHeight * 0.45;
    final colorTheme = AppColorTheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return Container(
      height: cardHeight,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Material(
        color: colorTheme.newsCardBackground,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        clipBehavior: Clip.antiAlias,
        elevation: 2,

        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: imageHeight,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
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
                // Content section
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Section badge with urgent indicator
                        Row(
                          children: [
                            if (newsItemEntity.sectionName
                                    .toLowerCase()
                                    .contains('политика') ||
                                newsItemEntity.sectionName
                                    .toLowerCase()
                                    .contains('важно'))
                              Container(
                                decoration: BoxDecoration(
                                  color: colorTheme.newsUrgent,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                margin: const EdgeInsets.only(right: 8),
                                child: Text(
                                  'СРОЧНО',
                                  style: textTheme.smallBold.copyWith(
                                    color: colorTheme.neutralWhite,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            Container(
                              decoration: BoxDecoration(
                                color: colorTheme.inactive,
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
                                  color: colorTheme.textSecondary,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Expanded(
                          child: Text(
                            newsItemEntity.title,
                            style: textTheme.textMedium.copyWith(
                              color: colorTheme.newsText,
                              fontWeight: FontWeight.w600,
                              height: 1.3,
                            ),
                            maxLines: 2,
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
                            Text(
                              _formatDate(newsItemEntity.publicationDate),
                              style: textTheme.small.copyWith(
                                color: colorTheme.newsSubtext,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned.fill(
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(onTap: onCardTap),
              ),
            ),
            Positioned(
              top: 12,
              right: 12,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: onLikeTap,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color:
                        isFavorite
                            ? colorTheme.newsUrgent
                            : colorTheme.inactive,
                    size: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
