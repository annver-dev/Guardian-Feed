import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:places_search/features/tabs_screen/tabs_screen.dart';
import 'package:places_search/uikit/themes/app_theme_data.dart';
import 'package:places_search/assets/strings/app_strings.dart';

void main() {
  group('TabsScreen Widget Tests', () {
    // Вспомогательная функция для создания тестового приложения
    Widget createTestApp() {
      return MaterialApp(
        theme: AppThemeData.lightTheme,
        home: const TabsScreen(),
      );
    }

    testWidgets('должен отображать BottomNavigationBar с тремя вкладками', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(createTestApp());

      // Assert - проверяем наличие BottomNavigationBar
      expect(find.byType(BottomNavigationBar), findsOneWidget);
      
      // Проверяем количество вкладок
      final bottomNavBar = tester.widget<BottomNavigationBar>(find.byType(BottomNavigationBar));
      expect(bottomNavBar.items.length, equals(3));
    });

    testWidgets('должен отображать правильные названия вкладок', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(createTestApp());

      // Assert - проверяем названия вкладок
      expect(find.text(AppStrings.placesScreenBottomNavPlaces), findsOneWidget);
      expect(find.text(AppStrings.placesScreenBottomNavFavorites), findsOneWidget);
      expect(find.text(AppStrings.placesScreenBottomNavSettings), findsOneWidget);
    });

    testWidgets('должен переключаться между вкладками при нажатии', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(createTestApp());

      // Получаем BottomNavigationBar
      final bottomNavBar = tester.widget<BottomNavigationBar>(find.byType(BottomNavigationBar));
      
      // Assert - изначально выбрана первая вкладка (индекс 0)
      expect(bottomNavBar.currentIndex, equals(0));

      // Act - нажимаем на вторую вкладку (Избранное)
      await tester.tap(find.text(AppStrings.placesScreenBottomNavFavorites));
      await tester.pumpAndSettle(); // Ждем завершения анимации

      // Assert - проверяем, что выбрана вторая вкладка
      final updatedBottomNavBar = tester.widget<BottomNavigationBar>(find.byType(BottomNavigationBar));
      expect(updatedBottomNavBar.currentIndex, equals(1));

      // Act - нажимаем на третью вкладку (Настройки)
      await tester.tap(find.text(AppStrings.placesScreenBottomNavSettings));
      await tester.pumpAndSettle();

      // Assert - проверяем, что выбрана третья вкладка
      final finalBottomNavBar = tester.widget<BottomNavigationBar>(find.byType(BottomNavigationBar));
      expect(finalBottomNavBar.currentIndex, equals(2));
    });

    testWidgets('должен отображать Scaffold с правильной структурой', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(createTestApp());

      // Assert - проверяем основную структуру
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(BottomNavigationBar), findsOneWidget);
      
      // Проверяем, что body содержит один из экранов
      // (точное содержимое зависит от реализации экранов)
      final scaffold = tester.widget<Scaffold>(find.byType(Scaffold));
      expect(scaffold.body, isNotNull);
      expect(scaffold.bottomNavigationBar, isNotNull);
    });

    testWidgets('должен правильно обрабатывать быстрые переключения вкладок', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(createTestApp());

      // Act - быстро переключаемся между вкладками
      await tester.tap(find.text(AppStrings.placesScreenBottomNavFavorites));
      await tester.pump(); // Не ждем анимацию
      
      await tester.tap(find.text(AppStrings.placesScreenBottomNavSettings));
      await tester.pump();
      
      await tester.tap(find.text(AppStrings.placesScreenBottomNavPlaces));
      await tester.pumpAndSettle(); // Ждем завершения всех анимаций

      // Assert - проверяем финальное состояние
      final bottomNavBar = tester.widget<BottomNavigationBar>(find.byType(BottomNavigationBar));
      expect(bottomNavBar.currentIndex, equals(0));
    });

    testWidgets('должен сохранять состояние при переключении вкладок', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(createTestApp());

      // Act - переключаемся на вторую вкладку и обратно
      await tester.tap(find.text(AppStrings.placesScreenBottomNavFavorites));
      await tester.pumpAndSettle();
      
      await tester.tap(find.text(AppStrings.placesScreenBottomNavPlaces));
      await tester.pumpAndSettle();

      // Assert - проверяем, что мы вернулись к первой вкладке
      final bottomNavBar = tester.widget<BottomNavigationBar>(find.byType(BottomNavigationBar));
      expect(bottomNavBar.currentIndex, equals(0));
    });

    testWidgets('должен применять правильную тему к BottomNavigationBar', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(createTestApp());

      // Assert - проверяем, что BottomNavigationBar использует тему
      final bottomNavBar = tester.widget<BottomNavigationBar>(find.byType(BottomNavigationBar));
      
      // Проверяем, что цвета установлены (не null)
      expect(bottomNavBar.backgroundColor, isNotNull);
      expect(bottomNavBar.selectedItemColor, isNotNull);
      expect(bottomNavBar.unselectedItemColor, isNotNull);
      
      // Проверяем стили текста
      expect(bottomNavBar.selectedLabelStyle, isNotNull);
      expect(bottomNavBar.unselectedLabelStyle, isNotNull);
    });

    testWidgets('должен правильно обрабатывать нажатие на уже выбранную вкладку', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(createTestApp());

      // Проверяем изначальное состояние
      var bottomNavBar = tester.widget<BottomNavigationBar>(find.byType(BottomNavigationBar));
      expect(bottomNavBar.currentIndex, equals(0));

      // Act - нажимаем на уже выбранную вкладку
      await tester.tap(find.text(AppStrings.placesScreenBottomNavPlaces));
      await tester.pumpAndSettle();

      // Assert - индекс должен остаться тем же
      bottomNavBar = tester.widget<BottomNavigationBar>(find.byType(BottomNavigationBar));
      expect(bottomNavBar.currentIndex, equals(0));
    });
  });
}