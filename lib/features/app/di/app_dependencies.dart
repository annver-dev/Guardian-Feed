import 'package:dio/dio.dart';
import 'package:places_search/api/service/api_client.dart';
import 'package:places_search/api/service/api_key_interceptor.dart';
import 'package:places_search/features/common/domain/repositories/i_favorites_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

/// Класс с зависимостями приложения.
abstract class AppDependencies {
  static List<SingleChildWidget> providers() {
    const timeout = Duration(seconds: 30);

    final dio = Dio()..interceptors.add(ApiKeyInterceptor());

    dio.options
      ..baseUrl = 'https://content.guardianapis.com'
      ..connectTimeout = timeout
      ..receiveTimeout = timeout
      ..sendTimeout = timeout;

    final apiClient = ApiClient(dio);
    return [
      Provider<ApiClient>(create: (_) => apiClient),
      // Provider<IFavoritesRepository>(create: (_) => FavoritesRepository()),
    ];
  }
}
