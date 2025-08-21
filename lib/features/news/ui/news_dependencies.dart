import 'package:places_search/api/service/api_client.dart';
import 'package:places_search/features/common/data/converters/news_converter.dart';
import 'package:places_search/features/news/data/repositories/news_repository.dart';
import 'package:places_search/features/news/domain/reposiotries/i_news_repository.dart';
import 'package:places_search/features/news/ui/screens/news_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

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
