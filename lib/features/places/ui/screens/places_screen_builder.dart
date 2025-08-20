import 'package:flutter/material.dart';
import 'package:places_search/features/common/domain/repositories/i_favorites_repository.dart';
import 'package:places_search/features/places/ui/places_dependencies.dart';
import 'package:places_search/features/places/ui/screens/places_model.dart';
import 'package:places_search/features/places/ui/screens/places_screen.dart';
import 'package:places_search/features/places/ui/screens/places_wm.dart';
import 'package:provider/provider.dart';

/// Билдер для экрана списка мест.
class PlacesScreenBuilder extends StatelessWidget {
  const PlacesScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...NewsDependencies.providers(),
        Provider<INewsWM>(
          create:
              (context) => NewsWM(
                context.read<INewsModel>(),
                // context.read<IFavoritesRepository>(),
              ),
        ),
      ],
      child: Builder(
        builder: (context) => NewsScreen(wm: context.read<INewsWM>()),
      ),
    );
  }
}
