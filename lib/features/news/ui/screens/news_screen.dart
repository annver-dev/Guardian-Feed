import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places_search/assets/images/app_svg_icons.dart';
import 'package:places_search/assets/strings/app_strings.dart';
import 'package:places_search/features/news/domain/enitites/news_state.dart';
import 'package:places_search/features/news/ui/screens/news_wm.dart';
import 'package:places_search/features/news/ui/widgets/news_card_widget.dart';

@RoutePage()
class NewsScreen extends StatelessWidget {
  final INewsWM wm;

  const NewsScreen({required this.wm, super.key});

  @override
  Widget build(BuildContext context) {
    final _searchDebouncer = Debouncer(delay: Duration(milliseconds: 500));
    return Scaffold(
      body: ValueListenableBuilder<NewsState>(
        valueListenable: wm.newsStateListenable,
        builder: (context, news, _) {
          return NestedScrollView(
            headerSliverBuilder:
                (_, __) => [
                  SliverAppBar(
                    title: const Text(AppStrings.placesScreenAppBarTitle),
                    floating: true,
                    snap: true,
                    bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(60),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            hintText: 'Поиск по названию',
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SvgPicture.asset(
                                width: 6,
                                height: 6,
                                AppSvgIcons.icSearch,
                              ),
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SvgPicture.asset(
                                width: 6,
                                height: 6,
                                AppSvgIcons.icClear,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              _searchDebouncer.run(() {
                                // wm.searchPlaces(value);
                              });
                            } else {
                              wm.loadNews();
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
            body: RefreshIndicator.adaptive(
              onRefresh: wm.loadNews,
              child: switch (news) {
                NewsStateLoading() => Center(
                  child: Text(AppStrings.placesLoading),
                ),
                NewsStateFailure(:final failure) => Center(
                  child: Text('${AppStrings.placesError}$failure'),
                ),
                NewsStateData(:final news) => ListView.separated(
                  padding: const EdgeInsets.only(
                    top: 16,
                    left: 16,
                    right: 16,
                    bottom: 32,
                  ),
                  itemCount: news.items.length,
                  itemBuilder: (context, index) {
                    final newsItem = news.items[index];
                    return PlaceCardWidget(
                      newsItemEntity: newsItem,
                      onCardTap: () => wm.onNewsPressed(context, newsItem),

                      onLikeTap: () => wm.onLikePressed(newsItem),
                      isFavorite: newsItem.isFavorite,
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(height: 24),
                ),
              },
            ),
          );
        },
      ),
    );
  }
}

class Debouncer {
  final Duration delay;
  Timer? _timer;

  Debouncer({required this.delay});

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(delay, action);
  }

  void dispose() {
    _timer?.cancel();
  }
}
