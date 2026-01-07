import 'package:flutter/material.dart';
import '../../core/theme/ui_theme.dart';
import '../../core/theme/ui_theme_data.dart';
import '../../shimmer/ui_shimmer.dart';

/// A theme-aware list view with built-in shimmer loading state.
///
/// [UIProListView] automatically shows shimmer placeholders while loading
/// and transitions to actual content when data is ready.
/// NO circular progress indicators - only shimmer skeletons.
///
/// Example:
/// ```dart
/// UIProListView(
///   isLoading: isLoading,
///   itemCount: items.length,
///   itemBuilder: (context, index) => ListTile(
///     title: Text(items[index].title),
///   ),
/// )
/// ```
///
/// With custom shimmer:
/// ```dart
/// UIProListView(
///   isLoading: isLoading,
///   itemCount: items.length,
///   shimmerItemBuilder: (context, index) => MyCustomShimmer(),
///   itemBuilder: (context, index) => MyListItem(items[index]),
/// )
/// ```
class UIProListView extends StatelessWidget {
  /// Whether the list is in loading state.
  final bool isLoading;

  /// Number of items in the list.
  final int itemCount;

  /// Builder for list items.
  final Widget Function(BuildContext context, int index) itemBuilder;

  /// Number of shimmer items to show when loading.
  final int shimmerItemCount;

  /// Custom shimmer item builder.
  final Widget Function(BuildContext context, int index)? shimmerItemBuilder;

  /// Separator builder between items.
  final Widget Function(BuildContext context, int index)? separatorBuilder;

  /// Padding around the list.
  final EdgeInsets? padding;

  /// Whether the list scrolls.
  final bool shrinkWrap;

  /// Scroll physics.
  final ScrollPhysics? physics;

  /// Scroll controller.
  final ScrollController? controller;

  /// Scroll direction.
  final Axis scrollDirection;

  /// Whether to add automatic keep-alives.
  final bool addAutomaticKeepAlives;

  /// Whether to add repaint boundaries.
  final bool addRepaintBoundaries;

  /// Empty state widget shown when itemCount is 0 and not loading.
  final Widget? emptyWidget;

  /// Default shimmer type for auto-generated shimmers.
  final UIProListShimmerType shimmerType;

  /// Whether to show shimmer avatar.
  final bool shimmerShowAvatar;

  /// Whether to show shimmer subtitle.
  final bool shimmerShowSubtitle;

  /// Whether to show shimmer trailing.
  final bool shimmerShowTrailing;

  /// Whether to use auto-shimmer mode.
  ///
  /// When true, the [itemBuilder] is used for both loading and loaded states.
  /// Wrap your item content with [UIProShimmerWrap] widgets to define what
  /// shows as shimmer vs content.
  ///
  /// Example:
  /// ```dart
  /// UIProListView(
  ///   isLoading: isLoading,
  ///   itemCount: items.length,
  ///   useAutoShimmer: true,
  ///   itemBuilder: (context, index) => ListTile(
  ///     leading: UIProShimmerWrap.circle(
  ///       size: 48,
  ///       child: CircleAvatar(child: Text(items[index].initials)),
  ///     ),
  ///     title: UIProShimmerWrap.text(
  ///       child: Text(items[index].name),
  ///     ),
  ///   ),
  /// )
  /// ```
  final bool useAutoShimmer;

  /// Creates a list view with shimmer loading state.
  const UIProListView({
    super.key,
    required this.isLoading,
    required this.itemCount,
    required this.itemBuilder,
    this.shimmerItemCount = 5,
    this.shimmerItemBuilder,
    this.separatorBuilder,
    this.padding,
    this.shrinkWrap = false,
    this.physics,
    this.controller,
    this.scrollDirection = Axis.vertical,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.emptyWidget,
    this.shimmerType = UIProListShimmerType.listItem,
    this.shimmerShowAvatar = true,
    this.shimmerShowSubtitle = true,
    this.shimmerShowTrailing = false,
    this.useAutoShimmer = false,
  });

  /// Creates a list view with separated items.
  const UIProListView.separated({
    super.key,
    required this.isLoading,
    required this.itemCount,
    required this.itemBuilder,
    required this.separatorBuilder,
    this.shimmerItemCount = 5,
    this.shimmerItemBuilder,
    this.padding,
    this.shrinkWrap = false,
    this.physics,
    this.controller,
    this.scrollDirection = Axis.vertical,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.emptyWidget,
    this.shimmerType = UIProListShimmerType.listItem,
    this.shimmerShowAvatar = true,
    this.shimmerShowSubtitle = true,
    this.shimmerShowTrailing = false,
    this.useAutoShimmer = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIProTheme.of(context);
    final effectivePadding = padding ?? EdgeInsets.all(theme.spacingMD);

    // Auto-shimmer mode: use same itemBuilder wrapped with shimmer scope
    if (useAutoShimmer) {
      return _buildAutoShimmerList(context, theme, effectivePadding);
    }

    // Show shimmer while loading (traditional mode)
    if (isLoading) {
      return _buildShimmerList(context, theme, effectivePadding);
    }

    // Show empty state if no items
    if (itemCount == 0 && emptyWidget != null) {
      return emptyWidget!;
    }

    // Show actual list
    if (separatorBuilder != null) {
      return ListView.separated(
        controller: controller,
        padding: effectivePadding,
        shrinkWrap: shrinkWrap,
        physics: physics,
        scrollDirection: scrollDirection,
        itemCount: itemCount,
        separatorBuilder: separatorBuilder!,
        itemBuilder: itemBuilder,
        addAutomaticKeepAlives: addAutomaticKeepAlives,
        addRepaintBoundaries: addRepaintBoundaries,
      );
    }

    return ListView.builder(
      controller: controller,
      padding: effectivePadding,
      shrinkWrap: shrinkWrap,
      physics: physics,
      scrollDirection: scrollDirection,
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      addAutomaticKeepAlives: addAutomaticKeepAlives,
      addRepaintBoundaries: addRepaintBoundaries,
    );
  }

  /// Builds list with auto-shimmer using the same itemBuilder.
  Widget _buildAutoShimmerList(
    BuildContext context,
    UIProThemeData theme,
    EdgeInsets padding,
  ) {
    // Determine item count based on loading state
    final effectiveItemCount = isLoading ? shimmerItemCount : itemCount;

    // Show empty state if no items and not loading
    if (!isLoading && itemCount == 0 && emptyWidget != null) {
      return emptyWidget!;
    }

    // Wrap itemBuilder with shimmer scope
    Widget autoShimmerItemBuilder(BuildContext context, int index) {
      return UIProShimmerScope(
        isLoading: isLoading,
        child: itemBuilder(context, isLoading ? 0 : index),
      );
    }

    if (separatorBuilder != null) {
      return ListView.separated(
        controller: isLoading ? null : controller,
        padding: padding,
        shrinkWrap: shrinkWrap,
        physics: isLoading
            ? (physics ?? const NeverScrollableScrollPhysics())
            : physics,
        scrollDirection: scrollDirection,
        itemCount: effectiveItemCount,
        separatorBuilder: separatorBuilder!,
        itemBuilder: autoShimmerItemBuilder,
        addAutomaticKeepAlives: addAutomaticKeepAlives,
        addRepaintBoundaries: addRepaintBoundaries,
      );
    }

    return ListView.builder(
      controller: isLoading ? null : controller,
      padding: padding,
      shrinkWrap: shrinkWrap,
      physics: isLoading
          ? (physics ?? const NeverScrollableScrollPhysics())
          : physics,
      scrollDirection: scrollDirection,
      itemCount: effectiveItemCount,
      itemBuilder: autoShimmerItemBuilder,
      addAutomaticKeepAlives: addAutomaticKeepAlives,
      addRepaintBoundaries: addRepaintBoundaries,
    );
  }

  Widget _buildShimmerList(
    BuildContext context,
    UIProThemeData theme,
    EdgeInsets padding,
  ) {
    final shimmerBuilder = shimmerItemBuilder ?? _defaultShimmerBuilder;

    if (separatorBuilder != null) {
      return ListView.separated(
        padding: padding,
        shrinkWrap: shrinkWrap,
        physics: physics ?? const NeverScrollableScrollPhysics(),
        scrollDirection: scrollDirection,
        itemCount: shimmerItemCount,
        separatorBuilder: separatorBuilder!,
        itemBuilder: shimmerBuilder,
      );
    }

    return ListView.builder(
      padding: padding,
      shrinkWrap: shrinkWrap,
      physics: physics ?? const NeverScrollableScrollPhysics(),
      scrollDirection: scrollDirection,
      itemCount: shimmerItemCount,
      itemBuilder: shimmerBuilder,
    );
  }

  Widget _defaultShimmerBuilder(BuildContext context, int index) {
    final theme = UIProTheme.of(context);

    switch (shimmerType) {
      case UIProListShimmerType.listItem:
        return _buildListItemShimmer(context, theme);
      case UIProListShimmerType.card:
        return _buildCardShimmer(context, theme);
      case UIProListShimmerType.simple:
        return _buildSimpleShimmer(context, theme);
    }
  }

  Widget _buildListItemShimmer(BuildContext context, UIProThemeData theme) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: theme.spacingSM),
      child: Row(
        children: [
          if (shimmerShowAvatar) ...[
            const UIProShimmer.circle(size: 48),
            SizedBox(width: theme.spacingMD),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIProShimmer.text(height: theme.fontSizeBase),
                if (shimmerShowSubtitle) ...[
                  SizedBox(height: theme.spacingXS),
                  UIProShimmer.text(width: 150, height: theme.fontSizeSmall),
                ],
              ],
            ),
          ),
          if (shimmerShowTrailing) ...[
            SizedBox(width: theme.spacingMD),
            UIProShimmer.box(width: 60, height: 24),
          ],
        ],
      ),
    );
  }

  Widget _buildCardShimmer(BuildContext context, UIProThemeData theme) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: theme.spacingSM),
      decoration: BoxDecoration(
        color: theme.surfaceColor,
        borderRadius: theme.defaultBorderRadius,
        border: Border.all(color: theme.dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UIProShimmer.box(
            width: double.infinity,
            height: 120,
            borderRadius: theme.borderRadius,
          ),
          Padding(
            padding: EdgeInsets.all(theme.spacingMD),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIProShimmer.text(height: theme.fontSizeLarge),
                SizedBox(height: theme.spacingSM),
                UIProShimmer.text(),
                SizedBox(height: theme.spacingXS),
                UIProShimmer.text(width: 200),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSimpleShimmer(BuildContext context, UIProThemeData theme) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: theme.spacingSM),
      child: UIProShimmer.text(height: theme.fontSizeBase),
    );
  }
}

/// Types of shimmer placeholders for lists.
enum UIProListShimmerType {
  /// List item with avatar, title, and subtitle.
  listItem,

  /// Card-style placeholder with image area.
  card,

  /// Simple text line placeholder.
  simple,
}

/// A theme-aware grid view with shimmer loading state.
class UIProGridView extends StatelessWidget {
  /// Whether the grid is in loading state.
  final bool isLoading;

  /// Number of items in the grid.
  final int itemCount;

  /// Builder for grid items.
  final Widget Function(BuildContext context, int index) itemBuilder;

  /// Number of columns.
  final int crossAxisCount;

  /// Main axis spacing.
  final double? mainAxisSpacing;

  /// Cross axis spacing.
  final double? crossAxisSpacing;

  /// Aspect ratio of each item.
  final double childAspectRatio;

  /// Number of shimmer items to show when loading.
  final int shimmerItemCount;

  /// Custom shimmer item builder.
  final Widget Function(BuildContext context, int index)? shimmerItemBuilder;

  /// Padding around the grid.
  final EdgeInsets? padding;

  /// Whether the grid shrinks to fit content.
  final bool shrinkWrap;

  /// Scroll physics.
  final ScrollPhysics? physics;

  /// Scroll controller.
  final ScrollController? controller;

  /// Empty state widget.
  final Widget? emptyWidget;

  /// Creates a grid view with shimmer loading state.
  const UIProGridView({
    super.key,
    required this.isLoading,
    required this.itemCount,
    required this.itemBuilder,
    this.crossAxisCount = 2,
    this.mainAxisSpacing,
    this.crossAxisSpacing,
    this.childAspectRatio = 1.0,
    this.shimmerItemCount = 6,
    this.shimmerItemBuilder,
    this.padding,
    this.shrinkWrap = false,
    this.physics,
    this.controller,
    this.emptyWidget,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIProTheme.of(context);
    final effectivePadding = padding ?? EdgeInsets.all(theme.spacingMD);
    final effectiveMainAxisSpacing = mainAxisSpacing ?? theme.spacingSM;
    final effectiveCrossAxisSpacing = crossAxisSpacing ?? theme.spacingSM;

    // Show shimmer while loading
    if (isLoading) {
      return GridView.builder(
        controller: controller,
        padding: effectivePadding,
        shrinkWrap: shrinkWrap,
        physics: physics ?? const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: effectiveMainAxisSpacing,
          crossAxisSpacing: effectiveCrossAxisSpacing,
          childAspectRatio: childAspectRatio,
        ),
        itemCount: shimmerItemCount,
        itemBuilder: shimmerItemBuilder ?? _defaultShimmerBuilder,
      );
    }

    // Show empty state if no items
    if (itemCount == 0 && emptyWidget != null) {
      return emptyWidget!;
    }

    // Show actual grid
    return GridView.builder(
      controller: controller,
      padding: effectivePadding,
      shrinkWrap: shrinkWrap,
      physics: physics,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: effectiveMainAxisSpacing,
        crossAxisSpacing: effectiveCrossAxisSpacing,
        childAspectRatio: childAspectRatio,
      ),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }

  Widget _defaultShimmerBuilder(BuildContext context, int index) {
    final theme = UIProTheme.of(context);
    return UIProShimmer.box(
      width: double.infinity,
      height: double.infinity,
      borderRadius: theme.borderRadius,
    );
  }
}

/// A simple empty state widget.
class UIProEmptyState extends StatelessWidget {
  /// Icon to display.
  final IconData? icon;

  /// Title text.
  final String? title;

  /// Description text.
  final String? description;

  /// Action button text.
  final String? actionText;

  /// Action callback.
  final VoidCallback? onAction;

  /// Custom image widget.
  final Widget? image;

  /// Creates an empty state widget.
  const UIProEmptyState({
    super.key,
    this.icon,
    this.title,
    this.description,
    this.actionText,
    this.onAction,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIProTheme.of(context);

    return Center(
      child: Padding(
        padding: EdgeInsets.all(theme.spacingXL),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (image != null)
              image!
            else if (icon != null)
              Icon(icon, size: 64, color: theme.textSecondaryColor),
            if (title != null) ...[
              SizedBox(height: theme.spacingMD),
              Text(
                title!,
                style: theme.textStyle(
                  fontSize: theme.fontSizeLarge,
                  fontWeight: theme.fontWeightMedium,
                ),
                textAlign: TextAlign.center,
              ),
            ],
            if (description != null) ...[
              SizedBox(height: theme.spacingSM),
              Text(
                description!,
                style: theme.textStyle(color: theme.textSecondaryColor),
                textAlign: TextAlign.center,
              ),
            ],
            if (actionText != null && onAction != null) ...[
              SizedBox(height: theme.spacingLG),
              TextButton(
                onPressed: onAction,
                child: Text(
                  actionText!,
                  style: theme.textStyle(
                    color: theme.primaryColor,
                    fontWeight: theme.fontWeightMedium,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
