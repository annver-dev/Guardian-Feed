import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places_search/assets/images/app_svg_icons.dart';
import 'package:places_search/assets/strings/app_strings.dart';
import 'package:places_search/features/news/domain/enitites/news_state.dart';
import 'package:places_search/features/news/ui/screens/news_wm.dart';
import 'package:places_search/features/news/ui/widgets/header_title_widget.dart';
import 'package:places_search/features/news/ui/widgets/news_card_widget.dart';
import 'package:places_search/features/news/ui/widgets/search_news_widget.dart';
import 'package:places_search/uikit/themes/colors/app_color_theme.dart';
import 'package:places_search/uikit/widgets/colored_container.dart';
import 'package:provider/provider.dart';

@RoutePage()
class NewsScreen extends StatelessWidget {
  final INewsWM wm;

  const NewsScreen({required this.wm, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<NewsState>(
        valueListenable: wm.newsStateListenable,
        builder: (context, news, _) {
          return RefreshIndicator.adaptive(
            onRefresh: wm.loadNews,
            child: CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: CustomHeaderDelegate(minHeight: 60, maxHeight: 200),
                ),
                switch (news) {
                  NewsStateLoading() => SliverFillRemaining(
                    child: Center(child: Text(AppStrings.placesLoading)),
                  ),
                  NewsStateFailure(:final failure) => SliverFillRemaining(
                    child: Center(
                      child: Text('${AppStrings.placesError}$failure'),
                    ),
                  ),
                  NewsStateData(:final news) => SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final newsItem = news.items[index];
                      return ValueListenableBuilder(
                        valueListenable: wm.favoritesListenable,
                        builder: (context, favorites, child) {
                          final isFavorite = wm.isFavorite(newsItem);
                          return PlaceCardWidget(
                            newsItemEntity: newsItem,
                            onCardTap:
                                () => wm.onNewsPressed(context, newsItem),
                            onLikeTap: () => wm.onLikePressed(newsItem),
                            isFavorite: isFavorite,
                          );
                        },
                      );
                    }, childCount: news.items.length),
                  ),
                },
              ],
            ),
          );
        },
      ),
    );
  }
}

class CustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  const CustomHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
  });

  final double minHeight;
  final double maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final progress = (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0);
    final colorTheme = AppColorTheme.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(color: colorTheme.newsHeaderDark),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ColoredContainer(progress: progress),
          HeaderTitle(progress: progress),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant CustomHeaderDelegate oldDelegate) {
    return minHeight != oldDelegate.minHeight ||
        maxHeight != oldDelegate.maxHeight;
  }
}
