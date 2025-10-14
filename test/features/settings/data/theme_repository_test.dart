import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:places_search/features/settings/data/theme_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('ThemeRepository', () {
    late ThemeRepository themeRepository;

    setUp(() {
      themeRepository = ThemeRepository();
    });

    tearDown(() {
      SharedPreferences.setMockInitialValues({});
    });

    group('initialize', () {
      test('должен установить светлую тему по умолчанию, если нет сохраненных данных', () async {
        // Arrange
        SharedPreferences.setMockInitialValues({});

        // Act
        await themeRepository.initialize();

        // Assert
        expect(themeRepository.currentThemeMode, ThemeMode.light);
      });

      test('должен загрузить сохраненную темную тему', () async {
        // Arrange
        SharedPreferences.setMockInitialValues({
          'theme_mode': ThemeMode.dark.index,
        });

        // Act
        await themeRepository.initialize();

        // Assert
        expect(themeRepository.currentThemeMode, ThemeMode.dark);
      });

      test('должен загрузить сохраненную системную тему', () async {
        // Arrange
        SharedPreferences.setMockInitialValues({
          'theme_mode': ThemeMode.system.index,
        });

        // Act
        await themeRepository.initialize();

        // Assert
        expect(themeRepository.currentThemeMode, ThemeMode.system);
      });
    });

    group('setThemeMode', () {
      test('должен установить новую тему и сохранить в SharedPreferences', () async {
        // Arrange
        SharedPreferences.setMockInitialValues({});
        await themeRepository.initialize();

        // Act
        await themeRepository.setThemeMode(ThemeMode.dark);

        // Assert
        expect(themeRepository.currentThemeMode, ThemeMode.dark);
        
        final prefs = await SharedPreferences.getInstance();
        expect(prefs.getInt('theme_mode'), ThemeMode.dark.index);
      });

      test('должен уведомить слушателей ValueListenable при изменении темы', () async {
        // Arrange
        SharedPreferences.setMockInitialValues({});
        await themeRepository.initialize();
        
        ThemeMode? notifiedTheme;
        themeRepository.themeModeListenable.addListener(() {
          notifiedTheme = themeRepository.themeModeListenable.value;
        });

        // Act
        await themeRepository.setThemeMode(ThemeMode.dark);

        // Assert
        expect(notifiedTheme, ThemeMode.dark);
      });

      test('должен уведомить слушателей ChangeNotifier при изменении темы', () async {
        // Arrange
        SharedPreferences.setMockInitialValues({});
        await themeRepository.initialize();
        
        bool wasNotified = false;
        themeRepository.addListener(() {
          wasNotified = true;
        });

        // Act
        await themeRepository.setThemeMode(ThemeMode.dark);

        // Assert
        expect(wasNotified, true);
      });
    });

    group('toggleTheme', () {
      test('должен переключить с светлой темы на темную', () async {
        // Arrange
        SharedPreferences.setMockInitialValues({});
        await themeRepository.initialize();
        expect(themeRepository.currentThemeMode, ThemeMode.light);

        // Act
        await themeRepository.toggleTheme();

        // Assert
        expect(themeRepository.currentThemeMode, ThemeMode.dark);
      });

      test('должен переключить с темной темы на светлую', () async {
        // Arrange
        SharedPreferences.setMockInitialValues({
          'theme_mode': ThemeMode.dark.index,
        });
        await themeRepository.initialize();
        expect(themeRepository.currentThemeMode, ThemeMode.dark);

        // Act
        await themeRepository.toggleTheme();

        // Assert
        expect(themeRepository.currentThemeMode, ThemeMode.light);
      });

      test('должен сохранить переключенную тему в SharedPreferences', () async {
        // Arrange
        SharedPreferences.setMockInitialValues({});
        await themeRepository.initialize();

        // Act
        await themeRepository.toggleTheme();

        // Assert
        final prefs = await SharedPreferences.getInstance();
        expect(prefs.getInt('theme_mode'), ThemeMode.dark.index);
      });

      test('должен уведомить слушателей при переключении темы', () async {
        // Arrange
        SharedPreferences.setMockInitialValues({});
        await themeRepository.initialize();
        
        bool wasNotified = false;
        themeRepository.addListener(() {
          wasNotified = true;
        });

        // Act
        await themeRepository.toggleTheme();

        // Assert
        expect(wasNotified, true);
      });
    });

    group('themeModeListenable', () {
      test('должен возвращать текущую тему через ValueListenable', () async {
        // Arrange
        SharedPreferences.setMockInitialValues({
          'theme_mode': ThemeMode.dark.index,
        });
        await themeRepository.initialize();

        // Act & Assert
        expect(themeRepository.themeModeListenable.value, ThemeMode.dark);
      });
    });
  });
}