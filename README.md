# UI Pro

A modular, theme-driven Flutter UI system that provides ready-made, production-ready common UI widgets and screens where a **single global theme configuration** controls the entire UI appearance.

[![pub package](https://img.shields.io/pub/v/ui_pro.svg)](https://pub.dev/packages/ui_pro)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## ✨ Features

- **🎨 Theme System** - Single source of truth for all UI properties
- **🔘 Smart Widgets** - Loading buttons, text fields, lists with shimmer
- **🧭 Navigation** - Theme-aware app bars and bottom navigation
- **📱 Ready-made Screens** - Auth screens (login, signup, forgot password, splash)
- **✨ Shimmer System** - Global shimmer configuration for loading states
- **🔌 No Lock-in** - Works with BLoC, Provider, Riverpod, setState, or any state management
- **📦 Modular** - Import only what you need

## 🎯 Target Audience

- Flutter beginners
- Startup / MVP developers
- Hackathon builders
- Teams wanting consistent UI quickly

## 🚀 Getting Started

### Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  ui_pro: ^1.0.0
```

### Basic Setup

Wrap your app with `UIProTheme` to provide theme data to all widgets:

```dart
import 'package:flutter/material.dart';
import 'package:ui_pro/ui_pro.dart';

void main() {
  runApp(
    UIProTheme(
      data: UIProThemeData(
        primaryColor: Colors.blue,
        secondaryColor: Colors.purple,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        borderRadius: 12,
        fontFamily: "Poppins",
        shimmerBaseColor: Colors.grey.shade300,
        shimmerHighlightColor: Colors.grey.shade100,
      ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(
        onLogin: (email, password) async {
          // Handle login
        },
        onSignupTap: () {
          // Navigate to signup
        },
      ),
    );
  }
}
```

## 📖 Usage

### Theme Access

Access theme anywhere using the context extension:

```dart
final theme = context.UIProTheme;
print(theme.primaryColor);
print(theme.borderRadius);
```

Or use the static method:

```dart
final theme = UIProTheme.of(context);
```

### Theme Presets

Use built-in presets:

```dart
// Light theme (default)
UIProTheme(data: UIProThemeData.light, child: MyApp())

// Dark theme
UIProTheme(data: UIProThemeData.dark, child: MyApp())
```

---

## 🧩 Widgets

### UIProLoadingButton

A button with built-in loading state:

```dart
UIProLoadingButton(
  text: "Login",
  isLoading: isLoading,
  onPressed: () => handleLogin(),
)

// Outlined variant
UIProLoadingButton.outlined(
  text: "Cancel",
  onPressed: () => cancel(),
)

// Text variant
UIProLoadingButton.text(
  text: "Learn More",
  onPressed: () => showDetails(),
)
```

### UIProTextField

A text field with validation, focus animations, and password toggle:

```dart
UIProTextField(
  hint: "Email",
  controller: emailController,
  prefixIcon: Icons.email_outlined,
  keyboardType: TextInputType.emailAddress,
  errorText: emailError,
)

// Password field with visibility toggle
UIProTextField.password(
  hint: "Password",
  controller: passwordController,
  errorText: passwordError,
)

// Multiline text area
UIProTextField.multiline(
  hint: "Description",
  controller: descController,
  maxLines: 5,
)
```

### UIListView

A list view that automatically shows shimmer while loading:

```dart
UIListView(
  isLoading: isLoading,
  itemCount: items.length,
  itemBuilder: (context, index) => ListTile(
    title: Text(items[index].title),
  ),
)

// With custom shimmer
UIListView(
  isLoading: isLoading,
  itemCount: items.length,
  shimmerItemBuilder: (context, index) => MyCustomShimmer(),
  itemBuilder: (context, index) => MyListItem(items[index]),
)
```

### UIGridView

A grid view with shimmer loading state:

```dart
UIGridView(
  isLoading: isLoading,
  itemCount: products.length,
  crossAxisCount: 2,
  itemBuilder: (context, index) => ProductCard(products[index]),
)
```

### UIAppBar

A theme-aware app bar:

```dart
UIAppBar(
  title: "Home",
  showBackButton: true,
  onBackPressed: () => Navigator.pop(context),
  actions: [
    UIAppBarAction(
      icon: Icons.search,
      onPressed: () => openSearch(),
    ),
    UIAppBarAction(
      icon: Icons.notifications,
      badge: "3",
      onPressed: () => openNotifications(),
    ),
  ],
)

// Transparent variant
UIAppBar.transparent(
  title: "Profile",
  showBackButton: true,
)
```

### UIBottomNav

A modern bottom navigation bar with animated indicator:

```dart
UIBottomNav(
  items: [
    UIBottomNavItem(icon: Icons.home, label: "Home"),
    UIBottomNavItem(icon: Icons.search, label: "Search"),
    UIBottomNavItem(
      icon: Icons.notifications,
      label: "Alerts",
      badge: "5",
    ),
    UIBottomNavItem(icon: Icons.person, label: "Profile"),
  ],
  currentIndex: selectedIndex,
  onChanged: (index) => setState(() => selectedIndex = index),
)

// Floating variant
UIBottomNav.floating(
  items: [...],
  currentIndex: selectedIndex,
  onChanged: (index) => setState(() => selectedIndex = index),
)
```

---

## ✨ Shimmer

### UIProShimmer

Create shimmer loading placeholders:

```dart
// Box shimmer
UIProShimmer.box(width: 200, height: 20)

// Circle shimmer (for avatars)
UIProShimmer.circle(size: 48)

// Text-like shimmer
UIProShimmer.text(width: 150, height: 14)

// Custom child with shimmer effect
UIProShimmer(
  child: Container(
    width: 200,
    height: 100,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    ),
  ),
)
```

### UIProShimmerList & UIProShimmerGrid

Pre-built shimmer lists and grids:

```dart
// Shimmer list
UIProShimmerList(
  itemCount: 5,
  itemBuilder: (context, index) => MyShimmerItem(),
)

// Shimmer grid
UIProShimmerGrid(
  itemCount: 6,
  crossAxisCount: 2,
)
```

---

## 📱 Screens

### SplashScreen

```dart
SplashScreen(
  logo: Image.asset('assets/logo.png'),
  appName: "My App",
  tagline: "Welcome to the future",
  onInitialized: () {
    Navigator.pushReplacement(context, ...);
  },
)
```

### LoginScreen

```dart
LoginScreen(
  logo: Image.asset('assets/logo.png'),
  onLogin: (email, password) async {
    await authService.login(email, password);
  },
  onSignupTap: () => Navigator.push(context, ...),
  onForgotPasswordTap: () => Navigator.push(context, ...),
  emailError: emailValidationError,
  passwordError: passwordValidationError,
  showSocialLogin: true,
  onSocialLogin: (provider) => handleSocialLogin(provider),
)
```

### SignupScreen

```dart
SignupScreen(
  onSignup: (name, email, password) async {
    await authService.register(name, email, password);
  },
  onLoginTap: () => Navigator.pop(context),
  showTermsCheckbox: true,
)
```

### ForgotPasswordScreen

```dart
ForgotPasswordScreen(
  onSubmit: (email) async {
    await authService.sendPasswordReset(email);
  },
  onBackTap: () => Navigator.pop(context),
)
```

---

## 🎨 Theme Properties

`UIProThemeData` supports extensive customization:

```dart
UIProThemeData(
  // Core Colors
  primaryColor: Colors.blue,
  secondaryColor: Colors.purple,
  backgroundColor: Colors.white,
  surfaceColor: Colors.grey.shade100,
  textColor: Colors.black,
  textSecondaryColor: Colors.grey,
  errorColor: Colors.red,
  successColor: Colors.green,
  warningColor: Colors.orange,
  dividerColor: Colors.grey.shade300,
  disabledColor: Colors.grey,

  // Typography
  fontFamily: "Poppins",
  fontSizeBase: 14,
  fontSizeSmall: 12,
  fontSizeLarge: 16,
  fontSizeXLarge: 20,

  // Spacing & Border Radius
  spacingXS: 4,
  spacingSM: 8,
  spacingMD: 16,
  spacingLG: 24,
  spacingXL: 32,
  borderRadius: 12,
  borderRadiusSmall: 8,
  borderRadiusLarge: 16,

  // Button Styles
  buttonHeight: 48,
  buttonElevation: 0,
  buttonTextColor: Colors.white,

  // TextField Styles
  textFieldBackgroundColor: Colors.grey.shade100,
  textFieldBorderColor: Colors.grey.shade300,
  textFieldFocusedBorderColor: Colors.blue,

  // Shimmer
  shimmerBaseColor: Colors.grey.shade300,
  shimmerHighlightColor: Colors.grey.shade100,
  shimmerDuration: Duration(milliseconds: 1500),

  // AppBar
  appBarBackgroundColor: Colors.blue,
  appBarElevation: 0,
  appBarCenterTitle: true,

  // Bottom Navigation
  bottomNavBackgroundColor: Colors.white,
  bottomNavSelectedColor: Colors.blue,
  bottomNavUnselectedColor: Colors.grey,
  bottomNavElevation: 8,

  // Animation
  animationDuration: Duration(milliseconds: 300),
  animationCurve: Curves.easeInOut,
)
```

---

## 🧠 Design Philosophy

### No Forced State Management

All widgets work with any state management solution:
- ✅ setState
- ✅ Provider
- ✅ Riverpod
- ✅ BLoC
- ✅ GetX
- ✅ MobX

### No Forced Navigation

Screens expose **callbacks only**, no Navigator calls:

```dart
LoginScreen(
  onLogin: (email, password) async { ... },
  onSignupTap: () { ... },  // You handle navigation
)
```

### Highly Customizable

Every widget accepts overrides:

```dart
UIProLoadingButton(
  text: "Custom",
  backgroundColor: Colors.red,  // Override theme
  borderRadius: 24,              // Override theme
  onPressed: () {},
)
```

---

## 📄 License

MIT License - see [LICENSE](LICENSE) for details.

---

## 🤝 Contributing

Contributions are welcome! Please read our contributing guidelines before submitting PRs.

## 📝 Changelog

See [CHANGELOG.md](CHANGELOG.md) for version history.
