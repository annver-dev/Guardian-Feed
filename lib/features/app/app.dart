import 'package:flutter/material.dart';
import 'package:places_search/features/app/di/app_dependencies.dart';
import 'package:places_search/features/tabs_screen/tabs_screen.dart';
import 'package:places_search/router/router.dart';
import 'package:places_search/uikit/themes/app_theme_data.dart';
import 'package:provider/provider.dart';

/// Виджет приложения.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MultiProvider(
      providers: [...AppDependencies.providers()],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppThemeData.lightTheme,
        routerConfig: appRouter.config(),
      ),
    );
  }
}
