import 'package:flutter/material.dart';

/// A customizable button with built-in loading state support.
///
/// [UIProButton] provides a smooth loading animation without requiring
/// external state management.
///
/// Example:
/// ```dart
/// UIProButton(
///   text: "Login",
///   isLoading: isLoading,
///   onPressed: () => handleLogin(),
/// )
/// ```
///
/// With custom styling:
/// ```dart
/// UIProButton(
///   text: "Submit",
///   isLoading: false,
///   onPressed: () {},
///   backgroundColor: Colors.green,
///   textColor: Colors.white,
///   borderRadius: 8,
/// )
/// ```
class UIProButton extends StatelessWidget {
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
  const UIProButton({
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
  const UIProButton.filled({
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
  })  : variant = UIProButtonVariant.filled,
        borderSide = null;

  /// Creates an outlined button.
  const UIProButton.outlined({
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
  const UIProButton.text({
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
  })  : variant = UIProButtonVariant.text,
        backgroundColor = null,
        disabledBackgroundColor = null,
        elevation = 0,
        borderSide = null;

  bool get _isDisabled => onPressed == null || isLoading;

  @override
  Widget build(BuildContext context) {
    final materialTheme = Theme.of(context);

    final effectiveBorderRadius = borderRadius ?? 12.0;
    final effectiveHeight = height ?? 48.0;
    final effectiveElevation = elevation ?? 2.0;

    final effectivePadding = padding ??
        const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 12.0,
        );

    // Determine colors based on variant and state
    Color effectiveBackgroundColor;
    Color effectiveTextColor;
    Color effectiveLoadingColor;

    switch (variant) {
      case UIProButtonVariant.filled:
        effectiveBackgroundColor = _isDisabled
            ? (disabledBackgroundColor ?? materialTheme.disabledColor)
            : (backgroundColor ?? materialTheme.primaryColor);
        effectiveTextColor = _isDisabled
            ? (disabledTextColor ??
                materialTheme.disabledColor.withOpacity(0.6))
            : (textColor ?? materialTheme.colorScheme.onPrimary);
        effectiveLoadingColor = loadingIndicatorColor ?? effectiveTextColor;
        break;
      case UIProButtonVariant.outlined:
        effectiveBackgroundColor = backgroundColor ?? Colors.transparent;
        effectiveTextColor = _isDisabled
            ? (disabledTextColor ?? materialTheme.disabledColor)
            : (textColor ?? materialTheme.primaryColor);
        effectiveLoadingColor = loadingIndicatorColor ?? effectiveTextColor;
        break;
      case UIProButtonVariant.text:
        effectiveBackgroundColor = Colors.transparent;
        effectiveTextColor = _isDisabled
            ? (disabledTextColor ?? materialTheme.disabledColor)
            : (textColor ?? materialTheme.primaryColor);
        effectiveLoadingColor = loadingIndicatorColor ?? effectiveTextColor;
        break;
    }

    final effectiveTextStyle = materialTheme.textTheme.labelLarge
            ?.copyWith(
              color: effectiveTextColor,
              fontWeight: FontWeight.w500,
            )
            .merge(textStyle) ??
        TextStyle(
          color: effectiveTextColor,
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ).merge(textStyle);

    // Build button content
    Widget content = _buildContent(
      textStyle: effectiveTextStyle,
      loadingColor: effectiveLoadingColor,
    );

    // Build button shape
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(effectiveBorderRadius),
      side: variant == UIProButtonVariant.outlined
          ? (borderSide ??
              BorderSide(
                color: _isDisabled
                    ? materialTheme.disabledColor
                    : materialTheme.primaryColor,
                width: 1.0,
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
        splashColor: splashColor ?? Colors.grey.withOpacity(0.2),
        highlightColor: splashColor?.withOpacity(0.1) ?? Colors.transparent,
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
        duration: const Duration(milliseconds: 150),
        opacity: _isDisabled && !isLoading ? 0.7 : 1.0,
        child: button,
      );
    }

    return button;
  }

  Widget _buildContent({
    required TextStyle textStyle,
    required Color loadingColor,
  }) {
    if (isLoading) {
      return Center(
        child: loadingWidget ??
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
        if (leading != null) ...[leading!, const SizedBox(width: 8.0)],
        Flexible(
          child: Text(
            text,
            style: textStyle,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (trailing != null) ...[const SizedBox(width: 8.0), trailing!],
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
    final materialTheme = Theme.of(context);
    final effectiveSize = size ?? 24.0;
    final effectiveColor =
        color ?? materialTheme.iconTheme.color ?? Colors.black87;

    Widget button = Material(
      color: backgroundColor ?? Colors.transparent,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: isLoading ? null : onPressed,
        customBorder: const CircleBorder(),
        splashColor: splashColor ?? Colors.transparent,
        highlightColor: splashColor?.withOpacity(0.1) ?? Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                      ? materialTheme.disabledColor
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
