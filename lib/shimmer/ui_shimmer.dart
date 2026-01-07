import 'package:flutter/material.dart';
import '../core/theme/ui_theme.dart';

/// A customizable shimmer loading effect widget.
///
/// Use [UIProShimmer] to show a loading placeholder with an animated
/// shimmer gradient effect. The shimmer automatically uses theme colors.
///
/// Example:
/// ```dart
/// UIProShimmer(
///   child: Container(
///     width: 200,
///     height: 20,
///     color: Colors.white,
///   ),
/// )
/// ```
///
/// For a simple box shimmer:
/// ```dart
/// UIProShimmer.box(
///   width: 200,
///   height: 20,
/// )
/// ```
class UIProShimmer extends StatefulWidget {
  /// The child widget to apply shimmer effect to.
  /// If null, uses [width] and [height] to create a box.
  final Widget? child;

  /// Width of the shimmer box (when child is null).
  final double? width;

  /// Height of the shimmer box (when child is null).
  final double? height;

  /// Border radius for the shimmer effect.
  final double? borderRadius;

  /// Base color for shimmer (darker shade).
  /// Defaults to theme's shimmerBaseColor.
  final Color? baseColor;

  /// Highlight color for shimmer (lighter shade).
  /// Defaults to theme's shimmerHighlightColor.
  final Color? highlightColor;

  /// Duration of one shimmer animation cycle.
  /// Defaults to theme's shimmerDuration.
  final Duration? duration;

  /// Whether the shimmer animation is enabled.
  final bool enabled;

  /// The shape of the shimmer.
  final UIProShimmerShape shape;

  /// Direction of the shimmer animation.
  final UIProShimmerDirection direction;

  /// Creates a shimmer effect widget.
  const UIProShimmer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.borderRadius,
    this.baseColor,
    this.highlightColor,
    this.duration,
    this.enabled = true,
    this.shape = UIProShimmerShape.rectangle,
    this.direction = UIProShimmerDirection.leftToRight,
  });

  /// Creates a simple box shimmer placeholder.
  const UIProShimmer.box({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius,
    this.baseColor,
    this.highlightColor,
    this.duration,
    this.enabled = true,
    this.direction = UIProShimmerDirection.leftToRight,
  }) : child = null,
       shape = UIProShimmerShape.rectangle;

  /// Creates a circular shimmer placeholder.
  const UIProShimmer.circle({
    super.key,
    required double size,
    this.baseColor,
    this.highlightColor,
    this.duration,
    this.enabled = true,
    this.direction = UIProShimmerDirection.leftToRight,
  }) : child = null,
       width = size,
       height = size,
       borderRadius = null,
       shape = UIProShimmerShape.circle;

  /// Creates a text-like shimmer placeholder.
  factory UIProShimmer.text({
    Key? key,
    double? width,
    double height = 14,
    double borderRadius = 4,
    Color? baseColor,
    Color? highlightColor,
    Duration? duration,
    bool enabled = true,
  }) {
    return UIProShimmer.box(
      key: key,
      width: width ?? double.infinity,
      height: height,
      borderRadius: borderRadius,
      baseColor: baseColor,
      highlightColor: highlightColor,
      duration: duration,
      enabled: enabled,
    );
  }

  @override
  State<UIProShimmer> createState() => _UIProShimmerState();
}

class _UIProShimmerState extends State<UIProShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _animation = Tween<double>(
      begin: -1,
      end: 2,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateAnimation();
  }

  @override
  void didUpdateWidget(UIProShimmer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.duration != widget.duration ||
        oldWidget.enabled != widget.enabled) {
      _updateAnimation();
    }
  }

  void _updateAnimation() {
    final theme = UIProTheme.of(context);
    final duration = widget.duration ?? theme.shimmerDuration;

    _controller.duration = duration;

    if (widget.enabled) {
      _controller.repeat();
    } else {
      _controller.stop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled) {
      return _buildChild(context);
    }

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return _buildShimmer(context);
      },
    );
  }

  Widget _buildChild(BuildContext context) {
    final theme = UIProTheme.of(context);

    if (widget.child != null) {
      return widget.child!;
    }

    final effectiveBorderRadius =
        widget.borderRadius ?? theme.effectiveShimmerBorderRadius;

    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.baseColor ?? theme.shimmerBaseColor,
        shape: widget.shape == UIProShimmerShape.circle
            ? BoxShape.circle
            : BoxShape.rectangle,
        borderRadius: widget.shape == UIProShimmerShape.circle
            ? null
            : BorderRadius.circular(effectiveBorderRadius),
      ),
    );
  }

  Widget _buildShimmer(BuildContext context) {
    final theme = UIProTheme.of(context);
    final baseColor = widget.baseColor ?? theme.shimmerBaseColor;
    final highlightColor = widget.highlightColor ?? theme.shimmerHighlightColor;
    final effectiveBorderRadius =
        widget.borderRadius ?? theme.effectiveShimmerBorderRadius;

    final gradient = _createGradient(baseColor, highlightColor);

    if (widget.child != null) {
      return ShaderMask(
        blendMode: BlendMode.srcATop,
        shaderCallback: (bounds) => gradient.createShader(bounds),
        child: widget.child,
      );
    }

    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        gradient: gradient,
        shape: widget.shape == UIProShimmerShape.circle
            ? BoxShape.circle
            : BoxShape.rectangle,
        borderRadius: widget.shape == UIProShimmerShape.circle
            ? null
            : BorderRadius.circular(effectiveBorderRadius),
      ),
    );
  }

  LinearGradient _createGradient(Color baseColor, Color highlightColor) {
    final animValue = _animation.value;

    Alignment begin;
    Alignment end;

    switch (widget.direction) {
      case UIProShimmerDirection.leftToRight:
        begin = Alignment.centerLeft;
        end = Alignment.centerRight;
        break;
      case UIProShimmerDirection.rightToLeft:
        begin = Alignment.centerRight;
        end = Alignment.centerLeft;
        break;
      case UIProShimmerDirection.topToBottom:
        begin = Alignment.topCenter;
        end = Alignment.bottomCenter;
        break;
      case UIProShimmerDirection.bottomToTop:
        begin = Alignment.bottomCenter;
        end = Alignment.topCenter;
        break;
    }

    return LinearGradient(
      begin: begin,
      end: end,
      colors: [baseColor, highlightColor, baseColor],
      stops: [
        (animValue - 0.3).clamp(0.0, 1.0),
        animValue.clamp(0.0, 1.0),
        (animValue + 0.3).clamp(0.0, 1.0),
      ],
    );
  }
}

/// Shape options for shimmer placeholders.
enum UIProShimmerShape {
  /// Rectangular shape with optional border radius.
  rectangle,

  /// Circular shape.
  circle,
}

/// Direction of the shimmer animation.
enum UIProShimmerDirection {
  /// Shimmer moves from left to right.
  leftToRight,

  /// Shimmer moves from right to left.
  rightToLeft,

  /// Shimmer moves from top to bottom.
  topToBottom,

  /// Shimmer moves from bottom to top.
  bottomToTop,
}

/// A list of shimmer placeholders.
///
/// Useful for showing loading states in lists.
class UIProShimmerList extends StatelessWidget {
  /// Number of shimmer items to show.
  final int itemCount;

  /// Builder for each shimmer item.
  final Widget Function(BuildContext context, int index)? itemBuilder;

  /// Spacing between items.
  final double? spacing;

  /// Whether to show as a horizontal list.
  final bool horizontal;

  /// Padding around the list.
  final EdgeInsets? padding;

  /// Creates a list of shimmer placeholders.
  const UIProShimmerList({
    super.key,
    this.itemCount = 5,
    this.itemBuilder,
    this.spacing,
    this.horizontal = false,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIProTheme.of(context);
    final effectiveSpacing = spacing ?? theme.spacingSM;
    final effectivePadding = padding ?? EdgeInsets.all(theme.spacingMD);

    if (horizontal) {
      return SizedBox(
        height: 80,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: effectivePadding,
          itemCount: itemCount,
          separatorBuilder: (_, __) => SizedBox(width: effectiveSpacing),
          itemBuilder: (context, index) {
            return itemBuilder?.call(context, index) ??
                _defaultHorizontalItem(context);
          },
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: effectivePadding,
      itemCount: itemCount,
      separatorBuilder: (_, __) => SizedBox(height: effectiveSpacing),
      itemBuilder: (context, index) {
        return itemBuilder?.call(context, index) ?? _defaultListItem(context);
      },
    );
  }

  Widget _defaultListItem(BuildContext context) {
    final theme = UIProTheme.of(context);
    return Row(
      children: [
        const UIProShimmer.circle(size: 48),
        SizedBox(width: theme.spacingMD),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UIProShimmer.text(height: theme.fontSizeBase),
              SizedBox(height: theme.spacingXS),
              UIProShimmer.text(width: 150, height: theme.fontSizeSmall),
            ],
          ),
        ),
      ],
    );
  }

  Widget _defaultHorizontalItem(BuildContext context) {
    return const UIProShimmer.box(width: 120, height: 80);
  }
}

/// A grid of shimmer placeholders.
class UIProShimmerGrid extends StatelessWidget {
  /// Number of shimmer items.
  final int itemCount;

  /// Number of columns in the grid.
  final int crossAxisCount;

  /// Builder for each shimmer item.
  final Widget Function(BuildContext context, int index)? itemBuilder;

  /// Spacing between items.
  final double? spacing;

  /// Aspect ratio of each item.
  final double aspectRatio;

  /// Padding around the grid.
  final EdgeInsets? padding;

  /// Creates a grid of shimmer placeholders.
  const UIProShimmerGrid({
    super.key,
    this.itemCount = 6,
    this.crossAxisCount = 2,
    this.itemBuilder,
    this.spacing,
    this.aspectRatio = 1,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIProTheme.of(context);
    final effectiveSpacing = spacing ?? theme.spacingSM;
    final effectivePadding = padding ?? EdgeInsets.all(theme.spacingMD);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: effectivePadding,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: effectiveSpacing,
        crossAxisSpacing: effectiveSpacing,
        childAspectRatio: aspectRatio,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return itemBuilder?.call(context, index) ??
            UIProShimmer.box(
              width: double.infinity,
              height: double.infinity,
              borderRadius: theme.borderRadius,
            );
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────────────
// AUTO-SHIMMER SYSTEM
// ─────────────────────────────────────────────────────────────────────

/// InheritedWidget that provides shimmer loading state to descendants.
///
/// Wrap your list item with [UIProShimmerScope] to enable auto-shimmer
/// for all [UIProShimmerWrap] widgets inside.
///
/// Example:
/// ```dart
/// UIProShimmerScope(
///   isLoading: isLoading,
///   child: MyListItem(),
/// )
/// ```
class UIProShimmerScope extends InheritedWidget {
  /// Whether shimmer mode is active.
  final bool isLoading;

  /// Creates a shimmer scope.
  const UIProShimmerScope({
    super.key,
    required this.isLoading,
    required super.child,
  });

  /// Gets the shimmer loading state from context.
  /// Returns false if no [UIProShimmerScope] is found.
  static bool of(BuildContext context) {
    final scope = context
        .dependOnInheritedWidgetOfExactType<UIProShimmerScope>();
    return scope?.isLoading ?? false;
  }

  /// Returns true if there's a [UIProShimmerScope] ancestor.
  static bool hasScope(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UIProShimmerScope>() !=
        null;
  }

  @override
  bool updateShouldNotify(UIProShimmerScope oldWidget) {
    return isLoading != oldWidget.isLoading;
  }
}

/// A widget that shows shimmer or content based on [UIProShimmerScope].
///
/// Use this to wrap individual elements in your list item. When inside
/// a [UIProShimmerScope] with `isLoading: true`, it shows shimmer.
/// Otherwise, it shows the child.
///
/// Example:
/// ```dart
/// Row(
///   children: [
///     // Circular shimmer for avatar
///     UIProShimmerWrap.circle(
///       size: 48,
///       child: CircleAvatar(child: Text("JD")),
///     ),
///     // Text shimmer
///     UIProShimmerWrap.text(
///       child: Text("John Doe"),
///     ),
///   ],
/// )
/// ```
class UIProShimmerWrap extends StatelessWidget {
  /// The content to show when not loading.
  final Widget child;

  /// Width of shimmer placeholder.
  final double? width;

  /// Height of shimmer placeholder.
  final double? height;

  /// Border radius for shimmer.
  final double? borderRadius;

  /// Shape of the shimmer.
  final UIProShimmerShape shape;

  /// Creates a shimmer wrap widget.
  const UIProShimmerWrap({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.borderRadius,
    this.shape = UIProShimmerShape.rectangle,
  });

  /// Creates a shimmer wrap for text content.
  ///
  /// Automatically sizes based on text or uses provided dimensions.
  const UIProShimmerWrap.text({
    super.key,
    required this.child,
    this.width,
    double? height,
    this.borderRadius = 4,
  }) : height = height ?? 14,
       shape = UIProShimmerShape.rectangle;

  /// Creates a shimmer wrap for circular content (avatars, icons).
  const UIProShimmerWrap.circle({
    super.key,
    required this.child,
    required double size,
  }) : width = size,
       height = size,
       borderRadius = null,
       shape = UIProShimmerShape.circle;

  /// Creates a shimmer wrap for box content (images, containers).
  const UIProShimmerWrap.box({
    super.key,
    required this.child,
    required this.width,
    required this.height,
    this.borderRadius,
  }) : shape = UIProShimmerShape.rectangle;

  @override
  Widget build(BuildContext context) {
    final isLoading = UIProShimmerScope.of(context);

    if (!isLoading) {
      return child;
    }

    // Show shimmer placeholder based on shape
    if (shape == UIProShimmerShape.circle) {
      return UIProShimmer.circle(size: width ?? height ?? 40);
    }

    // For text and box, use the box shimmer with specified dimensions
    return UIProShimmer.box(
      width: width ?? double.infinity,
      height: height ?? 14,
      borderRadius: borderRadius ?? 4,
    );
  }
}

/// A builder widget that creates shimmer-aware list items.
///
/// Define your list item structure once using [UIProShimmerWrap] widgets,
/// and it automatically shows shimmer when loading.
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
///     subtitle: UIProShimmerWrap.text(
///       width: 150,
///       child: Text(items[index].email),
///     ),
///   ),
/// )
/// ```
class UIProShimmerBuilder extends StatelessWidget {
  /// Whether the content is loading.
  final bool isLoading;

  /// The child widget containing [UIProShimmerWrap] widgets.
  final Widget child;

  /// Creates a shimmer builder.
  const UIProShimmerBuilder({
    super.key,
    required this.isLoading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return UIProShimmerScope(isLoading: isLoading, child: child);
  }
}
