import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/theme/ui_theme.dart';
import '../../core/theme/ui_theme_data.dart';

/// A theme-aware text field with built-in validation, focus animations,
/// and password visibility toggle.
///
/// [UIProTextField] automatically adapts to theme changes and provides
/// a consistent input experience across your app.
///
/// Example:
/// ```dart
/// UIProTextField(
///   hint: "Email",
///   controller: emailController,
///   keyboardType: TextInputType.emailAddress,
///   errorText: emailError,
/// )
/// ```
///
/// Email field with built-in validation:
/// ```dart
/// UIProTextField.email(
///   controller: emailController,
///   validateNotEmpty: true, // Shows error if empty
/// )
/// ```
///
/// Password field with visibility toggle:
/// ```dart
/// UIProTextField.password(
///   hint: "Password",
///   controller: passwordController,
///   validateNotEmpty: true,
/// )
/// ```
class UIProTextField extends StatefulWidget {
  /// Text editing controller.
  final TextEditingController? controller;

  /// Hint text shown when field is empty.
  final String? hint;

  /// Label text shown above the field.
  final String? label;

  /// Error text to display below the field.
  /// If null and validation fails, shows auto-generated error.
  final String? errorText;

  /// Helper text to display below the field.
  final String? helperText;

  /// Prefix icon.
  final IconData? prefixIcon;

  /// Custom prefix widget (overrides prefixIcon).
  final Widget? prefix;

  /// Suffix icon.
  final IconData? suffixIcon;

  /// Custom suffix widget (overrides suffixIcon).
  final Widget? suffix;

  /// Keyboard type.
  final TextInputType? keyboardType;

  /// Text input action.
  final TextInputAction? textInputAction;

  /// Whether this is a password field with visibility toggle.
  final bool isPassword;

  /// Whether the field is enabled.
  final bool enabled;

  /// Whether the field is read-only.
  final bool readOnly;

  /// Whether to autofocus this field.
  final bool autofocus;

  /// Maximum number of lines.
  final int? maxLines;

  /// Minimum number of lines.
  final int? minLines;

  /// Maximum length of input.
  final int? maxLength;

  /// Input formatters.
  final List<TextInputFormatter>? inputFormatters;

  /// Called when text changes.
  final ValueChanged<String>? onChanged;

  /// Called when editing is complete.
  final VoidCallback? onEditingComplete;

  /// Called when user submits.
  final ValueChanged<String>? onSubmitted;

  /// Called when field is tapped.
  final VoidCallback? onTap;

  /// Focus node.
  final FocusNode? focusNode;

  /// Text capitalization.
  final TextCapitalization textCapitalization;

  /// Obscuring character for password fields.
  final String obscuringCharacter;

  /// Custom border radius (overrides theme).
  final double? borderRadius;

  /// Custom background color (overrides theme).
  final Color? backgroundColor;

  /// Custom border color (overrides theme).
  final Color? borderColor;

  /// Custom focused border color (overrides theme).
  final Color? focusedBorderColor;

  /// Custom error border color.
  final Color? errorBorderColor;

  /// Custom content padding (overrides theme).
  final EdgeInsets? contentPadding;

  /// Custom text style.
  final TextStyle? textStyle;

  /// Custom hint style.
  final TextStyle? hintStyle;

  /// Custom label style.
  final TextStyle? labelStyle;

  /// Custom error style.
  final TextStyle? errorStyle;

  /// Whether to show character counter.
  final bool showCounter;

  /// Border width.
  final double? borderWidth;

  /// Whether to animate focus changes.
  final bool animateFocus;

  /// Text field variant.
  final UIProTextFieldVariant variant;

  /// Text field type for validation.
  final UIProTextFieldType fieldType;

  /// Whether to validate that field is not empty.
  final bool validateNotEmpty;

  /// Custom error message for empty field.
  final String emptyErrorMessage;

  /// Custom error message for invalid email.
  final String invalidEmailMessage;

  /// Minimum password length for validation.
  final int minPasswordLength;

  /// Custom error message for short password.
  final String shortPasswordMessage;

  /// Creates a theme-aware text field.
  const UIProTextField({
    super.key,
    this.controller,
    this.hint,
    this.label,
    this.errorText,
    this.helperText,
    this.prefixIcon,
    this.prefix,
    this.suffixIcon,
    this.suffix,
    this.keyboardType,
    this.textInputAction,
    this.isPassword = false,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.inputFormatters,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.onTap,
    this.focusNode,
    this.textCapitalization = TextCapitalization.none,
    this.obscuringCharacter = '•',
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.contentPadding,
    this.textStyle,
    this.hintStyle,
    this.labelStyle,
    this.errorStyle,
    this.showCounter = false,
    this.borderWidth,
    this.animateFocus = true,
    this.variant = UIProTextFieldVariant.outlined,
    this.fieldType = UIProTextFieldType.text,
    this.validateNotEmpty = false,
    this.emptyErrorMessage = "This field is required",
    this.invalidEmailMessage = "Please enter a valid email",
    this.minPasswordLength = 6,
    this.shortPasswordMessage = "Password must be at least 6 characters",
  });

  /// Creates an email text field with built-in email validation.
  const UIProTextField.email({
    super.key,
    this.controller,
    this.hint = "Email",
    this.label,
    this.errorText,
    this.helperText,
    this.prefixIcon = Icons.email_outlined,
    this.prefix,
    this.suffixIcon,
    this.suffix,
    this.textInputAction,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.maxLength,
    this.inputFormatters,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.onTap,
    this.focusNode,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.contentPadding,
    this.textStyle,
    this.hintStyle,
    this.labelStyle,
    this.errorStyle,
    this.showCounter = false,
    this.borderWidth,
    this.animateFocus = true,
    this.variant = UIProTextFieldVariant.outlined,
    this.validateNotEmpty = false,
    this.emptyErrorMessage = "Email is required",
    this.invalidEmailMessage = "Please enter a valid email",
  }) : isPassword = false,
       keyboardType = TextInputType.emailAddress,
       textCapitalization = TextCapitalization.none,
       obscuringCharacter = '•',
       maxLines = 1,
       minLines = null,
       fieldType = UIProTextFieldType.email,
       minPasswordLength = 6,
       shortPasswordMessage = "Password must be at least 6 characters";

  /// Creates a password text field with visibility toggle.
  const UIProTextField.password({
    super.key,
    this.controller,
    this.hint = "Password",
    this.label,
    this.errorText,
    this.helperText,
    this.prefixIcon = Icons.lock_outline,
    this.prefix,
    this.textInputAction,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.maxLength,
    this.inputFormatters,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.onTap,
    this.focusNode,
    this.obscuringCharacter = '•',
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.contentPadding,
    this.textStyle,
    this.hintStyle,
    this.labelStyle,
    this.errorStyle,
    this.showCounter = false,
    this.borderWidth,
    this.animateFocus = true,
    this.variant = UIProTextFieldVariant.outlined,
    this.validateNotEmpty = false,
    this.emptyErrorMessage = "Password is required",
    this.minPasswordLength = 6,
    this.shortPasswordMessage = "Password must be at least 6 characters",
  }) : isPassword = true,
       keyboardType = TextInputType.visiblePassword,
       textCapitalization = TextCapitalization.none,
       maxLines = 1,
       minLines = null,
       suffixIcon = null,
       suffix = null,
       fieldType = UIProTextFieldType.password,
       invalidEmailMessage = "Please enter a valid email";

  /// Creates a multiline text area.
  const UIProTextField.multiline({
    super.key,
    this.controller,
    this.hint,
    this.label,
    this.errorText,
    this.helperText,
    this.prefixIcon,
    this.prefix,
    this.suffixIcon,
    this.suffix,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.maxLines = 5,
    this.minLines = 3,
    this.maxLength,
    this.inputFormatters,
    this.onChanged,
    this.onEditingComplete,
    this.onTap,
    this.focusNode,
    this.textCapitalization = TextCapitalization.sentences,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.contentPadding,
    this.textStyle,
    this.hintStyle,
    this.labelStyle,
    this.errorStyle,
    this.showCounter = true,
    this.borderWidth,
    this.animateFocus = true,
    this.variant = UIProTextFieldVariant.outlined,
    this.validateNotEmpty = false,
    this.emptyErrorMessage = "This field is required",
  }) : isPassword = false,
       keyboardType = TextInputType.multiline,
       textInputAction = TextInputAction.newline,
       onSubmitted = null,
       obscuringCharacter = '•',
       fieldType = UIProTextFieldType.text,
       invalidEmailMessage = "Please enter a valid email",
       minPasswordLength = 6,
       shortPasswordMessage = "Password must be at least 6 characters";

  @override
  State<UIProTextField> createState() => _UIProTextFieldState();
}

class _UIProTextFieldState extends State<UIProTextField>
    with SingleTickerProviderStateMixin {
  late FocusNode _focusNode;
  late AnimationController _animationController;
  late Animation<double> _borderAnimation;
  bool _obscureText = true;
  bool _isFocused = false;
  String? _validationError;
  bool _hasBeenEdited = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_handleFocusChange);

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _borderAnimation = Tween<double>(begin: 1, end: 2).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    } else {
      _focusNode.removeListener(_handleFocusChange);
    }
    _animationController.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });

    // Validate on focus lost
    if (!_focusNode.hasFocus && _hasBeenEdited) {
      _validate(widget.controller?.text ?? '');
    }

    if (widget.animateFocus) {
      if (_focusNode.hasFocus) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  void _toggleObscure() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  /// Validates the current value and returns error message or null.
  String? _validate(String value) {
    String? error;

    // Check empty
    if (widget.validateNotEmpty && value.trim().isEmpty) {
      error = widget.emptyErrorMessage;
    }
    // Check email format
    else if (widget.fieldType == UIProTextFieldType.email && value.isNotEmpty) {
      final emailRegex = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      );
      if (!emailRegex.hasMatch(value)) {
        error = widget.invalidEmailMessage;
      }
    }
    // Check password length
    else if (widget.fieldType == UIProTextFieldType.password &&
        value.isNotEmpty) {
      if (value.length < widget.minPasswordLength) {
        error = widget.shortPasswordMessage;
      }
    }

    setState(() {
      _validationError = error;
    });

    return error;
  }

  void _onTextChanged(String value) {
    _hasBeenEdited = true;

    // Clear validation error while typing (will re-validate on blur)
    if (_validationError != null) {
      _validate(value);
    }

    widget.onChanged?.call(value);
  }

  /// Get effective error text (external or internal validation)
  String? get _effectiveErrorText {
    return widget.errorText ?? _validationError;
  }

  @override
  Widget build(BuildContext context) {
    final theme = UIProTheme.of(context);

    final effectiveBorderRadius = widget.borderRadius ?? theme.borderRadius;
    final effectiveBackgroundColor =
        widget.backgroundColor ?? theme.effectiveTextFieldBackgroundColor;
    final effectiveBorderWidth = widget.borderWidth ?? theme.borderWidth;

    // Determine border color based on state
    Color currentBorderColor;
    if (_effectiveErrorText != null) {
      currentBorderColor = widget.errorBorderColor ?? theme.errorColor;
    } else if (_isFocused) {
      currentBorderColor =
          widget.focusedBorderColor ??
          theme.effectiveTextFieldFocusedBorderColor;
    } else {
      currentBorderColor =
          widget.borderColor ?? theme.effectiveTextFieldBorderColor;
    }

    final effectiveContentPadding =
        widget.contentPadding ?? theme.effectiveTextFieldContentPadding;

    final effectiveTextStyle = theme
        .textStyle(
          fontSize: theme.fontSizeBase,
          color: widget.enabled ? theme.textColor : theme.disabledColor,
        )
        .merge(widget.textStyle);

    final effectiveHintStyle = theme
        .textStyle(
          fontSize: theme.fontSizeBase,
          color: theme.effectiveTextFieldHintColor,
        )
        .merge(widget.hintStyle);

    final effectiveLabelStyle = theme
        .textStyle(
          fontSize: theme.fontSizeSmall,
          fontWeight: theme.fontWeightMedium,
          color: _isFocused ? theme.primaryColor : theme.textSecondaryColor,
        )
        .merge(widget.labelStyle);

    final effectiveErrorStyle = theme
        .textStyle(fontSize: theme.fontSizeSmall, color: theme.errorColor)
        .merge(widget.errorStyle);

    // Build prefix
    Widget? prefixWidget;
    if (widget.prefix != null) {
      prefixWidget = widget.prefix;
    } else if (widget.prefixIcon != null) {
      prefixWidget = Padding(
        padding: EdgeInsets.only(right: theme.spacingSM),
        child: Icon(
          widget.prefixIcon,
          size: 20,
          color: _isFocused ? theme.primaryColor : theme.textSecondaryColor,
        ),
      );
    }

    // Build suffix
    Widget? suffixWidget;
    if (widget.isPassword) {
      suffixWidget = GestureDetector(
        onTap: _toggleObscure,
        child: Padding(
          padding: EdgeInsets.only(left: theme.spacingSM),
          child: Icon(
            _obscureText
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            size: 20,
            color: theme.textSecondaryColor,
          ),
        ),
      );
    } else if (widget.suffix != null) {
      suffixWidget = widget.suffix;
    } else if (widget.suffixIcon != null) {
      suffixWidget = Padding(
        padding: EdgeInsets.only(left: theme.spacingSM),
        child: Icon(
          widget.suffixIcon,
          size: 20,
          color: theme.textSecondaryColor,
        ),
      );
    }

    // Build the text field based on variant
    Widget textField = _buildTextField(
      theme: theme,
      borderRadius: effectiveBorderRadius,
      backgroundColor: effectiveBackgroundColor,
      borderColor: currentBorderColor,
      borderWidth: effectiveBorderWidth,
      contentPadding: effectiveContentPadding,
      textStyle: effectiveTextStyle,
      hintStyle: effectiveHintStyle,
      prefixWidget: prefixWidget,
      suffixWidget: suffixWidget,
    );

    // Wrap with label and error
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null) ...[
          AnimatedDefaultTextStyle(
            duration: theme.animationDurationFast,
            style: effectiveLabelStyle,
            child: Text(widget.label!),
          ),
          SizedBox(height: theme.spacingXS),
        ],
        AnimatedBuilder(
          animation: _borderAnimation,
          builder: (context, child) {
            return textField;
          },
        ),
        if (_effectiveErrorText != null) ...[
          SizedBox(height: theme.spacingXS),
          Text(_effectiveErrorText!, style: effectiveErrorStyle),
        ] else if (widget.helperText != null) ...[
          SizedBox(height: theme.spacingXS),
          Text(
            widget.helperText!,
            style: theme.textStyle(
              fontSize: theme.fontSizeSmall,
              color: theme.textSecondaryColor,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildTextField({
    required UIProThemeData theme,
    required double borderRadius,
    required Color backgroundColor,
    required Color borderColor,
    required double borderWidth,
    required EdgeInsets contentPadding,
    required TextStyle textStyle,
    required TextStyle hintStyle,
    Widget? prefixWidget,
    Widget? suffixWidget,
  }) {
    InputBorder border;
    InputBorder focusedBorder;
    InputBorder errorBorder;

    switch (widget.variant) {
      case UIProTextFieldVariant.outlined:
        border = OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor, width: borderWidth),
        );
        focusedBorder = OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color:
                widget.focusedBorderColor ??
                theme.effectiveTextFieldFocusedBorderColor,
            width: widget.animateFocus ? _borderAnimation.value : 2,
          ),
        );
        errorBorder = OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: widget.errorBorderColor ?? theme.errorColor,
            width: borderWidth,
          ),
        );
        break;
      case UIProTextFieldVariant.filled:
        border = OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide.none,
        );
        focusedBorder = OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color:
                widget.focusedBorderColor ??
                theme.effectiveTextFieldFocusedBorderColor,
            width: 2,
          ),
        );
        errorBorder = OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: widget.errorBorderColor ?? theme.errorColor,
            width: 2,
          ),
        );
        break;
      case UIProTextFieldVariant.underlined:
        border = UnderlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: borderWidth),
        );
        focusedBorder = UnderlineInputBorder(
          borderSide: BorderSide(
            color:
                widget.focusedBorderColor ??
                theme.effectiveTextFieldFocusedBorderColor,
            width: 2,
          ),
        );
        errorBorder = UnderlineInputBorder(
          borderSide: BorderSide(
            color: widget.errorBorderColor ?? theme.errorColor,
            width: 2,
          ),
        );
        break;
    }

    return TextField(
      controller: widget.controller,
      focusNode: _focusNode,
      style: textStyle,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      obscureText: widget.isPassword && _obscureText,
      obscuringCharacter: widget.obscuringCharacter,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      autofocus: widget.autofocus,
      maxLines: widget.isPassword ? 1 : widget.maxLines,
      minLines: widget.minLines,
      maxLength: widget.maxLength,
      inputFormatters: widget.inputFormatters,
      onChanged: _onTextChanged,
      onEditingComplete: widget.onEditingComplete,
      onSubmitted: widget.onSubmitted,
      onTap: widget.onTap,
      textCapitalization: widget.textCapitalization,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: hintStyle,
        filled:
            widget.variant == UIProTextFieldVariant.filled ||
            widget.variant == UIProTextFieldVariant.outlined,
        fillColor: backgroundColor,
        contentPadding: contentPadding,
        border: border,
        enabledBorder: border,
        focusedBorder: focusedBorder,
        errorBorder: errorBorder,
        focusedErrorBorder: errorBorder,
        prefixIcon: prefixWidget != null
            ? Padding(
                padding: EdgeInsets.only(left: contentPadding.left),
                child: prefixWidget,
              )
            : null,
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        suffixIcon: suffixWidget != null
            ? Padding(
                padding: EdgeInsets.only(right: contentPadding.right),
                child: suffixWidget,
              )
            : null,
        suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        counterText: widget.showCounter ? null : '',
      ),
    );
  }
}

/// Text field style variants.
enum UIProTextFieldVariant {
  /// Outlined border style.
  outlined,

  /// Filled background with no border.
  filled,

  /// Underlined style.
  underlined,
}

/// Text field types for built-in validation.
enum UIProTextFieldType {
  /// Normal text field with no special validation.
  text,

  /// Email field with email format validation.
  email,

  /// Password field with length validation.
  password,
}
