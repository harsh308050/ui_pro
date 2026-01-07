/// Configuration class for global UI Pro settings.
///
/// Use this to configure package-wide behavior that isn't theme-related.
///
/// Example:
/// ```dart
/// UIProConfig(
///   enableHapticFeedback: true,
///   defaultLoadingDelay: Duration(milliseconds: 500),
/// )
/// ```
class UIProConfig {
  /// Whether to enable haptic feedback on interactions.
  final bool enableHapticFeedback;

  /// Default delay before showing loading states.
  final Duration defaultLoadingDelay;

  /// Whether to show debug borders on widgets.
  final bool debugShowBorders;

  /// Default animation duration override.
  final Duration? animationDurationOverride;

  /// Whether to respect system accessibility settings.
  final bool respectAccessibility;

  const UIProConfig({
    this.enableHapticFeedback = true,
    this.defaultLoadingDelay = Duration.zero,
    this.debugShowBorders = false,
    this.animationDurationOverride,
    this.respectAccessibility = true,
  });

  /// Default configuration.
  static const UIProConfig defaults = UIProConfig();

  /// Creates a copy with the given fields replaced.
  UIProConfig copyWith({
    bool? enableHapticFeedback,
    Duration? defaultLoadingDelay,
    bool? debugShowBorders,
    Duration? animationDurationOverride,
    bool? respectAccessibility,
  }) {
    return UIProConfig(
      enableHapticFeedback: enableHapticFeedback ?? this.enableHapticFeedback,
      defaultLoadingDelay: defaultLoadingDelay ?? this.defaultLoadingDelay,
      debugShowBorders: debugShowBorders ?? this.debugShowBorders,
      animationDurationOverride:
          animationDurationOverride ?? this.animationDurationOverride,
      respectAccessibility: respectAccessibility ?? this.respectAccessibility,
    );
  }
}
