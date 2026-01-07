import 'package:flutter/material.dart';
import '../../core/theme/ui_theme.dart';
import '../../core/theme/ui_theme_data.dart';

/// A theme-aware bottom navigation bar with animated selection indicator.
///
/// [UIProBottomNav] automatically adapts to theme changes and provides
/// a modern navigation experience with smooth animations.
///
/// Example:
/// ```dart
/// UIProBottomNav(
///   items: [
///     UIProBottomNavItem(icon: Icons.home, label: "Home"),
///     UIProBottomNavItem(icon: Icons.search, label: "Search"),
///     UIProBottomNavItem(icon: Icons.person, label: "Profile"),
///   ],
///   currentIndex: selectedIndex,
///   onChanged: (index) => setState(() => selectedIndex = index),
/// )
/// ```
class UIProBottomNav extends StatelessWidget {
  /// Navigation items.
  final List<UIProBottomNavItem> items;

  /// Currently selected index.
  final int currentIndex;

  /// Called when an item is tapped.
  final ValueChanged<int> onChanged;

  /// Background color (overrides theme).
  final Color? backgroundColor;

  /// Selected item color (overrides theme).
  final Color? selectedColor;

  /// Unselected item color (overrides theme).
  final Color? unselectedColor;

  /// Elevation (overrides theme).
  final double? elevation;

  /// Icon size (overrides theme).
  final double? iconSize;

  /// Whether to show labels (overrides theme).
  final bool? showLabels;

  /// Label text style.
  final TextStyle? labelStyle;

  /// Navigation bar type.
  final UIProBottomNavType type;

  /// Indicator height (overrides theme).
  final double? indicatorHeight;

  /// Indicator color.
  final Color? indicatorColor;

  /// Indicator width (for dot type).
  final double indicatorWidth;

  /// Whether to use haptic feedback.
  final bool enableHapticFeedback;

  /// Creates a theme-aware bottom navigation bar.
  const UIProBottomNav({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onChanged,
    this.backgroundColor,
    this.selectedColor,
    this.unselectedColor,
    this.elevation,
    this.iconSize,
    this.showLabels,
    this.labelStyle,
    this.type = UIProBottomNavType.standard,
    this.indicatorHeight,
    this.indicatorColor,
    this.indicatorWidth = 4,
    this.enableHapticFeedback = true,
  });

  /// Creates a floating bottom navigation bar.
  const UIProBottomNav.floating({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onChanged,
    this.backgroundColor,
    this.selectedColor,
    this.unselectedColor,
    this.iconSize,
    this.showLabels = false,
    this.labelStyle,
    this.indicatorHeight,
    this.indicatorColor,
    this.indicatorWidth = 4,
    this.enableHapticFeedback = true,
  }) : type = UIProBottomNavType.floating,
       elevation = 8;

  @override
  Widget build(BuildContext context) {
    final theme = UIProTheme.of(context);

    final effectiveBackgroundColor =
        backgroundColor ?? theme.effectiveBottomNavBackgroundColor;
    final effectiveSelectedColor =
        selectedColor ?? theme.effectiveBottomNavSelectedColor;
    final effectiveUnselectedColor =
        unselectedColor ?? theme.effectiveBottomNavUnselectedColor;
    final effectiveElevation = elevation ?? theme.bottomNavElevation;
    final effectiveIconSize = iconSize ?? theme.bottomNavIconSize;
    final effectiveShowLabels = showLabels ?? theme.bottomNavShowLabels;
    final effectiveIndicatorHeight =
        indicatorHeight ?? theme.bottomNavIndicatorHeight;

    if (type == UIProBottomNavType.floating) {
      return _buildFloatingNav(
        context: context,
        theme: theme,
        backgroundColor: effectiveBackgroundColor,
        selectedColor: effectiveSelectedColor,
        unselectedColor: effectiveUnselectedColor,
        elevation: effectiveElevation,
        iconSize: effectiveIconSize,
        showLabels: effectiveShowLabels,
        indicatorHeight: effectiveIndicatorHeight,
      );
    }

    return _buildStandardNav(
      context: context,
      theme: theme,
      backgroundColor: effectiveBackgroundColor,
      selectedColor: effectiveSelectedColor,
      unselectedColor: effectiveUnselectedColor,
      elevation: effectiveElevation,
      iconSize: effectiveIconSize,
      showLabels: effectiveShowLabels,
      indicatorHeight: effectiveIndicatorHeight,
    );
  }

  Widget _buildStandardNav({
    required BuildContext context,
    required UIProThemeData theme,
    required Color backgroundColor,
    required Color selectedColor,
    required Color unselectedColor,
    required double elevation,
    required double iconSize,
    required bool showLabels,
    required double indicatorHeight,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: elevation > 0
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: elevation,
                  offset: const Offset(0, -2),
                ),
              ]
            : null,
      ),
      child: SafeArea(
        child: SizedBox(
          height: 60 + (showLabels ? 16 : 0),
          child: Row(
            children: List.generate(items.length, (index) {
              final item = items[index];
              final isSelected = index == currentIndex;

              return Expanded(
                child: _NavItem(
                  item: item,
                  isSelected: isSelected,
                  selectedColor: selectedColor,
                  unselectedColor: unselectedColor,
                  iconSize: iconSize,
                  showLabel: showLabels,
                  labelStyle: labelStyle,
                  indicatorHeight: indicatorHeight,
                  indicatorColor: indicatorColor ?? selectedColor,
                  indicatorWidth: indicatorWidth,
                  theme: theme,
                  onTap: () => onChanged(index),
                  enableHapticFeedback: enableHapticFeedback,
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildFloatingNav({
    required BuildContext context,
    required UIProThemeData theme,
    required Color backgroundColor,
    required Color selectedColor,
    required Color unselectedColor,
    required double elevation,
    required double iconSize,
    required bool showLabels,
    required double indicatorHeight,
  }) {
    return Padding(
      padding: EdgeInsets.all(theme.spacingMD),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: theme.largeBorderRadius,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: elevation * 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: theme.largeBorderRadius,
          child: SizedBox(
            height: 60 + (showLabels ? 16 : 0),
            child: Row(
              children: List.generate(items.length, (index) {
                final item = items[index];
                final isSelected = index == currentIndex;

                return Expanded(
                  child: _NavItem(
                    item: item,
                    isSelected: isSelected,
                    selectedColor: selectedColor,
                    unselectedColor: unselectedColor,
                    iconSize: iconSize,
                    showLabel: showLabels,
                    labelStyle: labelStyle,
                    indicatorHeight: indicatorHeight,
                    indicatorColor: indicatorColor ?? selectedColor,
                    indicatorWidth: indicatorWidth,
                    theme: theme,
                    onTap: () => onChanged(index),
                    enableHapticFeedback: enableHapticFeedback,
                    isFloating: true,
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final UIProBottomNavItem item;
  final bool isSelected;
  final Color selectedColor;
  final Color unselectedColor;
  final double iconSize;
  final bool showLabel;
  final TextStyle? labelStyle;
  final double indicatorHeight;
  final Color indicatorColor;
  final double indicatorWidth;
  final UIProThemeData theme;
  final VoidCallback onTap;
  final bool enableHapticFeedback;
  final bool isFloating;

  const _NavItem({
    required this.item,
    required this.isSelected,
    required this.selectedColor,
    required this.unselectedColor,
    required this.iconSize,
    required this.showLabel,
    this.labelStyle,
    required this.indicatorHeight,
    required this.indicatorColor,
    required this.indicatorWidth,
    required this.theme,
    required this.onTap,
    required this.enableHapticFeedback,
    this.isFloating = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? selectedColor : unselectedColor;
    final icon = isSelected ? (item.activeIcon ?? item.icon) : item.icon;

    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Top indicator
          AnimatedContainer(
            duration: theme.animationDuration,
            curve: theme.animationCurve,
            height: indicatorHeight,
            width: isSelected ? 24 : 0,
            decoration: BoxDecoration(
              color: isSelected ? indicatorColor : Colors.transparent,
              borderRadius: BorderRadius.circular(indicatorHeight),
            ),
          ),
          SizedBox(height: theme.spacingXS),
          // Icon with badge
          Stack(
            clipBehavior: Clip.none,
            children: [
              AnimatedScale(
                duration: theme.animationDurationFast,
                scale: isSelected ? 1.1 : 1.0,
                child: Icon(icon, size: iconSize, color: color),
              ),
              if (item.badge != null)
                Positioned(
                  right: -8,
                  top: -4,
                  child: _Badge(
                    text: item.badge!,
                    color: item.badgeColor ?? theme.errorColor,
                  ),
                ),
              if (item.showBadgeDot)
                Positioned(
                  right: -2,
                  top: 0,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: item.badgeColor ?? theme.errorColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
          // Label
          if (showLabel && item.label != null) ...[
            SizedBox(height: theme.spacingXS),
            AnimatedDefaultTextStyle(
              duration: theme.animationDurationFast,
              style:
                  (labelStyle ?? theme.textStyle(fontSize: theme.fontSizeSmall))
                      .copyWith(
                        color: color,
                        fontWeight: isSelected
                            ? theme.fontWeightMedium
                            : theme.fontWeightRegular,
                      ),
              child: Text(
                item.label!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String text;
  final Color color;

  const _Badge({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      constraints: const BoxConstraints(minWidth: 16),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

/// A navigation item for [UIProBottomNav].
class UIProBottomNavItem {
  /// The icon to display.
  final IconData icon;

  /// The icon to display when selected.
  final IconData? activeIcon;

  /// The label text.
  final String? label;

  /// Badge text (e.g., notification count).
  final String? badge;

  /// Whether to show a simple dot badge.
  final bool showBadgeDot;

  /// Badge color.
  final Color? badgeColor;

  /// Creates a bottom navigation item.
  const UIProBottomNavItem({
    required this.icon,
    this.activeIcon,
    this.label,
    this.badge,
    this.showBadgeDot = false,
    this.badgeColor,
  });
}

/// Bottom navigation bar types.
enum UIProBottomNavType {
  /// Standard full-width navigation bar.
  standard,

  /// Floating navigation bar with rounded corners.
  floating,
}
