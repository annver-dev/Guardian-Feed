import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract interface class IThemeRepository {
  ValueListenable<ThemeMode> get themeModeListenable;
  ThemeMode get currentThemeMode;

  Future<void> setThemeMode(ThemeMode themeMode);

  Future<void> toggleTheme();

  Future<void> initialize();
}
