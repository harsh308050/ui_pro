import 'package:flutter/material.dart';
import 'fluid_bottombar/ui_fluid_bottombar.dart';
import 'fluid_bottombar/utils/fluid_nav_bar_icon.dart';
import 'fluid_bottombar/utils/fluid_nav_bar_style.dart';

/// A customizable bottom navigation bar with animated selection indicator.
///
/// [UIProBottomNav] provides a modern navigation experience with smooth animations.
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

  /// Whether to show the selection indicator.
  final bool showIndicator;

  /// Creates a customizable bottom navigation bar.
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
    this.showIndicator = true,
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
    this.showIndicator = true,
    this.enableHapticFeedback = true,
  })  : type = UIProBottomNavType.floating,
        elevation = 8;

  /// Creates a fluid bottom navigation bar with wave animation.
  ///
  /// Example:
  /// ```dart
  /// UIProBottomNav.fluid(
  ///   items: [
  ///     UIProBottomNavItem(icon: Icons.home, label: "Home"),
  ///     UIProBottomNavItem(icon: Icons.search, label: "Search"),
  ///     UIProBottomNavItem(icon: Icons.person, label: "Profile"),
  ///   ],
  ///   currentIndex: selectedIndex,
  ///   onChanged: (index) => setState(() => selectedIndex = index),
  /// )
  /// ```
  factory UIProBottomNav.fluid({
    Key? key,
    required List<UIProBottomNavItem> items,
    required int currentIndex,
    required ValueChanged<int> onChanged,
    Color? backgroundColor,
    Color? selectedColor,
    Color? unselectedColor,
    double animationFactor = 1.0,
    double scaleFactor = 1.2,
  }) {
    return _UIProFluidBottomNavWrapper(
      key: key,
      items: items,
      currentIndex: currentIndex,
      onChanged: onChanged,
      backgroundColor: backgroundColor,
      selectedColor: selectedColor,
      unselectedColor: unselectedColor,
      animationFactor: animationFactor,
      scaleFactor: scaleFactor,
    );
  }

  @override
  Widget build(BuildContext context) {
    final materialTheme = Theme.of(context);

    final effectiveBackgroundColor = backgroundColor ??
        materialTheme.bottomNavigationBarTheme.backgroundColor ??
        Colors.white;
    final effectiveSelectedColor = selectedColor ?? materialTheme.primaryColor;
    final effectiveUnselectedColor = unselectedColor ?? Colors.grey;
    final effectiveElevation = elevation ?? 8.0;
    final effectiveIconSize = iconSize ?? 24.0;
    final effectiveShowLabels = showLabels ?? true;
    final effectiveIndicatorHeight = indicatorHeight ?? 3.0;

    if (type == UIProBottomNavType.floating) {
      return _buildFloatingNav(
        context: context,
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
                  onTap: () => onChanged(index),
                  enableHapticFeedback: enableHapticFeedback,
                  showIndicator: showIndicator,
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
    required Color backgroundColor,
    required Color selectedColor,
    required Color unselectedColor,
    required double elevation,
    required double iconSize,
    required bool showLabels,
    required double indicatorHeight,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: elevation * 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
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
                    onTap: () => onChanged(index),
                    enableHapticFeedback: enableHapticFeedback,
                    isFloating: true,
                    showIndicator: showIndicator,
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
  final VoidCallback onTap;
  final bool enableHapticFeedback;
  final bool isFloating;
  final bool showIndicator;

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
    required this.onTap,
    required this.enableHapticFeedback,
    this.isFloating = false,
    this.showIndicator = true,
  });

  @override
  Widget build(BuildContext context) {
    final materialTheme = Theme.of(context);
    final color = isSelected ? selectedColor : unselectedColor;
    final icon = isSelected ? (item.activeIcon ?? item.icon) : item.icon;

    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Top indicator
          Visibility(
            visible: showIndicator,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              height: indicatorHeight,
              width: isSelected ? 24 : 0,
              decoration: BoxDecoration(
                color: isSelected ? indicatorColor : Colors.transparent,
                borderRadius: BorderRadius.circular(indicatorHeight),
              ),
            ),
          ),
          const SizedBox(height: 4.0),
          // Icon with badge
          Stack(
            clipBehavior: Clip.none,
            children: [
              AnimatedScale(
                duration: const Duration(milliseconds: 150),
                scale: isSelected ? 1.1 : 1.0,
                child: Icon(icon, size: iconSize, color: color),
              ),
              if (item.badge != null)
                Positioned(
                  right: -8,
                  top: -4,
                  child: _Badge(
                    text: item.badge!,
                    color: item.badgeColor ?? materialTheme.colorScheme.error,
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
                      color: item.badgeColor ?? materialTheme.colorScheme.error,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
          // Label
          if (showLabel && item.label != null) ...[
            const SizedBox(height: 4.0),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 150),
              style: (labelStyle ?? const TextStyle(fontSize: 14.0)).copyWith(
                color: color,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
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

/// Wrapper widget for fluid bottom navigation bar.
///
/// This wrapper converts UIProBottomNavItem to UIProFluidNavBarIcon
/// and manages the fluid bottom bar internally.
class _UIProFluidBottomNavWrapper extends UIProBottomNav {
  final double animationFactor;
  final double scaleFactor;

  const _UIProFluidBottomNavWrapper({
    Key? key,
    required super.items,
    required super.currentIndex,
    required super.onChanged,
    super.backgroundColor,
    super.selectedColor,
    super.unselectedColor,
    this.animationFactor = 1.0,
    this.scaleFactor = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final materialTheme = Theme.of(context);

    // Convert UIProBottomNavItem to UIProFluidNavBarIcon
    final fluidIcons = items.map((item) {
      return UIProFluidNavBarIcon(
        icon: item.icon,
        selectedForegroundColor: selectedColor ?? materialTheme.primaryColor,
        unselectedForegroundColor: unselectedColor ?? Colors.grey,
        backgroundColor: backgroundColor,
      );
    }).toList();

    final style = UIProFluidNavBarStyle(
      barBackgroundColor: backgroundColor ?? Colors.white,
      iconSelectedForegroundColor: selectedColor ?? materialTheme.primaryColor,
      iconUnselectedForegroundColor: unselectedColor ?? Colors.grey,
      iconBackgroundColor: backgroundColor ?? Colors.white,
    );

    return UIProFluidNavBar(
      icons: fluidIcons,
      onChange: onChanged,
      style: style,
      animationFactor: animationFactor,
      scaleFactor: scaleFactor,
      defaultIndex: currentIndex,
    );
  }
}
