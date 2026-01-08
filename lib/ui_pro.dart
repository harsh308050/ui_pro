/// UI Pro - A collection of customizable Flutter UI widgets.
///
/// A comprehensive UI kit that provides production-ready widgets
/// that work seamlessly with Flutter's Material Design theming.
///
/// ## Getting Started
///
/// Import and use the widgets in your app:
///
/// ```dart
/// import 'package:ui_pro/ui_pro.dart';
/// import 'package:flutter/material.dart';
///
/// // Use any widget from the package
/// UIProButton(
///   text: "Click Me",
///   onPressed: () {},
/// )
/// ```
///
/// ## Features
///
/// - **Smart Widgets**: Loading buttons, text fields with validation, lists with shimmer
/// - **Loading Animations**: Various loading indicator styles
/// - **Navigation**: App bars and bottom navigation
/// - **Shimmer**: Loading shimmer effects
///
/// ## Design Principles
///
/// - Works with Material Theme out of the box
/// - No forced state management
/// - No forced navigation (callbacks only)
/// - Highly customizable with overrides
/// - Lightweight and modular
library ui_pro;

// ─────────────────────────────────────────────────────────────────────
// SHIMMER - Loading Placeholders
// ─────────────────────────────────────────────────────────────────────

export 'shimmer/ui_shimmer.dart';
// ─────────────────────────────────────────────────────────────────────
// Loading Animations - Loading Indicators
// ─────────────────────────────────────────────────────────────────────

export 'widgets/loadingAnimation/ui_loader.dart';

// ─────────────────────────────────────────────────────────────────────
// WIDGETS - Smart UI Components
// ─────────────────────────────────────────────────────────────────────

// Buttons
export 'widgets/buttons/ui_button.dart';

// Text Fields
export 'widgets/textfields/ui_text_field.dart';

// Lists
export 'widgets/lists/ui_list_view.dart';

// App Bar
export 'widgets/appbar/ui_app_bar.dart';

// Navigation
export 'widgets/bottomnavbar/ui_normal_bottombar.dart';

// Double Tap Exit
export 'widgets/doubletapexit/ui_doubletap_exit.dart';

// Swipeable Tile
export 'widgets/swipableTile/ui_swipableTile.dart';
export 'widgets/swipableTile/enums.dart';
