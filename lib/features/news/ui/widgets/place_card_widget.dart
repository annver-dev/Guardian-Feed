import 'package:flutter/material.dart';
import 'package:places_search/features/news/domain/enitites/news_item_entity.dart';
import 'package:places_search/uikit/themes/colors/app_color_theme.dart';
import 'package:places_search/uikit/themes/text/app_text_theme.dart';

/// Тип карточки места.
enum PlaceCardType {
  /// Обычная карточка.
  place,

  /// Карточка в избранном.
  favorite,
}

/// Виджет карточки места.
class PlaceCardWidget extends StatelessWidget {
  /// Место.
  final NewsItemEntity newsItemEntity;

  /// Обработчик нажатия на карточку.
  final VoidCallback onCardTap;

  /// Обработчик нажатия на кнопку "лайк".
  // final VoidCallback onLikeTap;

  /// Тип карточки.
  final PlaceCardType cardType;

  /// Флаг, указывающий, добавлено ли место в избранное.
  // final bool isFavorite;

  const PlaceCardWidget({
    required this.newsItemEntity,
    required this.onCardTap,
    // required this.onLikeTap,
    this.cardType = PlaceCardType.place,
    // this.isFavorite = false,
    super.key,
  });

  static const _cardHeight = 250.0;
  static const _imageHeight = 96.0;

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
    final colorTheme = AppColorTheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return SizedBox(
      height: _cardHeight,
      child: Material(
        color: colorTheme.surface,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  height: _imageHeight,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.article_outlined, size: 32),
                      const SizedBox(height: 4),
                      Text(newsItemEntity.sectionName),
                    ],
                  ),
                ),
                // Content
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Отображение изображения новости
                        if (newsItemEntity.fields?.thumbnail != null)
                          Container(
                            height: 70,
                            width: double.infinity,
                            margin: const EdgeInsets.only(bottom: 8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                newsItemEntity.fields!.thumbnail!,
                                fit: BoxFit.cover,
                                errorBuilder:
                                    (_, __, ___) => Container(
                                      color: colorTheme.surface,
                                      child: const Center(
                                        child: Icon(Icons.image_not_supported),
                                      ),
                                    ),
                              ),
                            ),
                          ),

                        Text(
                          newsItemEntity.title,
                          style: textTheme.subtitle.copyWith(
                            color: colorTheme.textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Text(_formatDate(newsItemEntity.publicationDate)),
                        const Spacer(),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(newsItemEntity.pillarName),
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
            // Positioned(
            //   top: 8,
            //   right: 16,
            //   child: GestureDetector(
            //     behavior: HitTestBehavior.translucent,

            //     // onTap: onLikeTap,
            //     // child: Icon(
            //     //   isFavorite ? Icons.favorite : Icons.favorite_border,
            //     //   color:
            //     //       isFavorite ? colorTheme.error : colorTheme.neutralWhite,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
