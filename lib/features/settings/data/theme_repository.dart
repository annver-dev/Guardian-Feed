import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:places_search/features/settings/domain/i_theme_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeRepository extends ChangeNotifier implements IThemeRepository {
  static const String _themeKey = 'theme_mode';

  final ValueNotifier<ThemeMode> _themeModeNotifier = ValueNotifier(
    ThemeMode.light,
  );

  @override
  ValueListenable<ThemeMode> get themeModeListenable => _themeModeNotifier;

  @override
  ThemeMode get currentThemeMode => _themeModeNotifier.value;

  @override
  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    final savedThemeIndex = prefs.getInt(_themeKey);

    if (savedThemeIndex != null) {
      _themeModeNotifier.value = ThemeMode.values[savedThemeIndex];
    }
  }

  @override
  Future<void> setThemeMode(ThemeMode themeMode) async {
    _themeModeNotifier.value = themeMode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_themeKey, themeMode.index);
    notifyListeners();
  }

  @override
  Future<void> toggleTheme() async {
    final newTheme =
        _themeModeNotifier.value == ThemeMode.light
            ? ThemeMode.dark
            : ThemeMode.light;
    await setThemeMode(newTheme);
  }
}
