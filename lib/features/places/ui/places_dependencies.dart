import 'package:places_search/api/service/api_client.dart';
import 'package:places_search/features/common/data/converters/news_converter.dart';

import 'package:places_search/features/common/domain/repositories/i_favorites_repository.dart';
import 'package:places_search/features/places/data/repositories/places_repository.dart';
import 'package:places_search/features/places/domain/reposiotries/i_places_repository.dart';
import 'package:places_search/features/places/ui/screens/places_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

/// Зависимости для экрана мест.
abstract class NewsDependencies {
  static List<SingleChildWidget> providers() {
    return [
      Provider<INewsDtoToEntityConverter>(
        create: (context) => NewsItemDtoToEntityConverter(),
      ),
      Provider<INewsResponseDtoToEntityConverter>(
        create:
            (context) => NewsResponseDtoToEntityConverter(
              context.read<INewsDtoToEntityConverter>(),
            ),
      ),
      Provider<INewsRepository>(
        create:
            (context) => NewsRepository(
              apiClient: context.read<ApiClient>(),
              newsResponseDtoToEntityConverter:
                  context.read<INewsResponseDtoToEntityConverter>(),
            ),
      ),
      Provider<INewsModel>(
        create:
            (context) => NewsModel(
              newsRepository: context.read<INewsRepository>(),
              // favoritesRepository: context.read<IFavoritesRepository>(),
            ),
      ),
    ];
  }
}
