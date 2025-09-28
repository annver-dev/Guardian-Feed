import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:places_search/features/settings/domain/i_theme_repository.dart';

abstract interface class ISettingsWM {
  ValueListenable<ThemeMode> get themeModeListenable;

  ThemeMode get currentThemeMode;

  void onThemeToggle();
}

class SettingsWM implements ISettingsWM {
  final IThemeRepository _themeRepository;

  SettingsWM(this._themeRepository);

  @override
  ValueListenable<ThemeMode> get themeModeListenable =>
      _themeRepository.themeModeListenable;

  @override
  ThemeMode get currentThemeMode => _themeRepository.currentThemeMode;

  @override
  void onThemeToggle() {
    _themeRepository.toggleTheme();
  }
}
