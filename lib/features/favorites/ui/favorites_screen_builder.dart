import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:places_search/features/favorites/domain/i_favorites_repository.dart';
import 'package:places_search/features/favorites/ui/favorites_detail_wm.dart';
import 'package:places_search/features/favorites/ui/favorites_screen.dart';
import 'package:places_search/features/app/di/news_dependencies.dart';
import 'package:provider/provider.dart';

@RoutePage()
class FavoritesScreenBuilder extends StatelessWidget {
  const FavoritesScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...NewsDependencies.providers(),
        Provider<IFavoritesDetailWM>(
          create:
              (context) =>
                  FavoritesDetailWM(context.read<IFavoritesRepository>()),
        ),
      ],
      child: Builder(
        builder: (context) {
          return FavoritesDetailScreen(wm: context.read<IFavoritesDetailWM>());
        },
      ),
    );
  }
}
