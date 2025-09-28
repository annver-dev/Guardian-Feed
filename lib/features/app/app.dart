import 'package:flutter/material.dart';
import 'package:places_search/features/app/di/app_dependencies.dart';
import 'package:places_search/features/settings/data/theme_repository.dart';
import 'package:places_search/router/router.dart';
import 'package:places_search/uikit/themes/app_theme_data.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MultiProvider(
      providers: [...AppDependencies.providers()],
      child: Consumer<ThemeRepository>(
        builder: (context, themeRepository, child) {
          return ValueListenableBuilder<ThemeMode>(
            valueListenable: themeRepository.themeModeListenable,
            builder: (context, themeMode, child) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                theme: AppThemeData.lightTheme,
                darkTheme: AppThemeData.darkTheme,
                themeMode: themeMode,
                routerConfig: appRouter.config(),
              );
            },
          );
        },
      ),
    );
  }
}
