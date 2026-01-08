import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Exit UI types
enum ExitStyle {
  snackBar,
  dialog,
}

/// Fully customizable Snackbar config
class ExitSnackBarConfig {
  final Widget content;
  final SnackBarBehavior behavior;
  final Color? backgroundColor;
  final ShapeBorder? shape;
  final EdgeInsetsGeometry? margin;
  final double? elevation;
  final Duration duration;

  const ExitSnackBarConfig({
    this.content = const Text('Tap again to exit'),
    this.behavior = SnackBarBehavior.floating,
    this.backgroundColor,
    this.shape,
    this.margin,
    this.elevation,
    this.duration = const Duration(seconds: 2),
  });
}

/// Fully customizable Dialog config
class ExitDialogConfig {
  final Widget? title;
  final Widget? content;

  /// Custom action widgets (TextButton, ElevatedButton, anything)
  final Widget cancelButton;
  final Widget confirmButton;

  /// Control behavior
  final bool barrierDismissible;
  final ShapeBorder? shape;
  final EdgeInsetsGeometry? contentPadding;

  /// Confirm callback
  final VoidCallback onConfirm;

  const ExitDialogConfig({
    this.title,
    this.content,
    required this.cancelButton,
    required this.confirmButton,
    required this.onConfirm,
    this.barrierDismissible = true,
    this.shape,
    this.contentPadding,
  });
}

/// Main Widget
class UIProDoubleTapExit extends StatefulWidget {
  const UIProDoubleTapExit({
    super.key,
    required this.child,
    this.exitStyle = ExitStyle.snackBar,
    this.snackBarConfig,
    this.dialogConfig,
    this.interval = const Duration(seconds: 2),
  });

  final Widget child;
  final ExitStyle exitStyle;

  final ExitSnackBarConfig? snackBarConfig;
  final ExitDialogConfig? dialogConfig;

  final Duration interval;

  @override
  State<UIProDoubleTapExit> createState() => _UIProDoubleTapExitState();
}

class _UIProDoubleTapExitState extends State<UIProDoubleTapExit> {
  DateTime? _lastBackPressTime;

  Future<void> _handleExitUI() async {
    switch (widget.exitStyle) {
      case ExitStyle.snackBar:
        _showSnackBar();
        break;
      case ExitStyle.dialog:
        await _showDialog();
        break;
    }
  }

  void _showSnackBar() {
    final config = widget.snackBarConfig ?? const ExitSnackBarConfig();

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: config.content,
        behavior: config.behavior,
        backgroundColor: config.backgroundColor,
        shape: config.shape,
        margin: config.margin,
        elevation: config.elevation,
        duration: config.duration,
      ),
    );
  }

  Future<void> _showDialog() async {
    final config = widget.dialogConfig;

    if (config == null) return;

    await showDialog(
      context: context,
      barrierDismissible: config.barrierDismissible,
      builder: (context) => AlertDialog(
        title: config.title,
        content: config.content,
        shape: config.shape,
        contentPadding: config.contentPadding,
        actions: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: config.cancelButton,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
              config.onConfirm();
            },
            child: config.confirmButton,
          ),
        ],
      ),
    );
  }

  Future<bool> _onBackPressed() async {
    final now = DateTime.now();

    if (_lastBackPressTime == null ||
        now.difference(_lastBackPressTime!) > widget.interval) {
      _lastBackPressTime = now;
      await _handleExitUI();
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) async {
        if (!didPop) {
          final shouldExit = await _onBackPressed();
          if (shouldExit) {
            SystemNavigator.pop();
          }
        }
      },
      child: widget.child,
    );
  }
}
