import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:places_search/features/common/domain/enitities/place_entity.dart';
import 'package:places_search/features/places/ui/screens/places_screen.dart';
import 'package:places_search/features/places/ui/screens/places_wm.dart';
import 'package:places_search/features/tabs_screen/tabs_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: TabsRoute.page,
      path: '/',
      children: [AutoRoute(page: NewsRoute.page, path: '')],
    ),
    // AutoRoute(page: PlaceDetailRoute.page, path: '/details'),
  ];
}
