import 'package:flutter/material.dart';
import 'package:places_search/features/common/domain/repositories/i_favorites_repository.dart';
import 'package:places_search/features/news/ui/news_dependencies.dart';
import 'package:places_search/features/news/ui/screens/news_model.dart';
import 'package:places_search/features/news/ui/screens/news_screen.dart';
import 'package:places_search/features/news/ui/screens/news_wm.dart';
import 'package:provider/provider.dart';

class NewsScreenBuilder extends StatelessWidget {
  const NewsScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...NewsDependencies.providers(),
        Provider<INewsWM>(
          create:
              (context) => NewsWM(
                context.read<INewsModel>(),
                context.read<IFavoritesRepository>(),
              ),
        ),
      ],
      child: Builder(
        builder: (context) => NewsScreen(wm: context.read<INewsWM>()),
      ),
    );
  }
}
