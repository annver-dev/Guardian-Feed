import 'package:dio/dio.dart';
import 'package:places_search/api/service/api_client.dart';
import 'package:places_search/api/service/api_key_interceptor.dart';
import 'package:places_search/core/db/database.dart';
import 'package:places_search/features/settings/data/theme_repository.dart';
import 'package:places_search/features/settings/domain/i_theme_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

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
    final database = AppDatabase.instance;
    final themeRepository = ThemeRepository();

    return [
      Provider<ApiClient>(create: (_) => apiClient),
      Provider<AppDatabase>(create: (_) => database),
      ChangeNotifierProvider<ThemeRepository>(create: (_) => themeRepository),
      Provider<IThemeRepository>(
        create: (context) => context.read<ThemeRepository>(),
      ),
    ];
  }
}
