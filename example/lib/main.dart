import 'package:flutter/material.dart';
import 'package:ui_pro/ui_pro.dart';

import 'demo_home.dart';

void main() {
  runApp(const MyApp());
}

/// Root application widget with theme management
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Define custom theme data
    final lightTheme = UIProThemeData(
      primaryColor: const Color(0xFF6366F1),
      secondaryColor: const Color(0xFF8B5CF6),
      backgroundColor: Colors.white,
      surfaceColor: const Color(0xFFF8FAFC),
      textColor: const Color(0xFF1E293B),
      textSecondaryColor: const Color(0xFF64748B),
      borderRadius: 12,
      fontFamily: null, // Uses system font
      shimmerBaseColor: const Color(0xFFE2E8F0),
      shimmerHighlightColor: const Color(0xFFF1F5F9),
    );

    final darkTheme = UIProThemeData(
      primaryColor: const Color(0xFF818CF8),
      secondaryColor: const Color(0xFFA78BFA),
      backgroundColor: const Color(0xFF0F172A),
      surfaceColor: const Color(0xFF1E293B),
      textColor: const Color(0xFFF1F5F9),
      textSecondaryColor: const Color(0xFF94A3B8),
      borderRadius: 12,
      shimmerBaseColor: const Color(0xFF334155),
      shimmerHighlightColor: const Color(0xFF475569),
    );

    return UIProTheme(
      data: _isDarkMode ? darkTheme : lightTheme,
      child: MaterialApp(
        title: 'UI Pro Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF6366F1),
            brightness: _isDarkMode ? Brightness.dark : Brightness.light,
          ),
        ),
        home: DemoHome(isDarkMode: _isDarkMode, onThemeToggle: _toggleTheme),
      ),
    );
  }
}
