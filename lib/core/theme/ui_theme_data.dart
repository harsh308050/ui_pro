import 'package:flutter/material.dart';

/// Core theme data class that defines all visual properties for the UI system.
///
/// This is the single source of truth for colors, typography, spacing,
/// border radius, shimmer colors, and component-specific styles.
///
/// Example:
/// ```dart
/// UIProThemeData(
///   primaryColor: Colors.blue,
///   secondaryColor: Colors.purple,
///   backgroundColor: Colors.white,
///   borderRadius: 12,
/// )
/// ```
class UIProThemeData {
  // ─────────────────────────────────────────────────────────────────────
  // CORE COLORS
  // ─────────────────────────────────────────────────────────────────────

  /// Primary brand color used for buttons, active states, links.
  final Color primaryColor;

  /// Secondary brand color for accents and highlights.
  final Color secondaryColor;

  /// Main background color for screens and surfaces.
  final Color backgroundColor;

  /// Surface color for cards, dialogs, and elevated surfaces.
  final Color surfaceColor;

  /// Primary text color.
  final Color textColor;

  /// Secondary/muted text color for hints, labels.
  final Color textSecondaryColor;

  /// Error color for validation states.
  final Color errorColor;

  /// Success color for positive states.
  final Color successColor;

  /// Warning color for caution states.
  final Color warningColor;

  /// Divider/border color.
  final Color dividerColor;

  /// Disabled state color.
  final Color disabledColor;

  // ─────────────────────────────────────────────────────────────────────
  // TYPOGRAPHY
  // ─────────────────────────────────────────────────────────────────────

  /// Font family for all text.
  final String? fontFamily;

  /// Base font size.
  final double fontSizeBase;

  /// Small font size.
  final double fontSizeSmall;

  /// Large font size.
  final double fontSizeLarge;

  /// Extra large font size for headings.
  final double fontSizeXLarge;

  /// Font weight for regular text.
  final FontWeight fontWeightRegular;

  /// Font weight for medium emphasis.
  final FontWeight fontWeightMedium;

  /// Font weight for bold/strong emphasis.
  final FontWeight fontWeightBold;

  /// Default letter spacing.
  final double letterSpacing;

  /// Line height multiplier.
  final double lineHeight;

  // ─────────────────────────────────────────────────────────────────────
  // SPACING & SIZING
  // ─────────────────────────────────────────────────────────────────────

  /// Extra small spacing (4).
  final double spacingXS;

  /// Small spacing (8).
  final double spacingSM;

  /// Medium spacing (16).
  final double spacingMD;

  /// Large spacing (24).
  final double spacingLG;

  /// Extra large spacing (32).
  final double spacingXL;

  /// Default border radius for all components.
  final double borderRadius;

  /// Small border radius.
  final double borderRadiusSmall;

  /// Large border radius.
  final double borderRadiusLarge;

  /// Border width.
  final double borderWidth;

  // ─────────────────────────────────────────────────────────────────────
  // BUTTON STYLES
  // ─────────────────────────────────────────────────────────────────────

  /// Button height.
  final double buttonHeight;

  /// Button horizontal padding.
  final double buttonPaddingHorizontal;

  /// Button vertical padding.
  final double buttonPaddingVertical;

  /// Button elevation.
  final double buttonElevation;

  /// Button text color (defaults to white on primary).
  final Color? buttonTextColor;

  /// Button disabled background color.
  final Color? buttonDisabledColor;

  /// Button disabled text color.
  final Color? buttonDisabledTextColor;

  // ─────────────────────────────────────────────────────────────────────
  // TEXT FIELD STYLES
  // ─────────────────────────────────────────────────────────────────────

  /// Text field background color.
  final Color? textFieldBackgroundColor;

  /// Text field border color.
  final Color? textFieldBorderColor;

  /// Text field focused border color.
  final Color? textFieldFocusedBorderColor;

  /// Text field hint color.
  final Color? textFieldHintColor;

  /// Text field content padding.
  final EdgeInsets? textFieldContentPadding;

  // ─────────────────────────────────────────────────────────────────────
  // SHIMMER STYLES
  // ─────────────────────────────────────────────────────────────────────

  /// Shimmer base color (darker shade).
  final Color shimmerBaseColor;

  /// Shimmer highlight color (lighter shade for animation).
  final Color shimmerHighlightColor;

  /// Shimmer animation duration.
  final Duration shimmerDuration;

  /// Shimmer item border radius.
  final double? shimmerBorderRadius;

  // ─────────────────────────────────────────────────────────────────────
  // APP BAR STYLES
  // ─────────────────────────────────────────────────────────────────────

  /// App bar background color.
  final Color? appBarBackgroundColor;

  /// App bar foreground/icon color.
  final Color? appBarForegroundColor;

  /// App bar elevation.
  final double appBarElevation;

  /// App bar title text style.
  final TextStyle? appBarTitleStyle;

  /// App bar center title.
  final bool appBarCenterTitle;

  // ─────────────────────────────────────────────────────────────────────
  // BOTTOM NAVIGATION STYLES
  // ─────────────────────────────────────────────────────────────────────

  /// Bottom navigation background color.
  final Color? bottomNavBackgroundColor;

  /// Bottom navigation selected item color.
  final Color? bottomNavSelectedColor;

  /// Bottom navigation unselected item color.
  final Color? bottomNavUnselectedColor;

  /// Bottom navigation elevation.
  final double bottomNavElevation;

  /// Bottom navigation icon size.
  final double bottomNavIconSize;

  /// Bottom navigation show labels.
  final bool bottomNavShowLabels;

  /// Bottom navigation indicator height.
  final double bottomNavIndicatorHeight;

  // ─────────────────────────────────────────────────────────────────────
  // ANIMATION
  // ─────────────────────────────────────────────────────────────────────

  /// Default animation duration.
  final Duration animationDuration;

  /// Fast animation duration.
  final Duration animationDurationFast;

  /// Slow animation duration.
  final Duration animationDurationSlow;

  /// Default animation curve.
  final Curve animationCurve;

  // ─────────────────────────────────────────────────────────────────────
  // CONSTRUCTOR
  // ─────────────────────────────────────────────────────────────────────

  const UIProThemeData({
    // Core colors
    this.primaryColor = const Color(0xFF2196F3),
    this.secondaryColor = const Color(0xFF9C27B0),
    this.backgroundColor = const Color(0xFFFFFFFF),
    this.surfaceColor = const Color(0xFFF5F5F5),
    this.textColor = const Color(0xFF212121),
    this.textSecondaryColor = const Color(0xFF757575),
    this.errorColor = const Color(0xFFE53935),
    this.successColor = const Color(0xFF43A047),
    this.warningColor = const Color(0xFFFFA726),
    this.dividerColor = const Color(0xFFE0E0E0),
    this.disabledColor = const Color(0xFFBDBDBD),

    // Typography
    this.fontFamily,
    this.fontSizeBase = 14,
    this.fontSizeSmall = 12,
    this.fontSizeLarge = 16,
    this.fontSizeXLarge = 20,
    this.fontWeightRegular = FontWeight.w400,
    this.fontWeightMedium = FontWeight.w500,
    this.fontWeightBold = FontWeight.w700,
    this.letterSpacing = 0.0,
    this.lineHeight = 1.4,

    // Spacing
    this.spacingXS = 4,
    this.spacingSM = 8,
    this.spacingMD = 16,
    this.spacingLG = 24,
    this.spacingXL = 32,
    this.borderRadius = 12,
    this.borderRadiusSmall = 8,
    this.borderRadiusLarge = 16,
    this.borderWidth = 1,

    // Button
    this.buttonHeight = 48,
    this.buttonPaddingHorizontal = 24,
    this.buttonPaddingVertical = 12,
    this.buttonElevation = 0,
    this.buttonTextColor,
    this.buttonDisabledColor,
    this.buttonDisabledTextColor,

    // Text field
    this.textFieldBackgroundColor,
    this.textFieldBorderColor,
    this.textFieldFocusedBorderColor,
    this.textFieldHintColor,
    this.textFieldContentPadding,

    // Shimmer
    this.shimmerBaseColor = const Color(0xFFE0E0E0),
    this.shimmerHighlightColor = const Color(0xFFF5F5F5),
    this.shimmerDuration = const Duration(milliseconds: 1500),
    this.shimmerBorderRadius,

    // App bar
    this.appBarBackgroundColor,
    this.appBarForegroundColor,
    this.appBarElevation = 0,
    this.appBarTitleStyle,
    this.appBarCenterTitle = true,

    // Bottom navigation
    this.bottomNavBackgroundColor,
    this.bottomNavSelectedColor,
    this.bottomNavUnselectedColor,
    this.bottomNavElevation = 8,
    this.bottomNavIconSize = 24,
    this.bottomNavShowLabels = true,
    this.bottomNavIndicatorHeight = 3,

    // Animation
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationDurationFast = const Duration(milliseconds: 150),
    this.animationDurationSlow = const Duration(milliseconds: 500),
    this.animationCurve = Curves.easeInOut,
  });

  // ─────────────────────────────────────────────────────────────────────
  // COMPUTED GETTERS
  // ─────────────────────────────────────────────────────────────────────

  /// Effective button text color (defaults to contrasting color on primary).
  Color get effectiveButtonTextColor =>
      buttonTextColor ?? _contrastColor(primaryColor);

  /// Effective button disabled background color.
  Color get effectiveButtonDisabledColor =>
      buttonDisabledColor ?? disabledColor;

  /// Effective button disabled text color.
  Color get effectiveButtonDisabledTextColor =>
      buttonDisabledTextColor ?? textSecondaryColor;

  /// Effective text field background color.
  Color get effectiveTextFieldBackgroundColor =>
      textFieldBackgroundColor ?? surfaceColor;

  /// Effective text field border color.
  Color get effectiveTextFieldBorderColor =>
      textFieldBorderColor ?? dividerColor;

  /// Effective text field focused border color.
  Color get effectiveTextFieldFocusedBorderColor =>
      textFieldFocusedBorderColor ?? primaryColor;

  /// Effective text field hint color.
  Color get effectiveTextFieldHintColor =>
      textFieldHintColor ?? textSecondaryColor;

  /// Effective text field content padding.
  EdgeInsets get effectiveTextFieldContentPadding =>
      textFieldContentPadding ??
      EdgeInsets.symmetric(horizontal: spacingMD, vertical: spacingSM);

  /// Effective app bar background color.
  Color get effectiveAppBarBackgroundColor =>
      appBarBackgroundColor ?? primaryColor;

  /// Effective app bar foreground color.
  Color get effectiveAppBarForegroundColor =>
      appBarForegroundColor ?? _contrastColor(effectiveAppBarBackgroundColor);

  /// Effective bottom nav background color.
  Color get effectiveBottomNavBackgroundColor =>
      bottomNavBackgroundColor ?? backgroundColor;

  /// Effective bottom nav selected color.
  Color get effectiveBottomNavSelectedColor =>
      bottomNavSelectedColor ?? primaryColor;

  /// Effective bottom nav unselected color.
  Color get effectiveBottomNavUnselectedColor =>
      bottomNavUnselectedColor ?? textSecondaryColor;

  /// Effective shimmer border radius.
  double get effectiveShimmerBorderRadius =>
      shimmerBorderRadius ?? borderRadius;

  // ─────────────────────────────────────────────────────────────────────
  // UTILITY METHODS
  // ─────────────────────────────────────────────────────────────────────

  /// Returns contrasting color (white or black) based on luminance.
  Color _contrastColor(Color color) {
    return color.computeLuminance() > 0.5 ? Colors.black : Colors.white;
  }

  /// Get text style with theme defaults applied.
  TextStyle textStyle({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? height,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize ?? fontSizeBase,
      fontWeight: fontWeight ?? fontWeightRegular,
      color: color ?? textColor,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      height: height ?? lineHeight,
    );
  }

  /// Get border radius.
  BorderRadius get defaultBorderRadius => BorderRadius.circular(borderRadius);

  /// Get small border radius.
  BorderRadius get smallBorderRadius =>
      BorderRadius.circular(borderRadiusSmall);

  /// Get large border radius.
  BorderRadius get largeBorderRadius =>
      BorderRadius.circular(borderRadiusLarge);

  /// Get custom border radius.
  BorderRadius customBorderRadius(double radius) =>
      BorderRadius.circular(radius);

  // ─────────────────────────────────────────────────────────────────────
  // COPY WITH
  // ─────────────────────────────────────────────────────────────────────

  /// Creates a copy of this theme data with the given fields replaced.
  UIProThemeData copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? backgroundColor,
    Color? surfaceColor,
    Color? textColor,
    Color? textSecondaryColor,
    Color? errorColor,
    Color? successColor,
    Color? warningColor,
    Color? dividerColor,
    Color? disabledColor,
    String? fontFamily,
    double? fontSizeBase,
    double? fontSizeSmall,
    double? fontSizeLarge,
    double? fontSizeXLarge,
    FontWeight? fontWeightRegular,
    FontWeight? fontWeightMedium,
    FontWeight? fontWeightBold,
    double? letterSpacing,
    double? lineHeight,
    double? spacingXS,
    double? spacingSM,
    double? spacingMD,
    double? spacingLG,
    double? spacingXL,
    double? borderRadius,
    double? borderRadiusSmall,
    double? borderRadiusLarge,
    double? borderWidth,
    double? buttonHeight,
    double? buttonPaddingHorizontal,
    double? buttonPaddingVertical,
    double? buttonElevation,
    Color? buttonTextColor,
    Color? buttonDisabledColor,
    Color? buttonDisabledTextColor,
    Color? textFieldBackgroundColor,
    Color? textFieldBorderColor,
    Color? textFieldFocusedBorderColor,
    Color? textFieldHintColor,
    EdgeInsets? textFieldContentPadding,
    Color? shimmerBaseColor,
    Color? shimmerHighlightColor,
    Duration? shimmerDuration,
    double? shimmerBorderRadius,
    Color? appBarBackgroundColor,
    Color? appBarForegroundColor,
    double? appBarElevation,
    TextStyle? appBarTitleStyle,
    bool? appBarCenterTitle,
    Color? bottomNavBackgroundColor,
    Color? bottomNavSelectedColor,
    Color? bottomNavUnselectedColor,
    double? bottomNavElevation,
    double? bottomNavIconSize,
    bool? bottomNavShowLabels,
    double? bottomNavIndicatorHeight,
    Duration? animationDuration,
    Duration? animationDurationFast,
    Duration? animationDurationSlow,
    Curve? animationCurve,
  }) {
    return UIProThemeData(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      surfaceColor: surfaceColor ?? this.surfaceColor,
      textColor: textColor ?? this.textColor,
      textSecondaryColor: textSecondaryColor ?? this.textSecondaryColor,
      errorColor: errorColor ?? this.errorColor,
      successColor: successColor ?? this.successColor,
      warningColor: warningColor ?? this.warningColor,
      dividerColor: dividerColor ?? this.dividerColor,
      disabledColor: disabledColor ?? this.disabledColor,
      fontFamily: fontFamily ?? this.fontFamily,
      fontSizeBase: fontSizeBase ?? this.fontSizeBase,
      fontSizeSmall: fontSizeSmall ?? this.fontSizeSmall,
      fontSizeLarge: fontSizeLarge ?? this.fontSizeLarge,
      fontSizeXLarge: fontSizeXLarge ?? this.fontSizeXLarge,
      fontWeightRegular: fontWeightRegular ?? this.fontWeightRegular,
      fontWeightMedium: fontWeightMedium ?? this.fontWeightMedium,
      fontWeightBold: fontWeightBold ?? this.fontWeightBold,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      lineHeight: lineHeight ?? this.lineHeight,
      spacingXS: spacingXS ?? this.spacingXS,
      spacingSM: spacingSM ?? this.spacingSM,
      spacingMD: spacingMD ?? this.spacingMD,
      spacingLG: spacingLG ?? this.spacingLG,
      spacingXL: spacingXL ?? this.spacingXL,
      borderRadius: borderRadius ?? this.borderRadius,
      borderRadiusSmall: borderRadiusSmall ?? this.borderRadiusSmall,
      borderRadiusLarge: borderRadiusLarge ?? this.borderRadiusLarge,
      borderWidth: borderWidth ?? this.borderWidth,
      buttonHeight: buttonHeight ?? this.buttonHeight,
      buttonPaddingHorizontal:
          buttonPaddingHorizontal ?? this.buttonPaddingHorizontal,
      buttonPaddingVertical:
          buttonPaddingVertical ?? this.buttonPaddingVertical,
      buttonElevation: buttonElevation ?? this.buttonElevation,
      buttonTextColor: buttonTextColor ?? this.buttonTextColor,
      buttonDisabledColor: buttonDisabledColor ?? this.buttonDisabledColor,
      buttonDisabledTextColor:
          buttonDisabledTextColor ?? this.buttonDisabledTextColor,
      textFieldBackgroundColor:
          textFieldBackgroundColor ?? this.textFieldBackgroundColor,
      textFieldBorderColor: textFieldBorderColor ?? this.textFieldBorderColor,
      textFieldFocusedBorderColor:
          textFieldFocusedBorderColor ?? this.textFieldFocusedBorderColor,
      textFieldHintColor: textFieldHintColor ?? this.textFieldHintColor,
      textFieldContentPadding:
          textFieldContentPadding ?? this.textFieldContentPadding,
      shimmerBaseColor: shimmerBaseColor ?? this.shimmerBaseColor,
      shimmerHighlightColor:
          shimmerHighlightColor ?? this.shimmerHighlightColor,
      shimmerDuration: shimmerDuration ?? this.shimmerDuration,
      shimmerBorderRadius: shimmerBorderRadius ?? this.shimmerBorderRadius,
      appBarBackgroundColor:
          appBarBackgroundColor ?? this.appBarBackgroundColor,
      appBarForegroundColor:
          appBarForegroundColor ?? this.appBarForegroundColor,
      appBarElevation: appBarElevation ?? this.appBarElevation,
      appBarTitleStyle: appBarTitleStyle ?? this.appBarTitleStyle,
      appBarCenterTitle: appBarCenterTitle ?? this.appBarCenterTitle,
      bottomNavBackgroundColor:
          bottomNavBackgroundColor ?? this.bottomNavBackgroundColor,
      bottomNavSelectedColor:
          bottomNavSelectedColor ?? this.bottomNavSelectedColor,
      bottomNavUnselectedColor:
          bottomNavUnselectedColor ?? this.bottomNavUnselectedColor,
      bottomNavElevation: bottomNavElevation ?? this.bottomNavElevation,
      bottomNavIconSize: bottomNavIconSize ?? this.bottomNavIconSize,
      bottomNavShowLabels: bottomNavShowLabels ?? this.bottomNavShowLabels,
      bottomNavIndicatorHeight:
          bottomNavIndicatorHeight ?? this.bottomNavIndicatorHeight,
      animationDuration: animationDuration ?? this.animationDuration,
      animationDurationFast:
          animationDurationFast ?? this.animationDurationFast,
      animationDurationSlow:
          animationDurationSlow ?? this.animationDurationSlow,
      animationCurve: animationCurve ?? this.animationCurve,
    );
  }

  // ─────────────────────────────────────────────────────────────────────
  // PRESETS
  // ─────────────────────────────────────────────────────────────────────

  /// Default light theme preset.
  static const UIProThemeData light = UIProThemeData();

  /// Dark theme preset.
  static const UIProThemeData dark = UIProThemeData(
    primaryColor: Color(0xFF64B5F6),
    secondaryColor: Color(0xFFCE93D8),
    backgroundColor: Color(0xFF121212),
    surfaceColor: Color(0xFF1E1E1E),
    textColor: Color(0xFFE0E0E0),
    textSecondaryColor: Color(0xFF9E9E9E),
    dividerColor: Color(0xFF424242),
    disabledColor: Color(0xFF616161),
    shimmerBaseColor: Color(0xFF2C2C2C),
    shimmerHighlightColor: Color(0xFF3D3D3D),
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UIProThemeData &&
          runtimeType == other.runtimeType &&
          primaryColor == other.primaryColor &&
          secondaryColor == other.secondaryColor &&
          backgroundColor == other.backgroundColor &&
          surfaceColor == other.surfaceColor &&
          textColor == other.textColor &&
          textSecondaryColor == other.textSecondaryColor &&
          borderRadius == other.borderRadius &&
          fontFamily == other.fontFamily;

  @override
  int get hashCode =>
      primaryColor.hashCode ^
      secondaryColor.hashCode ^
      backgroundColor.hashCode ^
      textColor.hashCode ^
      borderRadius.hashCode;
}
