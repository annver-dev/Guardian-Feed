import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:places_search/assets/strings/app_strings.dart';
import 'package:places_search/features/favorites/ui/favorites_screen_builder.dart';
import 'package:places_search/features/news/ui/screens/news_screen_builder.dart';
import 'package:places_search/features/settings/ui/settings_screen_builder.dart';
import 'package:places_search/uikit/images/svg_picture_widget.dart';
import 'package:places_search/uikit/themes/colors/app_color_theme.dart';

@RoutePage()
class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const NewsScreenBuilder(),
    const FavoritesScreenBuilder(),
    const SettingsScreenBuilder(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppColorTheme.of(context);
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,

        backgroundColor: colorTheme.scaffold,
        selectedItemColor: colorTheme.newsHeaderDark,
        unselectedItemColor: colorTheme.inactive,
        selectedLabelStyle: TextStyle(
          color: colorTheme.accent,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: TextStyle(
          color: colorTheme.inactive,
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: SvgPictureWidget('assets/icons/news.svg'),
            activeIcon: SvgPictureWidget('assets/icons/news.svg'),
            label: AppStrings.placesScreenBottomNavPlaces,
          ),
          BottomNavigationBarItem(
            icon: SvgPictureWidget('assets/icons/heart.svg'),
            activeIcon: SvgPictureWidget('assets/icons/heart_full.svg'),
            label: AppStrings.placesScreenBottomNavFavorites,
          ),
          BottomNavigationBarItem(
            icon: SvgPictureWidget('assets/icons/settings.svg'),
            activeIcon: SvgPictureWidget('assets/icons/settings_full.svg'),
            label: AppStrings.placesScreenBottomNavSettings,
          ),
        ],
      ),
    );
  }
}
