import 'package:flutter/material.dart';
import 'ui_theme_data.dart';

/// InheritedWidget that provides [UIProThemeData] to the widget tree.
///
/// Wrap your app or a subtree with [UIProTheme] to provide theme data
/// to all UI Pro widgets.
///
/// Example:
/// ```dart
/// UIProTheme(
///   data: UIProThemeData(
///     primaryColor: Colors.blue,
///     secondaryColor: Colors.purple,
///     backgroundColor: Colors.white,
///     textColor: Colors.black,
///     borderRadius: 12,
///     fontFamily: "Poppins",
///   ),
///   child: MyApp(),
/// )
/// ```
class UIProTheme extends InheritedWidget {
  /// The theme data for this subtree.
  final UIProThemeData data;

  /// Creates a [UIProTheme] widget.
  ///
  /// The [data] and [child] arguments must not be null.
  const UIProTheme({super.key, required this.data, required super.child});

  /// Returns the [UIProThemeData] from the closest [UIProTheme] ancestor.
  ///
  /// If there is no [UIProTheme] ancestor, returns [UIProThemeData.light] as default.
  ///
  /// Example:
  /// ```dart
  /// final theme = UIProTheme.of(context);
  /// print(theme.primaryColor);
  /// ```
  static UIProThemeData of(BuildContext context) {
    final UIProTheme? result = context
        .dependOnInheritedWidgetOfExactType<UIProTheme>();
    return result?.data ?? UIProThemeData.light;
  }

  /// Returns the [UIProThemeData] from the closest [UIProTheme] ancestor,
  /// or null if there is no ancestor.
  ///
  /// Useful when you want to check if a theme is available.
  static UIProThemeData? maybeOf(BuildContext context) {
    final UIProTheme? result = context
        .dependOnInheritedWidgetOfExactType<UIProTheme>();
    return result?.data;
  }

  @override
  bool updateShouldNotify(UIProTheme oldWidget) {
    return data != oldWidget.data;
  }
}

/// Extension on [BuildContext] for easy theme access.
extension UIProThemeExtension on BuildContext {
  /// Returns the [UIProThemeData] from the closest [UIProTheme] ancestor.
  ///
  /// Example:
  /// ```dart
  /// final theme = context.uiProTheme;
  /// print(theme.primaryColor);
  /// ```
  UIProThemeData get uiProTheme => UIProTheme.of(this);

  /// Returns the [UIProThemeData] or null if no theme is available.
  UIProThemeData? get maybeUiProTheme => UIProTheme.maybeOf(this);
}
