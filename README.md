# 🎨 UI Pro

A comprehensive, production-ready Flutter UI component library that seamlessly integrates with Material Theme. Build beautiful, consistent apps faster with smart widgets, built-in animations, and extensive customization options.

[![pub package](https://img.shields.io/pub/v/ui_pro.svg)](https://pub.dev/packages/ui_pro)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Flutter](https://img.shields.io/badge/Flutter-3.0%2B-blue)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-2.17%2B-blue)](https://dart.dev)

## Demo 
<video controls src="https://drive.google.com/file/d/1zIvZa7U3C1M1voBasd9KwWnNWW9DXk3l/" title="Title"></video>

## ✨ Features

### 🔘 Smart Widgets
- **UIProButton** - Loading states, 3 variants (filled, outlined, text), icon support
- **UIProIconButton** - Circular icon buttons with loading states
- **UIProTextField** - Built-in validation (email, password, phone), focus animations
- **UIProListView** - Automatic shimmer loading, empty states, pull-to-refresh
- **UIProSwipeableTile** - Swipe-to-delete with customizable actions
- **UIProDoubleTapExit** - Exit confirmation (snackbar or dialog)

### 🧭 Navigation Components
- **UIProAppBar** - Customizable app bar with actions, badges, and tooltips
- **UIProBottomNav** - 3 styles: Standard, Floating, and Fluid (wave animation)
- **Fluid Bottom Nav** - Unique wave animation with elastic transitions

### ✨ Loading & Shimmer
- **UIProShimmer** - Box, circle, text, and list shimmer effects
- **UIProLoader** - 5 animation styles: Horizontal Dots, Progressive, Wave, Hexagon, Flickr
- **Shimmer Builder** - Wrap any content with conditional shimmer loading

### 🎨 Design Excellence
- **Material Theme Compatible** - Automatically adapts to your app's theme
- **Extensive Customization** - Override any color, size, or style per widget
- **Smooth Animations** - Built-in transitions and loading states
- **Dark Mode Support** - Works seamlessly with light and dark themes

### 🔌 Developer Friendly
- **No State Management Lock-in** - Works with setState, Provider, Riverpod, BLoC, GetX, MobX
- **Type Safe** - Full Dart type safety and null safety
- **Well Documented** - Comprehensive docs and examples
- **Modular** - Import only what you need

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

## 📖 Usage Guide

### 🔘 UIProButton

**Three variants available:**

```dart
// Filled button (default)
UIProButton(
  text: "Login",
  isLoading: isLoading,
  onPressed: () => handleLogin(),
)

// Outlined button
UIProButton.outlined(
  text: "Cancel",
  onPressed: () => handleCancel(),
)

// Text button
UIProButton.text(
  text: "Skip",
  onPressed: () => handleSkip(),
)
```

**With icons:**

```dart
UIProButton(
  text: "Send Message",
  leading: Icon(Icons.send, color: Colors.white, size: 18),
  onPressed: () => sendMessage(),
)

UIProButton(
  text: "Continue",
  trailing: Icon(Icons.arrow_forward, color: Colors.white, size: 18),
  onPressed: () => next(),
)
```

**Custom styling:**

```dart
UIProButton(
  text: "Custom",
  backgroundColor: Colors.green,
  textColor: Colors.white,
  borderRadius: 24,
  height: 56,
  elevation: 4,
  onPressed: () {},
)
```

**Icon button:**

```dart
UIProIconButton(
  icon: Icons.favorite,
  color: Colors.red,
  size: 28,
  isLoading: isSaving,
  onPressed: () => toggleFavorite(),
)
```

### 📝 UIProTextField

**Basic usage:**

```dart
UIProTextField(
  hint: "Enter your name",
  label: "Full Name",
  controller: nameController,
  prefixIcon: Icons.person,
  onChanged: (value) => print(value),
)
```

**Email field with validation:**

```dart
UIProTextField.email(
  controller: emailController,
  validateNotEmpty: true,
  invalidEmailMessage: "Please enter a valid email",
)
```

**Password field with visibility toggle:**

```dart
UIProTextField.password(
  hint: "Password",
  controller: passwordController,
  validateNotEmpty: true,
  minPasswordLength: 8,
  shortPasswordMessage: "Password must be at least 8 characters",
)
```

**Phone number field:**

```dart
UIProTextField.phone(
  controller: phoneController,
  hint: "Phone Number",
)
```

**Search field:**

```dart
UIProTextField.search(
  controller: searchController,
  hint: "Search...",
  onChanged: (query) => performSearch(query),
)
```

**Multiline text:**

```dart
UIProTextField.multiline(
  controller: messageController,
  hint: "Enter your message",
  maxLines: 5,
)
```

### 📋 UIProListView

**List with shimmer loading:**

```dart
UIProListView(
  isLoading: isLoading,
  itemCount: items.length,
  itemBuilder: (context, index) => ListTile(
    leading: CircleAvatar(child: Text(items[index].initial)),
    title: Text(items[index].name),
    subtitle: Text(items[index].email),
  ),
  shimmerItemCount: 5, // Number of shimmer items to show while loading
)
```

**With empty state:**

```dart
UIProListView(
  isLoading: false,
  itemCount: items.length,
  itemBuilder: (context, index) => ListTile(title: Text(items[index])),
  emptyWidget: UIProEmptyState(
    icon: Icons.inbox_outlined,
    title: "No Items",
    description: "Add your first item to get started",
    actionText: "Add Item",
    onAction: () => showAddDialog(),
  ),
)
```

### 🧭 UIProAppBar

**Basic app bar:**

```dart
UIProAppBar(
  title: "Home",
  showBackButton: true,
)
```

**With actions:**

```dart
UIProAppBar(
  title: "Messages",
  actions: [
    UIProAppBarAction(
      icon: Icons.search,
      tooltip: "Search",
      onPressed: () => openSearch(),
    ),
    UIProAppBarAction(
      icon: Icons.notifications,
      badge: "3", // Shows notification count
      onPressed: () => openNotifications(),
    ),
  ],
)
```

**Custom styling:**

```dart
UIProAppBar(
  title: "Custom",
  backgroundColor: Colors.blue,
  foregroundColor: Colors.white,
  elevation: 4,
  centerTitle: true,
)
```

### 🧭 UIProBottomNav

**Standard bottom navigation:**

```dart
UIProBottomNav(
  items: [
    UIProBottomNavItem(icon: Icons.home, label: "Home"),
    UIProBottomNavItem(icon: Icons.search, label: "Search"),
    UIProBottomNavItem(icon: Icons.favorite, label: "Favorites"),
    UIProBottomNavItem(icon: Icons.person, label: "Profile"),
  ],
  currentIndex: selectedIndex,
  onChanged: (index) => setState(() => selectedIndex = index),
)
```

**Floating navigation:**

```dart
UIProBottomNav.floating(
  items: [
    UIProBottomNavItem(icon: Icons.home, label: "Home"),
    UIProBottomNavItem(icon: Icons.explore, label: "Explore"),
    UIProBottomNavItem(icon: Icons.notifications, label: "Alerts", showBadgeDot: true),
    UIProBottomNavItem(icon: Icons.settings, label: "Settings"),
  ],
  currentIndex: selectedIndex,
  onChanged: (index) => setState(() => selectedIndex = index),
)
```

**Fluid navigation (wave animation):**

```dart
UIProBottomNav.fluid(
  items: [
    UIProBottomNavItem(icon: Icons.dashboard, label: "Dashboard"),
    UIProBottomNavItem(icon: Icons.shopping_cart, label: "Shop"),
    UIProBottomNavItem(icon: Icons.chat, label: "Chat"),
    UIProBottomNavItem(icon: Icons.account_circle, label: "Account"),
  ],
  currentIndex: selectedIndex,
  onChanged: (index) => setState(() => selectedIndex = index),
  backgroundColor: Colors.blue,
  selectedColor: Colors.white,
  unselectedColor: Colors.white70,
  animationFactor: 1.0, // Animation speed (< 1 faster, > 1 slower)
  scaleFactor: 1.2, // Icon scale on selection
)
```

### 💫 UIProSwipeableTile

**Swipe to delete:**

```dart
UIProSwipeableTile(
  key: ValueKey(item.id),
  backgroundBuilder: (context, direction, progress) => Container(
    color: Colors.red,
    alignment: Alignment.centerRight,
    padding: EdgeInsets.only(right: 20),
    child: Icon(Icons.delete, color: Colors.white),
  ),
  onSwiped: (direction) {
    // Handle delete
    deleteItem(item);
  },
  child: ListTile(
    title: Text(item.name),
    subtitle: Text(item.description),
  ),
)
```

**With confirmation:**

```dart
UIProSwipeableTile(
  key: ValueKey(item.id),
  backgroundBuilder: (context, direction, progress) => Container(
    color: Colors.red,
    child: Icon(Icons.delete, color: Colors.white),
  ),
  confirmSwipe: (direction) async {
    return await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Item?'),
        content: Text('This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text('Delete'),
          ),
        ],
      ),
    );
  },
  onSwiped: (direction) => deleteItem(item),
  child: YourListItem(),
)
```

### 🚪 UIProDoubleTapExit

**Exit confirmation with snackbar:**

```dart
UIProDoubleTapExit(
  child: Scaffold(
    appBar: AppBar(title: Text('Home')),
    body: YourContent(),
  ),
)
```

**Custom snackbar:**

```dart
UIProDoubleTapExit(
  exitStyle: ExitStyle.snackBar,
  snackBarConfig: ExitSnackBarConfig(
    content: Text('Press back again to exit'),
    backgroundColor: Colors.red,
    duration: Duration(seconds: 3),
  ),
  child: YourScaffold(),
)
```

**Exit confirmation with dialog:**

```dart
UIProDoubleTapExit(
  exitStyle: ExitStyle.dialog,
  dialogConfig: ExitDialogConfig(
    title: Text('Exit App?'),
    content: Text('Are you sure you want to exit?'),
    cancelButton: TextButton(
      onPressed: () => Navigator.pop(context),
      child: Text('Stay'),
    ),
    confirmButton: ElevatedButton(
      onPressed: () => SystemNavigator.pop(),
      child: Text('Exit'),
    ),
    onConfirm: () => SystemNavigator.pop(),
  ),
  child: YourScaffold(),
)
```

### ✨ UIProShimmer

**Basic shimmer shapes:**

```dart
// Box shimmer
UIProShimmer.box(width: 200, height: 20)

// Circle shimmer (for avatars)
UIProShimmer.circle(size: 48)

// Text-like shimmer
UIProShimmer.text(width: 150, height: 14)
```

**Pre-built shimmer lists:**

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

**Custom shimmer colors:**

```dart
UIProShimmer.box(
  width: double.infinity,
  height: 80,
  baseColor: Colors.blue[100]!,
  highlightColor: Colors.blue[50]!,
)
```

**Shimmer builder for complex layouts:**

```dart
UIProShimmerBuilder(
  isLoading: isLoading,
  child: Column(
    children: [
      UIProShimmerWrap.circle(
        size: 48,
        child: CircleAvatar(backgroundImage: NetworkImage(user.avatar)),
      ),
      UIProShimmerWrap.text(
        width: 120,
        child: Text(user.name),
      ),
      UIProShimmerWrap.box(
        width: double.infinity,
        height: 100,
        child: Image.network(user.coverImage),
      ),
    ],
  ),
)
```

### ⏳ UIProLoader

**Five animation styles:**

```dart
// Horizontal rotating dots
UIProLoader.horizontalRotatingDots(
  color: Colors.blue,
  size: 50,
)

// Progressive dots
UIProLoader.progressiveDots(
  color: Colors.blue,
  size: 50,
)

// Wave dots
UIProLoader.waveDots(
  color: Colors.blue,
  size: 50,
)

// Hexagon dots
UIProLoader.hexagonDots(
  color: Colors.blue,
  size: 50,
)

// Flickr (two-color animation)
UIProLoader.flickr(
  leftDotColor: Colors.blue,
  rightDotColor: Colors.red,
  size: 50,
)
```

## 🎨 Customization

All widgets support extensive customization while respecting your app's Material Theme:

### Theme Integration

```dart
MaterialApp(
  theme: ThemeData(
    primaryColor: Colors.blue,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    // Widgets automatically use your theme
  ),
  home: HomePage(),
)
```

### Per-Widget Customization

```dart
// Override specific properties
UIProButton(
  text: "Custom Button",
  backgroundColor: Colors.red,    // Override theme
  textColor: Colors.white,
  borderRadius: 24,
  elevation: 8,
  height: 56,
  onPressed: () {},
)

UIProTextField(
  hint: "Custom Field",
  backgroundColor: Colors.grey[100],
  focusedBorderColor: Colors.green,
  borderRadius: 16,
)

UIProBottomNav(
  items: [...],
  backgroundColor: Colors.white,
  selectedColor: Colors.blue,
  unselectedColor: Colors.grey,
  elevation: 8,
  iconSize: 28,
  showLabels: true,
  currentIndex: 0,
  onChanged: (index) {},
)
```

## 🧠 Design Philosophy

### 1. Material Theme Compatible
Widgets automatically adapt to your app's Material Theme while providing granular customization options.

### 2. No State Management Lock-in
Works seamlessly with any state management solution:
- ✅ setState (vanilla Flutter)
- ✅ Provider
- ✅ Riverpod
- ✅ BLoC / Cubit
- ✅ GetX
- ✅ MobX
- ✅ Redux

### 3. Production Ready
- Null-safe and type-safe
- Optimized performance
- Smooth animations (60 FPS)
- Accessibility support
- Well-tested components

### 4. Developer Experience
- Clear, consistent API
- Comprehensive documentation
- Rich examples
- Predictable behavior

## 📱 Supported Platforms

- ✅ **Android** (API 21+)
- ✅ **iOS** (iOS 11+)
- ✅ **Web**
- ✅ **macOS**
- ✅ **Linux**
- ✅ **Windows**

## 📦 What's Included

### Buttons
- `UIProButton` - Filled, outlined, text variants
- `UIProIconButton` - Circular icon buttons

### Text Fields
- `UIProTextField` - Base text field
- `UIProTextField.email` - Email with validation
- `UIProTextField.password` - Password with toggle
- `UIProTextField.phone` - Phone number input
- `UIProTextField.search` - Search with clear button
- `UIProTextField.multiline` - Multiline text area

### Lists & Data Display
- `UIProListView` - List with shimmer loading
- `UIProEmptyState` - Empty state with action
- `UIProSwipeableTile` - Swipeable list items

### Navigation
- `UIProAppBar` - App bar with actions
- `UIProBottomNav` - Standard navigation
- `UIProBottomNav.floating` - Floating navigation
- `UIProBottomNav.fluid` - Fluid wave navigation
- `UIProDoubleTapExit` - Exit confirmation

### Loading & Feedback
- `UIProShimmer` - Box, circle, text shimmers
- `UIProShimmerList` - Pre-built list shimmer
- `UIProShimmerGrid` - Pre-built grid shimmer
- `UIProShimmerBuilder` - Conditional shimmer wrapper
- `UIProLoader` - 5 animation styles

## 🚀 Example App

Check out the [example app](example/) for a comprehensive showcase of all widgets:

```bash
cd example
flutter run
```

The example includes:
- **Buttons Page** - All button variants and states
- **Text Fields Page** - All input types with validation
- **Navigation Page** - All navigation styles
- **Lists Page** - List with loading and empty states
- **Loading Page** - All shimmer and loader animations
- **Swipeable Page** - Swipeable tiles demo

## 🎯 Use Cases

Perfect for:
- 📱 **Mobile Apps** - iOS and Android
- 🌐 **Web Apps** - Progressive web apps
- 🖥️ **Desktop Apps** - Windows, macOS, Linux
- 🚀 **MVPs & Prototypes** - Rapid development
- 🏢 **Enterprise Apps** - Consistent UI
- 🎓 **Learning Flutter** - Best practices examples

## 💡 Tips & Best Practices

### 1. Use Loading States
```dart
bool isLoading = false;

UIProButton(
  text: "Submit",
  isLoading: isLoading,
  onPressed: () async {
    setState(() => isLoading = true);
    await submitForm();
    setState(() => isLoading = false);
  },
)
```

### 2. Validate Inputs
```dart
// Email validation
UIProTextField.email(
  controller: emailController,
  validateNotEmpty: true,
)

// Password validation
UIProTextField.password(
  controller: passwordController,
  validateNotEmpty: true,
  minPasswordLength: 8,
)
```

### 3. Use Shimmer for Better UX
```dart
UIProListView(
  isLoading: isLoading,
  itemCount: items.length,
  itemBuilder: (context, index) => YourListItem(items[index]),
  shimmerItemCount: 5, // Shows 5 shimmer items while loading
)
```

### 4. Handle Empty States
```dart
UIProListView(
  isLoading: false,
  itemCount: items.length,
  itemBuilder: (context, index) => YourListItem(items[index]),
  emptyWidget: UIProEmptyState(
    icon: Icons.inbox_outlined,
    title: "No Items",
    description: "Get started by adding your first item",
    actionText: "Add Item",
    onAction: () => showAddDialog(),
  ),
)
```

## 🔄 Migration Guide

### From v1.0.0 to v1.0.2

No breaking changes. All new features are additive:
- ✅ Fluid bottom navigation added
- ✅ Swipeable tiles added
- ✅ Double-tap exit added
- ✅ More loader animations
- ✅ Enhanced shimmer system

## 🐛 Troubleshooting

### Issue: Buttons not showing
**Solution:** Ensure you've imported the package:
```dart
import 'package:ui_pro/ui_pro.dart';
```

### Issue: Theme colors not applying
**Solution:** Make sure your MaterialApp has a theme defined:
```dart
MaterialApp(
  theme: ThemeData(
    primarySwatch: Colors.blue,
  ),
  home: YourHomePage(),
)
```

### Issue: Shimmer not animating
**Solution:** Ensure `isLoading` is properly toggled:
```dart
UIProListView(
  isLoading: true, // Must be true to show shimmer
  itemCount: items.length,
  itemBuilder: (context, index) => YourItem(),
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
