/// # UI Pro - Comprehensive Flutter UI Component Library
///
/// A production-ready Flutter UI component library that seamlessly integrates
/// with Material Theme. Build beautiful, consistent apps faster with smart
/// widgets, built-in animations, and extensive customization options.
///
/// ## 🎯 Key Features
///
/// ### Smart Widgets
/// - **UIProButton** - Loading states, 3 variants (filled, outlined, text)
/// - **UIProIconButton** - Circular icon buttons with loading states
/// - **UIProTextField** - Built-in validation (email, password, phone)
/// - **UIProListView** - Automatic shimmer loading and empty states
/// - **UIProSwipeableTile** - Swipe-to-delete with customizable actions
/// - **UIProDoubleTapExit** - Exit confirmation (snackbar or dialog)
///
/// ### Navigation Components
/// - **UIProAppBar** - Customizable app bar with actions and badges
/// - **UIProBottomNav** - 3 styles: Standard, Floating, Fluid (wave animation)
///
/// ### Loading & Feedback
/// - **UIProShimmer** - Box, circle, text, list, and grid shimmers
/// - **UIProLoader** - 5 animation styles for loading indicators
///
/// ## 📦 Installation
///
/// ```yaml
/// dependencies:
///   ui_pro: ^1.0.2
/// ```
///
/// ## 🚀 Quick Start
///
/// ```dart
/// import 'package:flutter/material.dart';
/// import 'package:ui_pro/ui_pro.dart';
///
/// // Button with loading state
/// UIProButton(
///   text: "Login",
///   isLoading: isLoading,
///   onPressed: () => handleLogin(),
/// )
///
/// // Email field with validation
/// UIProTextField.email(
///   controller: emailController,
///   validateNotEmpty: true,
/// )
///
/// // List with shimmer loading
/// UIProListView(
///   isLoading: isLoading,
///   itemCount: items.length,
///   itemBuilder: (context, index) => YourListItem(items[index]),
/// )
///
/// // Bottom navigation with wave animation
/// UIProBottomNav.fluid(
///   items: [
///     UIProBottomNavItem(icon: Icons.home, label: "Home"),
///     UIProBottomNavItem(icon: Icons.search, label: "Search"),
///   ],
///   currentIndex: selectedIndex,
///   onChanged: (index) => setState(() => selectedIndex = index),
/// )
/// ```
///
/// ## 🎨 Material Theme Compatible
///
/// All widgets automatically adapt to your app's Material Theme while
/// providing granular customization options for colors, sizes, and styles.
///
/// ```dart
/// MaterialApp(
///   theme: ThemeData(
///     primaryColor: Colors.blue,
///     // Widgets automatically use your theme
///   ),
///   home: HomePage(),
/// )
/// ```
///
/// ## 🔌 State Management Agnostic
///
/// Works seamlessly with any state management solution:
/// - setState, Provider, Riverpod, BLoC, GetX, MobX, Redux
///
/// ## 📚 Documentation
///
/// Visit the [GitHub repository](https://github.com/harsh308050/ui_pro)
/// for comprehensive documentation, examples, and API reference.
///
/// ## 📄 License
///
/// MIT License - see LICENSE file for details.
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
export 'widgets/swipableTile/ui_swipeable_tile.dart';
export 'widgets/swipableTile/enums.dart';
