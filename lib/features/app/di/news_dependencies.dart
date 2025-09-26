import 'dart:convert';

import 'package:places_search/api/data/news_response_dto.dart';
import 'package:places_search/api/service/api_client.dart';
import 'package:places_search/core/db/database.dart';
import 'package:places_search/features/common/data/converters/news_converter.dart';
import 'package:places_search/features/common/domain/enitities/news_response_entity.dart';
import 'package:places_search/features/favorites/data/favorites_db_repository.dart';
import 'package:places_search/features/favorites/data/favorites_repository.dart';
import 'package:places_search/features/favorites/domain/i_database_repository.dart';
import 'package:places_search/features/favorites/domain/i_favorites_repository.dart';
import 'package:places_search/features/news/data/repositories/news_repository.dart';
import 'package:places_search/features/news/data/repositories/news_db_repository.dart';
import 'package:places_search/features/news/domain/reposiotries/i_news_repository.dart';
import 'package:places_search/features/news/domain/reposiotries/i_database_repository.dart';
import 'package:places_search/features/news/ui/screens/news_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

abstract class NewsDependencies {
  static List<SingleChildWidget> providers() {
    return [
      Provider<INewsDbToEntityConverter>(
        create: (context) => NewsDbToEntityConverter(),
      ),
      Provider<INewsDtoToEntityConverter>(
        create: (context) => NewsItemDtoToEntityConverter(),
      ),
      Provider<INewsResponseDtoToEntityConverter>(
        create:
            (context) => NewsResponseDtoToEntityConverter(
              context.read<INewsDtoToEntityConverter>(),
            ),
      ),

      Provider<INewsDataBaseRepository>(
        create:
            (context) => NewsDatabase(
              AppDatabase.instance,
              context.read<INewsDbToEntityConverter>(),
            ),
      ),
      Provider<IFavoritesDataBaseRepository>(
        create:
            (context) => FavoritesDataBaseRepository(
              AppDatabase.instance,
              context.read<INewsDbToEntityConverter>(),
            ),
      ),
      Provider<IFavoritesRepository>(
        create:
            (context) => FavoritesRepository(
              database: context.read<IFavoritesDataBaseRepository>(),
            ),
      ),
      Provider<INewsDtoToEntityConverter>(
        create: (context) => NewsItemDtoToEntityConverter(),
      ),

      Provider<INewsRepository>(
        create:
            (context) => NewsRepository(
              apiClient: context.read<ApiClient>(),
              newsResponseDtoToEntityConverter:
                  context.read<INewsResponseDtoToEntityConverter>(),
              newsDtoToEntityConverter:
                  context.read<INewsDtoToEntityConverter>(),
              databaseRepository: context.read<INewsDataBaseRepository>(),
            ),
      ),

      Provider<INewsModel>(
        create:
            (context) => NewsModel(
              newsRepository: context.read<INewsRepository>(),
              favoritesRepository: context.read<IFavoritesRepository>(),
            ),
      ),
    ];
  }
}
