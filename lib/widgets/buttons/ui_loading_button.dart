import 'package:flutter/material.dart';
import '../../core/theme/ui_theme.dart';
import '../../core/theme/ui_theme_data.dart';

/// A theme-aware button with built-in loading state support.
///
/// [UIProLoadingButton] automatically adapts to theme changes and provides
/// a smooth loading animation without requiring external state management.
///
/// Example:
/// ```dart
/// UIProLoadingButton(
///   text: "Login",
///   isLoading: isLoading,
///   onPressed: () => handleLogin(),
/// )
/// ```
///
/// With custom styling:
/// ```dart
/// UIProLoadingButton(
///   text: "Submit",
///   isLoading: false,
///   onPressed: () {},
///   backgroundColor: Colors.green,
///   textColor: Colors.white,
///   borderRadius: 8,
/// )
/// ```
class UIProLoadingButton extends StatelessWidget {
  /// The button text.
  final String text;

  /// Whether the button is in loading state.
  final bool isLoading;

  /// Called when the button is pressed.
  /// If null, the button is disabled.
  final VoidCallback? onPressed;

  /// Custom background color (overrides theme).
  final Color? backgroundColor;

  /// Custom text color (overrides theme).
  final Color? textColor;

  /// Custom disabled background color.
  final Color? disabledBackgroundColor;

  /// Custom disabled text color.
  final Color? disabledTextColor;

  /// Custom border radius (overrides theme).
  final double? borderRadius;

  /// Custom button height (overrides theme).
  final double? height;

  /// Custom button width. If null, takes available width.
  final double? width;

  /// Whether the button should expand to full width.
  final bool fullWidth;

  /// Custom padding (overrides theme).
  final EdgeInsets? padding;

  /// Custom elevation (overrides theme).
  final double? elevation;

  /// Custom text style (merged with theme).
  final TextStyle? textStyle;

  /// Custom icon to show before text.
  final Widget? leading;

  /// Custom icon to show after text.
  final Widget? trailing;

  /// Size of the loading indicator.
  final double loadingIndicatorSize;

  /// Color of the loading indicator.
  final Color? loadingIndicatorColor;

  /// Loading indicator stroke width.
  final double loadingIndicatorStrokeWidth;

  /// Custom loading widget (replaces default indicator).
  final Widget? loadingWidget;

  /// Border side for outlined variant.
  final BorderSide? borderSide;

  /// Button variant style.
  final UIProButtonVariant variant;

  /// Whether to animate between states.
  final bool animateStateChanges;

  /// Splash color when button is tapped.
  /// Defaults to [Colors.transparent] (no splash effect).
  final Color? splashColor;

  /// Creates a loading-aware button.
  const UIProLoadingButton({
    super.key,
    required this.text,
    this.isLoading = false,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.disabledBackgroundColor,
    this.disabledTextColor,
    this.borderRadius,
    this.height,
    this.width,
    this.fullWidth = true,
    this.padding,
    this.elevation,
    this.textStyle,
    this.leading,
    this.trailing,
    this.loadingIndicatorSize = 20,
    this.loadingIndicatorColor,
    this.loadingIndicatorStrokeWidth = 2.5,
    this.loadingWidget,
    this.borderSide,
    this.variant = UIProButtonVariant.filled,
    this.animateStateChanges = true,
    this.splashColor,
  });

  /// Creates a filled button (default).
  const UIProLoadingButton.filled({
    super.key,
    required this.text,
    this.isLoading = false,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.disabledBackgroundColor,
    this.disabledTextColor,
    this.borderRadius,
    this.height,
    this.width,
    this.fullWidth = true,
    this.padding,
    this.elevation,
    this.textStyle,
    this.leading,
    this.trailing,
    this.loadingIndicatorSize = 20,
    this.loadingIndicatorColor,
    this.loadingIndicatorStrokeWidth = 2.5,
    this.loadingWidget,
    this.animateStateChanges = true,
    this.splashColor,
  }) : variant = UIProButtonVariant.filled,
       borderSide = null;

  /// Creates an outlined button.
  const UIProLoadingButton.outlined({
    super.key,
    required this.text,
    this.isLoading = false,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.disabledBackgroundColor,
    this.disabledTextColor,
    this.borderRadius,
    this.height,
    this.width,
    this.fullWidth = true,
    this.padding,
    this.elevation = 0,
    this.textStyle,
    this.leading,
    this.trailing,
    this.loadingIndicatorSize = 20,
    this.loadingIndicatorColor,
    this.loadingIndicatorStrokeWidth = 2.5,
    this.loadingWidget,
    this.borderSide,
    this.animateStateChanges = true,
    this.splashColor,
  }) : variant = UIProButtonVariant.outlined;

  /// Creates a text-only button.
  const UIProLoadingButton.text({
    super.key,
    required this.text,
    this.isLoading = false,
    this.onPressed,
    this.textColor,
    this.disabledTextColor,
    this.borderRadius,
    this.height,
    this.width,
    this.fullWidth = false,
    this.padding,
    this.textStyle,
    this.leading,
    this.trailing,
    this.loadingIndicatorSize = 20,
    this.loadingIndicatorColor,
    this.loadingIndicatorStrokeWidth = 2.5,
    this.loadingWidget,
    this.animateStateChanges = true,
    this.splashColor,
  }) : variant = UIProButtonVariant.text,
       backgroundColor = null,
       disabledBackgroundColor = null,
       elevation = 0,
       borderSide = null;

  bool get _isDisabled => onPressed == null || isLoading;

  @override
  Widget build(BuildContext context) {
    final theme = UIProTheme.of(context);

    final effectiveBorderRadius = borderRadius ?? theme.borderRadius;
    final effectiveHeight = height ?? theme.buttonHeight;
    final effectiveElevation = elevation ?? theme.buttonElevation;

    final effectivePadding =
        padding ??
        EdgeInsets.symmetric(
          horizontal: theme.buttonPaddingHorizontal,
          vertical: theme.buttonPaddingVertical,
        );

    // Determine colors based on variant and state
    Color effectiveBackgroundColor;
    Color effectiveTextColor;
    Color effectiveLoadingColor;

    switch (variant) {
      case UIProButtonVariant.filled:
        effectiveBackgroundColor = _isDisabled
            ? (disabledBackgroundColor ?? theme.effectiveButtonDisabledColor)
            : (backgroundColor ?? theme.primaryColor);
        effectiveTextColor = _isDisabled
            ? (disabledTextColor ?? theme.effectiveButtonDisabledTextColor)
            : (textColor ?? theme.effectiveButtonTextColor);
        effectiveLoadingColor = loadingIndicatorColor ?? effectiveTextColor;
        break;
      case UIProButtonVariant.outlined:
        effectiveBackgroundColor = backgroundColor ?? Colors.transparent;
        effectiveTextColor = _isDisabled
            ? (disabledTextColor ?? theme.disabledColor)
            : (textColor ?? theme.primaryColor);
        effectiveLoadingColor = loadingIndicatorColor ?? effectiveTextColor;
        break;
      case UIProButtonVariant.text:
        effectiveBackgroundColor = Colors.transparent;
        effectiveTextColor = _isDisabled
            ? (disabledTextColor ?? theme.disabledColor)
            : (textColor ?? theme.primaryColor);
        effectiveLoadingColor = loadingIndicatorColor ?? effectiveTextColor;
        break;
    }

    final effectiveTextStyle = theme
        .textStyle(
          fontSize: theme.fontSizeBase,
          fontWeight: theme.fontWeightMedium,
          color: effectiveTextColor,
        )
        .merge(textStyle);

    // Build button content
    Widget content = _buildContent(
      theme: theme,
      textStyle: effectiveTextStyle,
      loadingColor: effectiveLoadingColor,
    );

    // Build button shape
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(effectiveBorderRadius),
      side: variant == UIProButtonVariant.outlined
          ? (borderSide ??
                BorderSide(
                  color: _isDisabled ? theme.disabledColor : theme.primaryColor,
                  width: theme.borderWidth,
                ))
          : BorderSide.none,
    );

    // Build the button
    Widget button = Material(
      color: effectiveBackgroundColor,
      elevation: effectiveElevation,
      shape: shape,
      child: InkWell(
        onTap: _isDisabled ? null : onPressed,
        borderRadius: BorderRadius.circular(effectiveBorderRadius),
        splashColor: splashColor ?? Colors.grey.withValues(alpha: 0.2),
        highlightColor:
            splashColor?.withValues(alpha: 0.1) ?? Colors.transparent,
        child: Container(
          height: effectiveHeight,
          padding: effectivePadding,
          child: content,
        ),
      ),
    );

    // Apply width constraints
    if (width != null) {
      button = SizedBox(width: width, child: button);
    } else if (fullWidth) {
      button = SizedBox(width: double.infinity, child: button);
    }

    // Animate state changes
    if (animateStateChanges) {
      button = AnimatedOpacity(
        duration: theme.animationDurationFast,
        opacity: _isDisabled && !isLoading ? 0.7 : 1.0,
        child: button,
      );
    }

    return button;
  }

  Widget _buildContent({
    required UIProThemeData theme,
    required TextStyle textStyle,
    required Color loadingColor,
  }) {
    if (isLoading) {
      return Center(
        child:
            loadingWidget ??
            SizedBox(
              width: loadingIndicatorSize,
              height: loadingIndicatorSize,
              child: CircularProgressIndicator(
                strokeWidth: loadingIndicatorStrokeWidth,
                valueColor: AlwaysStoppedAnimation<Color>(loadingColor),
              ),
            ),
      );
    }

    return Row(
      mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (leading != null) ...[leading!, SizedBox(width: theme.spacingSM)],
        Flexible(
          child: Text(
            text,
            style: textStyle,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (trailing != null) ...[SizedBox(width: theme.spacingSM), trailing!],
      ],
    );
  }
}

/// Button style variants.
enum UIProButtonVariant {
  /// Solid filled button.
  filled,

  /// Outlined button with transparent background.
  outlined,

  /// Text-only button.
  text,
}

/// A simple icon button with theme awareness.
class UIProIconButton extends StatelessWidget {
  /// The icon to display.
  final IconData icon;

  /// Called when the button is pressed.
  final VoidCallback? onPressed;

  /// Icon size.
  final double? size;

  /// Icon color.
  final Color? color;

  /// Background color.
  final Color? backgroundColor;

  /// Whether the button is loading.
  final bool isLoading;

  /// Splash radius.
  final double? splashRadius;

  /// Splash color when button is tapped.
  /// Defaults to [Colors.transparent] (no splash effect).
  final Color? splashColor;

  /// Tooltip text.
  final String? tooltip;

  /// Creates a themed icon button.
  const UIProIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.size,
    this.color,
    this.backgroundColor,
    this.isLoading = false,
    this.splashRadius,
    this.splashColor,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIProTheme.of(context);
    final effectiveSize = size ?? 24.0;
    final effectiveColor = color ?? theme.textColor;

    Widget button = Material(
      color: backgroundColor ?? Colors.transparent,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: isLoading ? null : onPressed,
        customBorder: const CircleBorder(),
        splashColor: splashColor ?? Colors.transparent,
        highlightColor:
            splashColor?.withValues(alpha: 0.1) ?? Colors.transparent,
        child: Padding(
          padding: EdgeInsets.all(theme.spacingSM),
          child: isLoading
              ? SizedBox(
                  width: effectiveSize,
                  height: effectiveSize,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(effectiveColor),
                  ),
                )
              : Icon(
                  icon,
                  size: effectiveSize,
                  color: onPressed == null
                      ? theme.disabledColor
                      : effectiveColor,
                ),
        ),
      ),
    );

    if (tooltip != null) {
      button = Tooltip(message: tooltip!, child: button);
    }

    return button;
  }
}
