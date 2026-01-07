import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/theme/ui_theme.dart';
import '../../core/theme/ui_theme_data.dart';

/// A theme-aware app bar with consistent styling.
///
/// [UIProAppBar] automatically adapts to theme changes and provides
/// a consistent app bar experience across your app.
///
/// Example:
/// ```dart
/// UIProAppBar(
///   title: "Home",
///   onBackPressed: () => Navigator.pop(context),
/// )
/// ```
///
/// With actions:
/// ```dart
/// UIProAppBar(
///   title: "Settings",
///   actions: [
///     UIProAppBarAction(
///       icon: Icons.search,
///       onPressed: () => openSearch(),
///     ),
///   ],
/// )
/// ```
class UIProAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// The title text or widget.
  final dynamic title;

  /// Whether to show the back button.
  final bool showBackButton;

  /// Custom back button callback.
  /// If null, uses Navigator.pop when back button is pressed.
  final VoidCallback? onBackPressed;

  /// Custom back button icon.
  final IconData? backIcon;

  /// Leading widget (overrides back button).
  final Widget? leading;

  /// Action buttons.
  final List<UIProAppBarAction>? actions;

  /// Custom trailing widget (overrides actions).
  final Widget? trailing;

  /// Background color (overrides theme).
  final Color? backgroundColor;

  /// Foreground/icon color (overrides theme).
  final Color? foregroundColor;

  /// Elevation (overrides theme).
  final double? elevation;

  /// Whether to center the title (overrides theme).
  final bool? centerTitle;

  /// Custom title text style.
  final TextStyle? titleStyle;

  /// Bottom widget (e.g., TabBar).
  final PreferredSizeWidget? bottom;

  /// System UI overlay style.
  final SystemUiOverlayStyle? systemOverlayStyle;

  /// Whether this app bar is for a sliver.
  final bool isSliver;

  /// Whether the title should be large (for sliver).
  final bool largeTitle;

  /// Flexible space widget.
  final Widget? flexibleSpace;

  /// Whether to automatically imply leading.
  final bool automaticallyImplyLeading;

  /// Creates a theme-aware app bar.
  const UIProAppBar({
    super.key,
    this.title,
    this.showBackButton = false,
    this.onBackPressed,
    this.backIcon,
    this.leading,
    this.actions,
    this.trailing,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation,
    this.centerTitle,
    this.titleStyle,
    this.bottom,
    this.systemOverlayStyle,
    this.isSliver = false,
    this.largeTitle = false,
    this.flexibleSpace,
    this.automaticallyImplyLeading = true,
  });

  /// Creates a transparent app bar (useful for overlays).
  const UIProAppBar.transparent({
    super.key,
    this.title,
    this.showBackButton = false,
    this.onBackPressed,
    this.backIcon,
    this.leading,
    this.actions,
    this.trailing,
    this.foregroundColor,
    this.centerTitle,
    this.titleStyle,
    this.bottom,
    this.systemOverlayStyle,
    this.flexibleSpace,
    this.automaticallyImplyLeading = true,
  }) : backgroundColor = Colors.transparent,
       elevation = 0,
       isSliver = false,
       largeTitle = false;

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0));

  @override
  Widget build(BuildContext context) {
    final theme = UIProTheme.of(context);

    final effectiveBackgroundColor =
        backgroundColor ?? theme.effectiveAppBarBackgroundColor;
    final effectiveForegroundColor =
        foregroundColor ?? theme.effectiveAppBarForegroundColor;
    final effectiveElevation = elevation ?? theme.appBarElevation;
    final effectiveCenterTitle = centerTitle ?? theme.appBarCenterTitle;

    final effectiveTitleStyle = theme
        .textStyle(
          fontSize: theme.fontSizeLarge,
          fontWeight: theme.fontWeightMedium,
          color: effectiveForegroundColor,
        )
        .merge(theme.appBarTitleStyle)
        .merge(titleStyle);

    // Build title widget
    Widget? titleWidget;
    if (title != null) {
      if (title is Widget) {
        titleWidget = title as Widget;
      } else {
        titleWidget = Text(title.toString(), style: effectiveTitleStyle);
      }
    }

    // Build leading widget
    Widget? leadingWidget;
    if (leading != null) {
      leadingWidget = leading;
    } else if (showBackButton) {
      leadingWidget = IconButton(
        icon: Icon(
          backIcon ?? Icons.arrow_back_ios_new,
          color: effectiveForegroundColor,
        ),
        onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
      );
    }

    // Build actions
    List<Widget>? actionWidgets;
    if (trailing != null) {
      actionWidgets = [trailing!];
    } else if (actions != null && actions!.isNotEmpty) {
      actionWidgets = actions!.map((action) {
        if (action.child != null) {
          return action.child!;
        }
        return _buildActionButton(action, effectiveForegroundColor, theme);
      }).toList();
    }

    if (isSliver) {
      return SliverAppBar(
        title: titleWidget,
        leading: leadingWidget,
        actions: actionWidgets,
        backgroundColor: effectiveBackgroundColor,
        foregroundColor: effectiveForegroundColor,
        elevation: effectiveElevation,
        centerTitle: effectiveCenterTitle,
        bottom: bottom,
        systemOverlayStyle: systemOverlayStyle,
        flexibleSpace: flexibleSpace,
        automaticallyImplyLeading: automaticallyImplyLeading,
        pinned: true,
        floating: false,
        expandedHeight: largeTitle ? 120 : null,
      );
    }

    return AppBar(
      title: titleWidget,
      leading: leadingWidget,
      actions: actionWidgets,
      backgroundColor: effectiveBackgroundColor,
      foregroundColor: effectiveForegroundColor,
      elevation: effectiveElevation,
      centerTitle: effectiveCenterTitle,
      bottom: bottom,
      systemOverlayStyle: systemOverlayStyle,
      flexibleSpace: flexibleSpace,
      automaticallyImplyLeading: automaticallyImplyLeading,
    );
  }

  Widget _buildActionButton(
    UIProAppBarAction action,
    Color foregroundColor,
    UIProThemeData theme,
  ) {
    Widget button = IconButton(
      icon: action.badge != null
          ? Badge(
              label: Text(action.badge!),
              child: Icon(action.icon, color: action.color ?? foregroundColor),
            )
          : Icon(action.icon, color: action.color ?? foregroundColor),
      onPressed: action.onPressed,
    );

    if (action.tooltip != null) {
      button = Tooltip(message: action.tooltip!, child: button);
    }

    return button;
  }
}

/// An action button for [UIProAppBar].
class UIProAppBarAction {
  /// The icon to display.
  final IconData icon;

  /// Called when the action is pressed.
  final VoidCallback? onPressed;

  /// Optional tooltip.
  final String? tooltip;

  /// Optional badge text.
  final String? badge;

  /// Custom icon color.
  final Color? color;

  /// Custom child widget (overrides icon).
  final Widget? child;

  /// Creates an app bar action.
  const UIProAppBarAction({
    required this.icon,
    this.onPressed,
    this.tooltip,
    this.badge,
    this.color,
    this.child,
  });
}

/// A search app bar variant.
class UIProSearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  /// Hint text for search field.
  final String hint;

  /// Called when search text changes.
  final ValueChanged<String>? onChanged;

  /// Called when search is submitted.
  final ValueChanged<String>? onSubmitted;

  /// Called when back/close is pressed.
  final VoidCallback? onClose;

  /// Initial search text.
  final String? initialText;

  /// Whether to autofocus the search field.
  final bool autofocus;

  /// Background color.
  final Color? backgroundColor;

  /// Text color.
  final Color? textColor;

  /// Creates a search app bar.
  const UIProSearchAppBar({
    super.key,
    this.hint = "Search...",
    this.onChanged,
    this.onSubmitted,
    this.onClose,
    this.initialText,
    this.autofocus = true,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<UIProSearchAppBar> createState() => _UIProSearchAppBarState();
}

class _UIProSearchAppBarState extends State<UIProSearchAppBar> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialText);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = UIProTheme.of(context);

    final effectiveBackgroundColor =
        widget.backgroundColor ?? theme.effectiveAppBarBackgroundColor;
    final effectiveTextColor =
        widget.textColor ?? theme.effectiveAppBarForegroundColor;

    return AppBar(
      backgroundColor: effectiveBackgroundColor,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: effectiveTextColor),
        onPressed: widget.onClose,
      ),
      title: TextField(
        controller: _controller,
        autofocus: widget.autofocus,
        style: theme.textStyle(color: effectiveTextColor),
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: theme.textStyle(
            color: effectiveTextColor.withOpacity(0.6),
          ),
          border: InputBorder.none,
        ),
        onChanged: widget.onChanged,
        onSubmitted: widget.onSubmitted,
      ),
      actions: [
        if (_controller.text.isNotEmpty)
          IconButton(
            icon: Icon(Icons.clear, color: effectiveTextColor),
            onPressed: () {
              _controller.clear();
              widget.onChanged?.call('');
            },
          ),
      ],
    );
  }
}
