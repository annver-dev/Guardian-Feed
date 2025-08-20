// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [NewsScreen]
class NewsRoute extends PageRouteInfo<NewsRouteArgs> {
  NewsRoute({required INewsWM wm, Key? key, List<PageRouteInfo>? children})
    : super(
        NewsRoute.name,
        args: NewsRouteArgs(wm: wm, key: key),
        initialChildren: children,
      );

  static const String name = 'NewsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NewsRouteArgs>();
      return NewsScreen(wm: args.wm, key: args.key);
    },
  );
}

class NewsRouteArgs {
  const NewsRouteArgs({required this.wm, this.key});

  final INewsWM wm;

  final Key? key;

  @override
  String toString() {
    return 'NewsRouteArgs{wm: $wm, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NewsRouteArgs) return false;
    return wm == other.wm && key == other.key;
  }

  @override
  int get hashCode => wm.hashCode ^ key.hashCode;
}

/// generated route for
/// [TabsScreen]
class TabsRoute extends PageRouteInfo<void> {
  const TabsRoute({List<PageRouteInfo>? children})
    : super(TabsRoute.name, initialChildren: children);

  static const String name = 'TabsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TabsScreen();
    },
  );
}
