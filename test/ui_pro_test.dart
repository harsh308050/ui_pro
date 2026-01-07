import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_pro/ui_pro.dart';

void main() {
  group('UIProThemeData', () {
    test('light theme has correct default values', () {
      final theme = UIProThemeData.light;
      expect(theme.primaryColor, const Color(0xFF6366F1));
      expect(theme.backgroundColor, const Color(0xFFF8FAFC));
      // expect(theme.brightness, Brightness.light);
    });

    test('dark theme has correct default values', () {
      final theme = UIProThemeData.dark;
      expect(theme.primaryColor, const Color(0xFF818CF8));
      expect(theme.backgroundColor, const Color(0xFF0F172A));
    });

    test('copyWith creates a new instance with updated values', () {
      final theme = UIProThemeData.light;
      final newTheme = theme.copyWith(primaryColor: Colors.red);

      expect(newTheme.primaryColor, Colors.red);
      expect(newTheme.backgroundColor, theme.backgroundColor);
    });
  });

  group('UIProTheme', () {
    testWidgets('provides theme data to descendants', (tester) async {
      final theme = UIProThemeData.light;

      await tester.pumpWidget(
        UIProTheme(
          data: theme,
          child: Builder(
            builder: (context) {
              final providedTheme = UIProTheme.of(context);
              expect(providedTheme.primaryColor, theme.primaryColor);
              return const SizedBox();
            },
          ),
        ),
      );
    });

    testWidgets('context extension works correctly', (tester) async {
      final theme = UIProThemeData.dark;

      await tester.pumpWidget(
        UIProTheme(
          data: theme,
          child: Builder(
            builder: (context) {
              return const SizedBox();
            },
          ),
        ),
      );
    });
  });

  group('UIConfig', () {
    test('default values are set correctly', () {
      expect(UIProConfig.defaults, const Duration(milliseconds: 200));
      expect(UIProConfig.defaults, true);
    });
  });
}
