import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:places_search/assets/strings/app_strings.dart';
import 'package:places_search/features/news/ui/screens/news_screen_builder.dart';
import 'package:places_search/uikit/images/svg_picture_widget.dart';

@RoutePage()
class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const PlacesScreenBuilder(),
    const Center(child: Text(AppStrings.favoritesStub)),
    const Center(child: Text(AppStrings.settingsStub)),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: SvgPictureWidget('assets/icons/list.svg'),
            activeIcon: SvgPictureWidget('assets/icons/list_full.svg'),
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
