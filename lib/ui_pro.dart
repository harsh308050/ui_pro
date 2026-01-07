/// UI Pro - A modular, theme-driven Flutter UI system.
///
/// A comprehensive UI kit that provides ready-made, production-ready
/// common UI widgets where a single global theme configuration
/// controls the entire UI appearance.
///
/// ## Getting Started
///
/// Wrap your app with [UIProTheme] to provide theme data:
///
/// ```dart
/// import 'package:ui_pro/ui_pro.dart';
///
/// void main() {
///   runApp(
///     UIProTheme(
///       data: UIProThemeData(
///         primaryColor: Colors.blue,
///         secondaryColor: Colors.purple,
///         borderRadius: 12,
///         fontFamily: "Poppins",
///       ),
///       child: MyApp(),
///     ),
///   );
/// }
/// ```
///
/// ## Features
///
/// - **Theme System**: Single source of truth for all UI properties
/// - **Smart Widgets**: Loading buttons, text fields with validation, lists with shimmer
/// - **Navigation**: Theme-aware app bars and bottom navigation
/// - **Shimmer**: Global shimmer system for loading states
///
/// ## Design Principles
///
/// - No forced state management
/// - No forced navigation (callbacks only)
/// - Highly customizable with overrides
/// - Theme-first approach
/// - Lightweight and modular
library ui_pro;

// ─────────────────────────────────────────────────────────────────────
// CORE - Theme & Configuration
// ─────────────────────────────────────────────────────────────────────

export 'core/theme/ui_theme.dart';
export 'core/theme/ui_theme_data.dart';
export 'core/config/ui_config.dart';
export 'core/utils/shimmer_utils.dart';

// ─────────────────────────────────────────────────────────────────────
// SHIMMER - Loading Placeholders
// ─────────────────────────────────────────────────────────────────────

export 'shimmer/ui_shimmer.dart';

// ─────────────────────────────────────────────────────────────────────
// WIDGETS - Smart UI Components
// ─────────────────────────────────────────────────────────────────────

// Buttons
export 'widgets/buttons/ui_loading_button.dart';

// Text Fields
export 'widgets/textfields/ui_text_field.dart';

// Lists
export 'widgets/lists/ui_list_view.dart';

// App Bar
export 'widgets/appbar/ui_app_bar.dart';

// Navigation
export 'widgets/navigation/ui_bottom_nav.dart';
