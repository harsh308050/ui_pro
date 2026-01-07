import 'package:flutter/material.dart';
import 'package:ui_pro/ui_pro.dart';

import 'pages/widgets_demo.dart';
import 'pages/shimmer_demo.dart';
import 'pages/full_flow_demo.dart';

/// Main home screen with bottom navigation
class DemoHome extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onThemeToggle;

  const DemoHome({
    super.key,
    required this.isDarkMode,
    required this.onThemeToggle,
  });

  @override
  State<DemoHome> createState() => _DemoHomeState();
}

class _DemoHomeState extends State<DemoHome> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    WidgetsDemo(),
    ShimmerDemo(),
    FullFlowDemo(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = context.uiProTheme;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: UIProAppBar(
        title: "UI Pro Demo",
        actions: [
          UIProAppBarAction(
            icon: widget.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            onPressed: widget.onThemeToggle,
            tooltip: "Toggle Theme",
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: UIProBottomNav(
        items: const [
          UIProBottomNavItem(icon: Icons.widgets, label: "Widgets"),
          UIProBottomNavItem(icon: Icons.gradient, label: "Shimmer"),
          UIProBottomNavItem(icon: Icons.phone_android, label: "Full Demo"),
        ],
        currentIndex: _currentIndex,
        onChanged: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
