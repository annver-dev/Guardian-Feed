import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places_search/features/common/logic/format_date.dart';
import 'package:places_search/features/common/logic/get_section_color.dart';
import 'package:places_search/features/favorites/ui/favorites_detail_wm.dart';
import 'package:places_search/features/news/domain/enitites/news_item_entity.dart';
import 'package:places_search/uikit/themes/colors/app_color_theme.dart';
import 'package:places_search/uikit/themes/text/app_text_theme.dart';
import 'package:places_search/uikit/widgets/colored_container.dart';

class FavoritesDetailScreen extends StatefulWidget {
  final IFavoritesDetailWM wm;

  const FavoritesDetailScreen({super.key, required this.wm});

  @override
  State<FavoritesDetailScreen> createState() => _FavoritesDetailScreenState();
}

class _FavoritesDetailScreenState extends State<FavoritesDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final colorTheme = AppColorTheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return Scaffold(
      backgroundColor: colorTheme.scaffold,
      body: CustomScrollView(
        slivers: [
          // Gradient Header
          SliverAppBar(
            expandedHeight: 120,
            floating: false,
            pinned: true,
            backgroundColor: colorTheme.newsHeaderDark,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          colorTheme.newsHeaderDark,
                          colorTheme.newsHeaderLight,
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 16,
                    right: 16,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/heart_full.svg',
                          width: 32,
                          height: 32,
                          colorFilter: ColorFilter.mode(
                            colorTheme.neutralWhite,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Избранные новости',
                          style: textTheme.largeTitle.copyWith(
                            color: colorTheme.neutralWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Content
          ValueListenableBuilder<List<NewsItemEntity>>(
            valueListenable: widget.wm.favoritesListenable,
            builder: (context, favorites, child) {
              if (favorites.isEmpty) {
                return SliverFillRemaining(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: colorTheme.newsCardBackground,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 20,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/heart.svg',
                            width: 48,
                            height: 48,
                            colorFilter: ColorFilter.mode(
                              colorTheme.inactive,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Нет избранных новостей',
                          style: textTheme.title.copyWith(
                            color: colorTheme.textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Text(
                            'Добавьте новости в избранное, чтобы они появились здесь',
                            style: textTheme.text.copyWith(
                              color: colorTheme.textSecondary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }

              return SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final news = favorites[index];
                    return Dismissible(
                      key: Key(news.id),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: colorTheme.newsUrgent,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.delete_outline,
                              color: colorTheme.neutralWhite,
                              size: 28,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Удалить',
                              style: textTheme.small.copyWith(
                                color: colorTheme.neutralWhite,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      confirmDismiss: (direction) async {
                        return await showDialog<bool>(
                          context: context,
                          builder:
                              (context) => AlertDialog(
                                backgroundColor: colorTheme.newsCardBackground,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                title: Text(
                                  'Удалить из избранного?',
                                  style: textTheme.title.copyWith(
                                    color: colorTheme.newsText,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                content: Text(
                                  'Эта новость будет удалена из избранного',
                                  style: textTheme.text.copyWith(
                                    color: colorTheme.newsSubtext,
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed:
                                        () => Navigator.of(context).pop(false),
                                    child: Text(
                                      'Отмена',
                                      style: textTheme.text.copyWith(
                                        color: colorTheme.newsSubtext,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed:
                                        () => Navigator.of(context).pop(true),
                                    child: Text(
                                      'Удалить',
                                      style: textTheme.text.copyWith(
                                        color: colorTheme.newsUrgent,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                        );
                      },
                      onDismissed: (direction) {
                        widget.wm.onLikePressed(news);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Новость удалена из избранного',
                              style: textTheme.text.copyWith(
                                color: colorTheme.neutralWhite,
                              ),
                            ),
                            backgroundColor: colorTheme.newsHeaderDark,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            action: SnackBarAction(
                              label: 'Отменить',
                              textColor: colorTheme.neutralWhite,
                              onPressed: () {
                                widget.wm.onLikePressed(news);
                              },
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: colorTheme.newsCardBackground,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(16),
                            onTap: () {
                              widget.wm.onNewsPressed(context, news);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Container(
                                      width: 80,
                                      height: 80,
                                      color: colorTheme.surface,
                                      child:
                                          news.fields?.thumbnail != null &&
                                                  news
                                                      .fields!
                                                      .thumbnail!
                                                      .isNotEmpty
                                              ? Image.network(
                                                news.fields!.thumbnail!,
                                                fit: BoxFit.cover,
                                                errorBuilder:
                                                    (_, __, ___) => Icon(
                                                      Icons.image_not_supported,
                                                      color:
                                                          colorTheme.inactive,
                                                    ),
                                              )
                                              : Icon(
                                                Icons.image_not_supported,
                                                color: colorTheme.inactive,
                                              ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  // Content
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Section badge
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: _getSectionColor(
                                              news.sectionName,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          child: Text(
                                            news.sectionName.toUpperCase(),
                                            style: textTheme.superSmall
                                                .copyWith(
                                                  color:
                                                      colorTheme.neutralWhite,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        // Title
                                        Text(
                                          news.title,
                                          style: textTheme.textMedium.copyWith(
                                            color: colorTheme.newsText,
                                            fontWeight: FontWeight.w600,
                                            height: 1.3,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 8),

                                        Row(
                                          children: [
                                            Icon(
                                              Icons.access_time,
                                              size: 14,
                                              color: colorTheme.newsSubtext,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              formatDate(news.publicationDate),
                                              style: textTheme.small.copyWith(
                                                color: colorTheme.newsSubtext,
                                              ),
                                            ),
                                            const Spacer(),
                                            Icon(
                                              Icons.bookmark,
                                              color: colorTheme.newsHeaderDark,
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }, childCount: favorites.length),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Color _getSectionColor(String sectionName) {
    return getSectionColor(sectionName, context);
  }
}
