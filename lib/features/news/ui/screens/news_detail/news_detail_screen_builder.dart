import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:places_search/features/favorites/domain/i_favorites_repository.dart';
import 'package:places_search/features/news/domain/enitites/news_item_entity.dart';
import 'package:places_search/features/app/di/news_dependencies.dart';
import 'package:places_search/features/news/ui/screens/news_detail/news_detail_screen.dart';
import 'package:places_search/features/news/ui/screens/news_detail/news_detail_wm.dart';
import 'package:provider/provider.dart';

@RoutePage()
class NewsDetailScreenBuilder extends StatelessWidget {
  final NewsItemEntity news;

  const NewsDetailScreenBuilder({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...NewsDependencies.providers(),
        Provider<INewsDetailWM>(
          create:
              (context) => NewsDetailWM(context.read<IFavoritesRepository>()),
        ),
      ],
      child: Builder(
        builder: (context) {
          return NewsDetailScreen(
            wm: context.read<INewsDetailWM>(),
            news: news,
          );
        },
      ),
    );
  }
}
