import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:places_search/uikit/loading/app_loader.dart';
import 'package:places_search/uikit/loading/app_loader_sizes.dart';
import 'package:places_search/uikit/themes/app_theme_data.dart';

void main() {
  group('AppLoader Widget Tests', () {
    Widget createTestWidget(Widget child) {
      return MaterialApp(
        theme: AppThemeData.lightTheme,
        home: Scaffold(body: child),
      );
    }

    testWidgets('должен отображать CircularProgressIndicator', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(AppLoader.create(size: AppLoaderSizes.medium)),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(AppLoader), findsOneWidget);
      expect(find.byType(Center), findsOneWidget);
    });

    testWidgets(
      'должен применять правильный размер для разных AppLoaderSizes',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          createTestWidget(AppLoader.create(size: AppLoaderSizes.small)),
        );

        var sizedBox = tester.widget<SizedBox>(find.byType(SizedBox).first);
        expect(sizedBox.width, equals(AppLoaderSizes.small.size));
        expect(sizedBox.height, equals(AppLoaderSizes.small.size));

        // Тест для среднего размера
        await tester.pumpWidget(
          createTestWidget(AppLoader.create(size: AppLoaderSizes.medium)),
        );

        sizedBox = tester.widget<SizedBox>(find.byType(SizedBox).first);
        expect(sizedBox.width, equals(AppLoaderSizes.medium.size));
        expect(sizedBox.height, equals(AppLoaderSizes.medium.size));

        // Тест для большого размера
        await tester.pumpWidget(
          createTestWidget(AppLoader.create(size: AppLoaderSizes.large)),
        );

        sizedBox = tester.widget<SizedBox>(find.byType(SizedBox).first);
        expect(sizedBox.width, equals(AppLoaderSizes.large.size));
        expect(sizedBox.height, equals(AppLoaderSizes.large.size));
      },
    );

    testWidgets(
      'должен применять правильную толщину линии для разных размеров',
      (WidgetTester tester) async {
        // Тест для маленького размера
        await tester.pumpWidget(
          createTestWidget(AppLoader.create(size: AppLoaderSizes.small)),
        );

        var progressIndicator = tester.widget<CircularProgressIndicator>(
          find.byType(CircularProgressIndicator),
        );
        expect(
          progressIndicator.strokeWidth,
          equals(AppLoaderSizes.small.strokeWidth),
        );

        // Тест для большого размера
        await tester.pumpWidget(
          createTestWidget(AppLoader.create(size: AppLoaderSizes.large)),
        );

        progressIndicator = tester.widget<CircularProgressIndicator>(
          find.byType(CircularProgressIndicator),
        );
        expect(
          progressIndicator.strokeWidth,
          equals(AppLoaderSizes.large.strokeWidth),
        );
      },
    );

    testWidgets('должен применять пользовательский цвет', (
      WidgetTester tester,
    ) async {
      const customColor = Colors.red;

      await tester.pumpWidget(
        createTestWidget(
          AppLoader.create(size: AppLoaderSizes.medium, color: customColor),
        ),
      );

      final progressIndicator = tester.widget<CircularProgressIndicator>(
        find.byType(CircularProgressIndicator),
      );
      expect(progressIndicator.color, equals(customColor));
    });

    testWidgets('должен применять пользовательский цвет фона', (
      WidgetTester tester,
    ) async {
      const customBackgroundColor = Colors.grey;

      await tester.pumpWidget(
        createTestWidget(
          AppLoader.create(
            size: AppLoaderSizes.medium,
            backgroundColor: customBackgroundColor,
          ),
        ),
      );

      final progressIndicator = tester.widget<CircularProgressIndicator>(
        find.byType(CircularProgressIndicator),
      );
      expect(progressIndicator.backgroundColor, equals(customBackgroundColor));
    });

    testWidgets('фабрика forScreen должна создавать полноэкранный лоадер', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget(AppLoader.forScreen()));

      expect(find.byType(AppLoader), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      // Проверяем размер (должен быть large для полноэкранного)
      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox).first);
      expect(sizedBox.width, equals(AppLoaderSizes.large.size));
      expect(sizedBox.height, equals(AppLoaderSizes.large.size));

      // Проверяем, что backgroundColor прозрачный для полноэкранного режима
      final progressIndicator = tester.widget<CircularProgressIndicator>(
        find.byType(CircularProgressIndicator),
      );
      expect(progressIndicator.backgroundColor, equals(Colors.transparent));
    });

    testWidgets('должен правильно обрабатывать strokeCap', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(AppLoader.create(size: AppLoaderSizes.medium)),
      );

      final progressIndicator = tester.widget<CircularProgressIndicator>(
        find.byType(CircularProgressIndicator),
      );
      expect(progressIndicator.strokeCap, equals(StrokeCap.round));
    });

    testWidgets('должен быть центрирован', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(AppLoader.create(size: AppLoaderSizes.medium)),
      );

      expect(find.byType(Center), findsOneWidget);

      final center = tester.widget<Center>(find.byType(Center));
      expect(center.child, isA<SizedBox>());
    });

    testWidgets('должен правильно работать с темной темой', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppThemeData.darkTheme,
          home: Scaffold(body: AppLoader.create(size: AppLoaderSizes.medium)),
        ),
      );

      expect(find.byType(AppLoader), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('должен правильно обрабатывать все параметры одновременно', (
      WidgetTester tester,
    ) async {
      const customColor = Colors.purple;
      const customBackgroundColor = Colors.yellow;

      await tester.pumpWidget(
        createTestWidget(
          AppLoader.create(
            size: AppLoaderSizes.large,
            color: customColor,
            backgroundColor: customBackgroundColor,
            isForScreen: false,
          ),
        ),
      );

      final progressIndicator = tester.widget<CircularProgressIndicator>(
        find.byType(CircularProgressIndicator),
      );
      expect(progressIndicator.color, equals(customColor));
      expect(progressIndicator.backgroundColor, equals(customBackgroundColor));
      expect(
        progressIndicator.strokeWidth,
        equals(AppLoaderSizes.large.strokeWidth),
      );
      expect(progressIndicator.strokeCap, equals(StrokeCap.round));

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox).first);
      expect(sizedBox.width, equals(AppLoaderSizes.large.size));
      expect(sizedBox.height, equals(AppLoaderSizes.large.size));
    });
  });
}
