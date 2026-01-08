# UI Pro

A collection of customizable Flutter UI widgets and components that work seamlessly with Material Theme. Provides ready-made, production-ready common UI widgets with built-in loading states and animations.

[![pub package](https://img.shields.io/pub/v/ui_pro.svg)](https://pub.dev/packages/ui_pro)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## ✨ Features

- **🔘 Smart Widgets** - Loading buttons, text fields, lists with shimmer
- **🧭 Navigation** - Customizable app bars and bottom navigation
- **✨ Shimmer System** - Beautiful loading placeholders for better UX
- **🎨 Material Compatible** - Works with Flutter's Material Theme
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

Just import and use - widgets will automatically adapt to your app's Material Theme:

```dart
import 'package:flutter/material.dart';
import 'package:ui_pro/ui_pro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // Your app's theme configuration
      ),
      home: const HomePage(),
    );
  }
}
```

## 📖 Usage

### UIProButton

A button with built-in loading state:

```dart
UIProButton(
  text: "Login",
  isLoading: isLoading,
  onPressed: () => handleLogin(),
)
```

With custom styling:

```dart
UIProButton(
  text: "Submit",
  isLoading: false,
  onPressed: () {},
  backgroundColor: Colors.green,
  textColor: Colors.white,
  borderRadius: 8,
)
```

### UIProTextField

Text field with validation and animations:

```dart
UIProTextField(
  hint: "Email",
  controller: emailController,
  keyboardType: TextInputType.emailAddress,
  errorText: emailError,
)
```

Password field with visibility toggle:

```dart
UIProTextField.password(
  hint: "Password",
  controller: passwordController,
  validateNotEmpty: true,
)
```

### UIProListView

List with automatic shimmer loading:

```dart
UIProListView(
  isLoading: isLoading,
  itemCount: items.length,
  itemBuilder: (context, index) => ListTile(
    title: Text(items[index].title),
  ),
)
```

### UIProAppBar

Customizable app bar:

```dart
UIProAppBar(
  title: "Home",
  showBackButton: true,
  actions: [
    UIProAppBarAction(
      icon: Icons.search,
      onPressed: () => openSearch(),
    ),
  ],
)
```

### UIProBottomNav

Bottom navigation with animations:

```dart
UIProBottomNav(
  items: [
    UIProBottomNavItem(icon: Icons.home, label: "Home"),
    UIProBottomNavItem(icon: Icons.search, label: "Search"),
    UIProBottomNavItem(icon: Icons.person, label: "Profile"),
  ],
  currentIndex: selectedIndex,
  onChanged: (index) => setState(() => selectedIndex = index),
)
```

## ✨ Shimmer

Create shimmer loading placeholders:

```dart
// Box shimmer
UIProShimmer.box(width: 200, height: 20)

// Circle shimmer (for avatars)
UIProShimmer.circle(size: 48)

// Text-like shimmer
UIProShimmer.text(width: 150, height: 14)
```

Pre-built shimmer lists and grids:

```dart
// Shimmer list
UIProShimmerList(
  itemCount: 5,
)

// Shimmer grid
UIProShimmerGrid(
  itemCount: 6,
  crossAxisCount: 2,
)
```

## 🎨 Customization

All widgets support extensive customization through their properties. They respect your app's Material Theme while allowing per-widget overrides:

```dart
UIProButton(
  text: "Custom",
  backgroundColor: Colors.red,  // Override material theme
  borderRadius: 24,              // Custom styling
  onPressed: () {},
)

UIProTextField(
  hint: "Email",
  backgroundColor: Colors.grey[100],  // Custom background
  focusedBorderColor: Colors.green,   // Custom focus color
)
```

## 🧠 Design Philosophy

### No Forced State Management

All widgets work with any state management solution:
- ✅ setState
- ✅ Provider
- ✅ Riverpod
- ✅ BLoC
- ✅ GetX
- ✅ MobX

### Material Theme Compatible

Widgets automatically adapt to your app's Material Theme while providing customization options through widget properties.

---

## 📄 License

MIT License - see [LICENSE](LICENSE) for details.

---

## 🤝 Contributing

Contributions are welcome! Please read our contributing guidelines before submitting PRs.

## 📝 Changelog

See [CHANGELOG.md](CHANGELOG.md) for version history.
