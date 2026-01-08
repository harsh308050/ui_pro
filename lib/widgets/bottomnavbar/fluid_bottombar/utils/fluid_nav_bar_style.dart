import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

/// An immutable style in which paint [UIProFluidNavBar]
///
///
/// {@tool sample}
/// Here, a [UIProFluidNavBar] with a given specific style which overrides the default color style of the background
///
/// ```dart
/// UIProFluidNavBar(
///   icons: [
///     UIProFluidNavBarIcon(iconPath: "assets/home.svg"),
///     UIProFluidNavBarIcon(iconPath: "assets/bookmark.svg"),
///   ],
///   style: UIProFluidNavBarStyle(
///     backgroundColor: Colors.red,
/// )
/// ```
/// {@end-tool}
@immutable
class UIProFluidNavBarStyle with Diagnosticable {
  /// The navigation bar background color
  final Color? barBackgroundColor;

  /// Icons background color
  final Color? iconBackgroundColor;

  /// Icons color when activated
  final Color? iconSelectedForegroundColor;

  /// Icons color when inactivated
  final Color? iconUnselectedForegroundColor;

  const UIProFluidNavBarStyle({
    this.barBackgroundColor,
    this.iconBackgroundColor,
    this.iconSelectedForegroundColor,
    this.iconUnselectedForegroundColor,
  });
}
