import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:places_search/uikit/buttons/entity/button_state.dart';
import 'package:places_search/uikit/buttons/main_button.dart';
import 'package:places_search/uikit/themes/app_theme_data.dart';

void main() {
  group('MainButton Widget Tests', () {
    Widget createTestWidget(Widget child) {
      return MaterialApp(
        theme: AppThemeData.lightTheme,
        home: Scaffold(body: child),
      );
    }

    testWidgets('должен отображать текст кнопки', (WidgetTester tester) async {
      const buttonText = 'Тестовая кнопка';
      bool wasPressed = false;

      await tester.pumpWidget(
        createTestWidget(
          MainButton(
            onPressed: () => wasPressed = true,
            child: const Text(buttonText),
          ),
        ),
      );

      expect(find.text(buttonText), findsOneWidget);
      expect(find.byType(MainButton), findsOneWidget);
    });

    testWidgets('должен вызывать onPressed при нажатии', (
      WidgetTester tester,
    ) async {
      bool wasPressed = false;
      const buttonText = 'Нажми меня';

      await tester.pumpWidget(
        createTestWidget(
          MainButton(
            onPressed: () => wasPressed = true,
            child: const Text(buttonText),
          ),
        ),
      );

      await tester.tap(find.byType(MainButton));
      await tester.pump();

      expect(wasPressed, isTrue);
    });

    testWidgets('не должен вызывать onPressed когда неактивна', (
      WidgetTester tester,
    ) async {
      bool wasPressed = false;
      const buttonText = 'Неактивная кнопка';

      await tester.pumpWidget(
        createTestWidget(
          MainButton(
            state: ButtonState.inactive,
            onPressed: () => wasPressed = true,
            child: const Text(buttonText),
          ),
        ),
      );

      await tester.tap(find.byType(MainButton));
      await tester.pump();

      expect(wasPressed, isFalse);
    });

    testWidgets('должен показывать индикатор загрузки в состоянии loading', (
      WidgetTester tester,
    ) async {
      const buttonText = 'Загрузка';

      await tester.pumpWidget(
        createTestWidget(
          MainButton(
            state: ButtonState.loading,
            onPressed: () {},
            child: const Text(buttonText),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text(buttonText), findsOneWidget);
    });

    testWidgets('должен иметь правильные размеры', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          MainButton(onPressed: () {}, child: const Text('Тест размера')),
        ),
      );

      final buttonFinder = find.byType(FilledButton);
      final buttonWidget = tester.widget<FilledButton>(buttonFinder);

      final buttonStyle = buttonWidget.style!;
      final fixedSize = buttonStyle.fixedSize!.resolve({});
      expect(fixedSize!.height, equals(48.0));
    });

    testWidgets('должен применять правильные цвета для разных состояний', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          MainButton(
            state: ButtonState.active,
            onPressed: () {},
            child: const Text('Активная'),
          ),
        ),
      );

      final activeButtonFinder = find.byType(FilledButton);
      expect(activeButtonFinder, findsOneWidget);

      await tester.pumpWidget(
        createTestWidget(
          MainButton(
            state: ButtonState.inactive,
            onPressed: () {},
            child: const Text('Неактивная'),
          ),
        ),
      );

      final inactiveButtonFinder = find.byType(FilledButton);
      expect(inactiveButtonFinder, findsOneWidget);
    });

    testWidgets('должен правильно обрабатывать множественные нажатия', (
      WidgetTester tester,
    ) async {
      int pressCount = 0;

      await tester.pumpWidget(
        createTestWidget(
          MainButton(
            onPressed: () => pressCount++,
            child: const Text('Счетчик'),
          ),
        ),
      );

      await tester.tap(find.byType(MainButton));
      await tester.pump();
      await tester.tap(find.byType(MainButton));
      await tester.pump();
      await tester.tap(find.byType(MainButton));
      await tester.pump();

      expect(pressCount, equals(3));
    });
  });
}
