import 'package:flutter/material.dart';
import 'package:ui_pro/ui_pro.dart';

/// Demonstrates UI Pro widgets: buttons, text fields, icon buttons, empty state
class WidgetsDemo extends StatefulWidget {
  const WidgetsDemo({super.key});

  @override
  State<WidgetsDemo> createState() => _WidgetsDemoState();
}

class _WidgetsDemoState extends State<WidgetsDemo> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiProTheme;

    return SingleChildScrollView(
      padding: EdgeInsets.all(theme.spacingMD),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section: Buttons
          _buildSectionTitle("Buttons"),
          SizedBox(height: theme.spacingSM),
          UIProLoadingButton(
            text: "Primary Button",
            isLoading: _isLoading,
            onPressed: () async {
              setState(() => _isLoading = true);
              await Future.delayed(const Duration(seconds: 2));
              if (mounted) setState(() => _isLoading = false);
            },
          ),
          SizedBox(height: theme.spacingSM),
          UIProLoadingButton.outlined(
            text: "Outlined Button",
            onPressed: () {},
          ),
          SizedBox(height: theme.spacingSM),
          UIProLoadingButton.text(text: "Text Button", onPressed: () {}),
          SizedBox(height: theme.spacingSM),
          Row(
            children: [
              Expanded(
                child: UIProLoadingButton(
                  text: "With Icon",
                  leading: const Icon(
                    Icons.send,
                    size: 18,
                    color: Colors.white,
                  ),

                  onPressed: () {},
                ),
              ),
              SizedBox(width: theme.spacingSM),
              Expanded(
                child: UIProLoadingButton(text: "Disabled", onPressed: null),
              ),
            ],
          ),
          SizedBox(height: theme.spacingLG),

          // Section: Text Fields with Validation
          _buildSectionTitle("Text Fields with Validation"),
          SizedBox(height: theme.spacingSM),

          // Email field with built-in validation
          UIProTextField.email(
            controller: _emailController,
            validateNotEmpty: true,
            helperText: "Enter a valid email address",
          ),
          SizedBox(height: theme.spacingSM),

          // Password field with show/hide toggle and validation
          UIProTextField.password(
            controller: _passwordController,
            validateNotEmpty: true,
            minPasswordLength: 8,
            shortPasswordMessage: "Password must be at least 8 characters",
            helperText: "Minimum 8 characters",
          ),
          SizedBox(height: theme.spacingSM),

          // Regular text field with not-empty validation
          const UIProTextField(
            hint: "Username",
            label: "Username",
            prefixIcon: Icons.person_outline,
            validateNotEmpty: true,
            emptyErrorMessage: "Username is required",
          ),
          SizedBox(height: theme.spacingSM),

          // Text field with manual error
          const UIProTextField(
            hint: "With manual error",
            errorText: "This is a manual error message",
          ),
          SizedBox(height: theme.spacingLG),

          // Section: Icon Buttons
          _buildSectionTitle("Icon Buttons"),
          SizedBox(height: theme.spacingSM),
          Row(
            children: [
              UIProIconButton(
                icon: Icons.favorite,
                color: theme.errorColor,
                onPressed: () {},
              ),
              UIProIconButton(icon: Icons.share, onPressed: () {}),
              UIProIconButton(icon: Icons.bookmark_outline, onPressed: () {}),
              UIProIconButton(icon: Icons.more_vert, onPressed: () {}),
            ],
          ),
          SizedBox(height: theme.spacingLG),

          // Section: Empty State
          _buildSectionTitle("Empty State"),
          SizedBox(height: theme.spacingSM),
          UIProEmptyState(
            icon: Icons.inbox_outlined,
            title: "No messages",
            description: "You don't have any messages yet.",
            actionText: "Refresh",
            onAction: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Refresh"),
                  content: const Text("Refresh action triggered."),
                  actions: [
                    UIProLoadingButton.text(
                      text: "OK",
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    final theme = context.uiProTheme;
    return Text(
      title,
      style: theme.textStyle(
        fontSize: theme.fontSizeLarge,
        fontWeight: theme.fontWeightBold,
      ),
    );
  }
}
