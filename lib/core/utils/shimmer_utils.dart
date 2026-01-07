import 'package:flutter/material.dart';
import '../theme/ui_theme.dart';

/// Utility class for shimmer-related calculations and builders.
class ShimmerUtils {
  ShimmerUtils._();

  /// Creates a shimmer gradient for animation.
  static LinearGradient createShimmerGradient({
    required Color baseColor,
    required Color highlightColor,
    required double animationValue,
  }) {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [baseColor, highlightColor, baseColor],
      stops: [
        (animationValue - 0.3).clamp(0.0, 1.0),
        animationValue,
        (animationValue + 0.3).clamp(0.0, 1.0),
      ],
    );
  }

  /// Creates a shimmer box decoration.
  static BoxDecoration createShimmerDecoration({
    required Color baseColor,
    required double borderRadius,
  }) {
    return BoxDecoration(
      color: baseColor,
      borderRadius: BorderRadius.circular(borderRadius),
    );
  }

  /// Builds a simple rectangular shimmer placeholder.
  static Widget rectanglePlaceholder({
    required BuildContext context,
    double? width,
    double? height,
    double? borderRadius,
  }) {
    final theme = UIProTheme.of(context);
    return Container(
      width: width,
      height: height ?? theme.spacingMD,
      decoration: BoxDecoration(
        color: theme.shimmerBaseColor,
        borderRadius: BorderRadius.circular(
          borderRadius ?? theme.effectiveShimmerBorderRadius,
        ),
      ),
    );
  }

  /// Builds a circular shimmer placeholder (for avatars).
  static Widget circlePlaceholder({
    required BuildContext context,
    double? size,
  }) {
    final theme = UIProTheme.of(context);
    final effectiveSize = size ?? 40;
    return Container(
      width: effectiveSize,
      height: effectiveSize,
      decoration: BoxDecoration(
        color: theme.shimmerBaseColor,
        shape: BoxShape.circle,
      ),
    );
  }

  /// Builds a text-like shimmer placeholder.
  static Widget textPlaceholder({
    required BuildContext context,
    double? width,
    double? height,
  }) {
    final theme = UIProTheme.of(context);
    return Container(
      width: width ?? double.infinity,
      height: height ?? theme.fontSizeBase,
      decoration: BoxDecoration(
        color: theme.shimmerBaseColor,
        borderRadius: BorderRadius.circular(theme.borderRadiusSmall / 2),
      ),
    );
  }

  /// Builds a list item shimmer placeholder.
  static Widget listItemPlaceholder({
    required BuildContext context,
    bool showAvatar = true,
    bool showSubtitle = true,
    bool showTrailing = false,
  }) {
    final theme = UIProTheme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: theme.spacingMD,
        vertical: theme.spacingSM,
      ),
      child: Row(
        children: [
          if (showAvatar) ...[
            circlePlaceholder(context: context, size: 48),
            SizedBox(width: theme.spacingMD),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textPlaceholder(
                  context: context,
                  width: double.infinity,
                  height: theme.fontSizeBase,
                ),
                if (showSubtitle) ...[
                  SizedBox(height: theme.spacingXS),
                  textPlaceholder(
                    context: context,
                    width: 150,
                    height: theme.fontSizeSmall,
                  ),
                ],
              ],
            ),
          ),
          if (showTrailing) ...[
            SizedBox(width: theme.spacingMD),
            rectanglePlaceholder(context: context, width: 60, height: 24),
          ],
        ],
      ),
    );
  }

  /// Builds a card shimmer placeholder.
  static Widget cardPlaceholder({
    required BuildContext context,
    double? height,
    bool showImage = true,
    bool showTitle = true,
    bool showDescription = true,
  }) {
    final theme = UIProTheme.of(context);
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: theme.surfaceColor,
        borderRadius: theme.defaultBorderRadius,
        border: Border.all(color: theme.dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showImage)
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: theme.shimmerBaseColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(theme.borderRadius),
                ),
              ),
            ),
          Padding(
            padding: EdgeInsets.all(theme.spacingMD),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (showTitle) ...[
                  textPlaceholder(
                    context: context,
                    width: double.infinity,
                    height: theme.fontSizeLarge,
                  ),
                  SizedBox(height: theme.spacingSM),
                ],
                if (showDescription) ...[
                  textPlaceholder(context: context),
                  SizedBox(height: theme.spacingXS),
                  textPlaceholder(context: context, width: 200),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Builds a grid item shimmer placeholder.
  static Widget gridItemPlaceholder({
    required BuildContext context,
    double? aspectRatio,
  }) {
    final theme = UIProTheme.of(context);
    return AspectRatio(
      aspectRatio: aspectRatio ?? 1,
      child: Container(
        decoration: BoxDecoration(
          color: theme.shimmerBaseColor,
          borderRadius: theme.defaultBorderRadius,
        ),
      ),
    );
  }
}
