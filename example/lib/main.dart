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
      title: 'UI Pro Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const UIProDemoHome(),
    );
  }
}

class UIProDemoHome extends StatefulWidget {
  const UIProDemoHome({super.key});

  @override
  State<UIProDemoHome> createState() => _UIProDemoHomeState();
}

class _UIProDemoHomeState extends State<UIProDemoHome> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    ButtonsPage(),
    TextFieldsPage(),
    NavigationPage(),
    ListsPage(),
    LoadingPage(),
    SwipeablePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return UIProDoubleTapExit(
      exitStyle: ExitStyle.snackBar,
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: UIProAppBar(
          title: _getTitle(),
          actions: [
            UIProAppBarAction(
              icon: Icons.info_outline,
              onPressed: () => _showInfo(context),
              tooltip: "About",
            ),
          ],
        ),
        body: _pages[_currentIndex],
        bottomNavigationBar: UIProBottomNav(
          items: const [
            UIProBottomNavItem(icon: Icons.smart_button, label: "Buttons"),
            UIProBottomNavItem(icon: Icons.text_fields, label: "Fields"),
            UIProBottomNavItem(icon: Icons.navigation, label: "Navigation"),
            UIProBottomNavItem(icon: Icons.list, label: "Lists"),
            UIProBottomNavItem(icon: Icons.hourglass_empty, label: "Loading"),
            UIProBottomNavItem(icon: Icons.swipe, label: "Swipe"),
          ],
          currentIndex: _currentIndex,
          onChanged: (index) => setState(() => _currentIndex = index),
        ),
      ),
    );
  }

  String _getTitle() {
    switch (_currentIndex) {
      case 0:
        return "Buttons & Actions";
      case 1:
        return "Text Fields";
      case 2:
        return "Navigation";
      case 3:
        return "Lists & States";
      case 4:
        return "Loading & Shimmer";
      case 5:
        return "Swipeable Tiles";
      default:
        return "UI Pro Demo";
    }
  }

  void _showInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("UI Pro Package"),
        content: const Text(
          "A collection of customizable Flutter UI widgets.\n\n"
          "• Material Theme Compatible\n"
          "• No State Management Lock-in\n"
          "• Production Ready\n"
          "• Easy to Use",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════
// BUTTONS PAGE
// ═══════════════════════════════════════════════════════════════════════

class ButtonsPage extends StatefulWidget {
  const ButtonsPage({super.key});

  @override
  State<ButtonsPage> createState() => _ButtonsPageState();
}

class _ButtonsPageState extends State<ButtonsPage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _SectionTitle("Loading Buttons"),
        const SizedBox(height: 12),
        UIProButton(
          text: "Primary Button",
          isLoading: _isLoading,
          onPressed: () => _simulateLoading(),
        ),
        const SizedBox(height: 12),
        UIProButton.outlined(
          text: "Outlined Button",
          onPressed: () => _showSnackBar("Outlined Button Pressed"),
        ),
        const SizedBox(height: 12),
        UIProButton.text(
          text: "Text Button",
          onPressed: () => _showSnackBar("Text Button Pressed"),
        ),
        const SizedBox(height: 12),
        UIProButton(
          text: "With Leading Icon",
          leading: const Icon(Icons.send, color: Colors.white, size: 18),
          onPressed: () => _showSnackBar("Button with Icon Pressed"),
        ),
        const SizedBox(height: 12),
        UIProButton(
          text: "With Trailing Icon",
          trailing: const Icon(
            Icons.arrow_forward,
            color: Colors.white,
            size: 18,
          ),
          onPressed: () => _showSnackBar("Button with Trailing Icon Pressed"),
        ),
        const SizedBox(height: 12),
        UIProButton(text: "Disabled Button", onPressed: null),
        const SizedBox(height: 24),
        _SectionTitle("Icon Buttons"),
        const SizedBox(height: 12),
        Row(
          children: [
            UIProIconButton(
              icon: Icons.favorite,
              color: Colors.red,
              onPressed: () => _showSnackBar("Favorite"),
            ),
            const SizedBox(width: 12),
            UIProIconButton(
              icon: Icons.share,
              color: Colors.blue,
              onPressed: () => _showSnackBar("Share"),
            ),
            const SizedBox(width: 12),
            UIProIconButton(
              icon: Icons.bookmark,
              color: Colors.amber,
              onPressed: () => _showSnackBar("Bookmark"),
            ),
            const SizedBox(width: 12),
            UIProIconButton(
              icon: Icons.delete,
              color: Colors.grey,
              onPressed: () => _showSnackBar("Delete"),
            ),
          ],
        ),
        const SizedBox(height: 24),
        _SectionTitle("Button Variants"),
        const SizedBox(height: 12),
        UIProButton(
          text: "Custom Colors",
          backgroundColor: Colors.green,
          onPressed: () => _showSnackBar("Custom Color Button"),
        ),
        const SizedBox(height: 12),
        UIProButton(
          text: "Large Button",
          height: 56,
          onPressed: () => _showSnackBar("Large Button"),
        ),
        const SizedBox(height: 12),
        UIProButton(
          text: "Rounded Button",
          borderRadius: 28,
          onPressed: () => _showSnackBar("Rounded Button"),
        ),
      ],
    );
  }

  Future<void> _simulateLoading() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      setState(() => _isLoading = false);
      _showSnackBar("Action Completed!");
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 1)),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════
// TEXT FIELDS PAGE
// ═══════════════════════════════════════════════════════════════════════

class TextFieldsPage extends StatefulWidget {
  const TextFieldsPage({super.key});

  @override
  State<TextFieldsPage> createState() => _TextFieldsPageState();
}

class _TextFieldsPageState extends State<TextFieldsPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _SectionTitle("Basic Text Fields"),
        const SizedBox(height: 12),
        UIProTextField(
          controller: _nameController,
          hint: "Full Name",
          prefixIcon: Icons.person,
        ),
        const SizedBox(height: 12),
        UIProTextField.email(
          controller: _emailController,
          validateNotEmpty: true,
        ),
        const SizedBox(height: 12),
        UIProTextField.password(
          controller: _passwordController,
          hint: "Password",
          validateNotEmpty: true,
          errorBorderColor: Colors.red,
        ),
        const SizedBox(height: 12),
        UIProTextField(
          validateNotEmpty: true,
          controller: _phoneController,
          hint: "Phone Number",
          prefixIcon: Icons.phone,
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.next,
          animateFocus: true,
        ),
        const SizedBox(height: 24),
        _SectionTitle("Search Field"),
        const SizedBox(height: 12),
        UIProTextField(
          controller: _searchController,
          hint: "Search...",
          prefixIcon: Icons.search,
          suffix: _searchController.text.isNotEmpty
              ? UIProIconButton(
                  icon: Icons.clear,
                  size: 20,
                  onPressed: () {
                    _searchController.clear();
                    setState(() {});
                  },
                )
              : null,
          onChanged: (value) => setState(() {}),
        ),
        const SizedBox(height: 24),
        _SectionTitle("Multiline Text Field"),
        const SizedBox(height: 12),
        UIProTextField(
          hint: "Enter your message...",
          maxLines: 4,
          prefixIcon: Icons.message,
        ),
        const SizedBox(height: 24),
        _SectionTitle("With Label"),
        const SizedBox(height: 12),
        UIProTextField(
          hint: "Enter value",
          label: "Label Text",
          prefixIcon: Icons.edit,
        ),
        const SizedBox(height: 24),
        UIProButton(
          text: "Submit Form",
          leading: const Icon(Icons.check, color: Colors.white, size: 18),
          onPressed: () {
            if (_nameController.text.isEmpty ||
                _emailController.text.isEmpty ||
                _passwordController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Please fill all required fields"),
                ),
              );
              return;
            }
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("Form Submitted!")));
          },
        ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════
// NAVIGATION PAGE
// ═══════════════════════════════════════════════════════════════════════

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _standardIndex = 0;
  int _floatingIndex = 0;
  int _fluidIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _SectionTitle("Standard Bottom Navigation"),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                height: 200,
                alignment: Alignment.center,
                child: Text(
                  "Page ${_standardIndex + 1}",
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              UIProBottomNav(
                indicatorWidth: 10,
                items: const [
                  UIProBottomNavItem(icon: Icons.home, label: "Home"),
                  UIProBottomNavItem(icon: Icons.search, label: "Search"),
                  UIProBottomNavItem(icon: Icons.favorite, label: "Favorites"),
                  UIProBottomNavItem(icon: Icons.person, label: "Profile"),
                ],
                currentIndex: _standardIndex,
                onChanged: (index) => setState(() => _standardIndex = index),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        _SectionTitle("Floating Bottom Navigation"),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                height: 200,
                alignment: Alignment.center,
                child: Text(
                  "Page ${_floatingIndex + 1}",
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              UIProBottomNav.floating(
                showLabels: false,
                items: const [
                  UIProBottomNavItem(icon: Icons.home, label: "Home"),
                  UIProBottomNavItem(icon: Icons.explore, label: "Explore"),
                  UIProBottomNavItem(
                    icon: Icons.notifications,
                    label: "Alerts",
                    showBadgeDot: true,
                  ),
                  UIProBottomNavItem(icon: Icons.settings, label: "Settings"),
                ],
                currentIndex: _floatingIndex,
                onChanged: (index) => setState(() => _floatingIndex = index),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        _SectionTitle("Fluid Bottom Navigation"),
        const Text(
          "Wave animation effect",
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          clipBehavior: Clip.none,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 180,
                alignment: Alignment.center,
                child: Text(
                  "Page ${_fluidIndex + 1}",
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                child: UIProBottomNav.fluid(
                  animationFactor: 1.0,
                  backgroundColor: Colors.blueAccent,
                  selectedColor: Colors.white,
                  unselectedColor: Colors.black,
                  items: const [
                    UIProBottomNavItem(
                      icon: Icons.dashboard,
                      label: "Dashboard",
                    ),
                    UIProBottomNavItem(
                      icon: Icons.shopping_cart,
                      label: "Shop",
                    ),
                    UIProBottomNavItem(icon: Icons.chat, label: "Chat"),
                  ],
                  currentIndex: _fluidIndex,
                  onChanged: (index) => setState(() => _fluidIndex = index),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════
// LISTS PAGE
// ═══════════════════════════════════════════════════════════════════════

class ListsPage extends StatefulWidget {
  const ListsPage({super.key});

  @override
  State<ListsPage> createState() => _ListsPageState();
}

class _ListsPageState extends State<ListsPage> {
  bool _isLoading = false;
  final List<String> _items = List.generate(10, (index) => "Item ${index + 1}");

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SectionTitle("List with Shimmer Loading"),
              const SizedBox(height: 8),
              const Text(
                "Shows shimmer effect while loading",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ),
        Expanded(
          child: UIProListView(
            isLoading: _isLoading,
            itemCount: _items.length,

            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text('${index + 1}'),
                ),
                title: Text(_items[index]),
                subtitle: Text("Description for ${_items[index]}"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Tapped ${_items[index]}")),
                  );
                },
              );
            },
            emptyWidget: UIProEmptyState(
              icon: Icons.inbox_outlined,
              title: "No Items",
              description: "There are no items to display.",
              actionText: "Refresh",
              onAction: _loadData,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: UIProButton(
            text: "Reload Data",
            leading: const Icon(Icons.refresh, color: Colors.white, size: 18),
            onPressed: _loadData,
          ),
        ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════
// LOADING PAGE
// ═══════════════════════════════════════════════════════════════════════

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _SectionTitle("Shimmer Effects"),
        const SizedBox(height: 12),
        UIProShimmer.box(width: double.infinity, height: 100),
        const SizedBox(height: 12),
        Row(
          children: [
            UIProShimmer.box(width: 100, height: 100, borderRadius: 90),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                children: [
                  UIProShimmer.box(width: double.infinity, height: 20),
                  const SizedBox(height: 8),
                  UIProShimmer.box(width: double.infinity, height: 20),
                  const SizedBox(height: 8),
                  UIProShimmer.box(width: 150, height: 20),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        _SectionTitle("Shimmer List"),
        const SizedBox(height: 12),
        UIProShimmerList(
          itemCount: 3,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              children: [
                UIProShimmer.box(width: 60, height: 60, borderRadius: 90),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UIProShimmer.box(width: double.infinity, height: 16),
                      const SizedBox(height: 8),
                      UIProShimmer.box(width: 200, height: 14),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        _SectionTitle("Loading Animations"),
        const SizedBox(height: 12),
        _LoadingRow(
          "Wave Dots",
          UIProLoader.waveDots(color: Colors.black, size: 50),
        ),
        _LoadingRow(
          "Progressive Dots",
          UIProLoader.progressiveDots(color: Colors.black, size: 50),
        ),
        _LoadingRow(
          "Hexagon Dots",
          UIProLoader.hexagonDots(color: Colors.black, size: 50),
        ),
        _LoadingRow(
          "Flickr",
          UIProLoader.flickr(
            size: 50,
            leftDotColor: Colors.black,
            rightDotColor: Colors.blue,
          ),
        ),
        const SizedBox(height: 24),
        _SectionTitle("Custom Shimmer Colors"),
        const SizedBox(height: 12),
        UIProShimmer.box(
          width: double.infinity,
          height: 80,
          baseColor: Colors.blue[100]!,
          highlightColor: Colors.blue[50]!,
        ),
      ],
    );
  }
}

class _LoadingRow extends StatelessWidget {
  final String label;
  final Widget loader;

  const _LoadingRow(this.label, this.loader);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(width: 16),
          loader,
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════
// SWIPEABLE PAGE
// ═══════════════════════════════════════════════════════════════════════

class SwipeablePage extends StatefulWidget {
  const SwipeablePage({super.key});

  @override
  State<SwipeablePage> createState() => _SwipeablePageState();
}

class _SwipeablePageState extends State<SwipeablePage> {
  final List<String> _items = List.generate(
    10,
    (index) => "Swipeable Item ${index + 1}",
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SectionTitle("Swipeable Tiles"),
              const SizedBox(height: 8),
              const Text(
                "Swipe left to reveal actions",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ),
        Expanded(
          child: _items.isEmpty
              ? UIProEmptyState(
                  icon: Icons.delete_sweep,
                  title: "All Items Deleted",
                  description: "You've swiped away all items!",
                  actionText: "Reset List",
                  onAction: () {
                    setState(() {
                      _items.addAll(
                        List.generate(
                          10,
                          (index) => "Swipeable Item ${index + 1}",
                        ),
                      );
                    });
                  },
                )
              : ListView.builder(
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    return UIProSwipeableTile(
                      borderRadius: 50,
                      confirmSwipe: (direction) {
                        return showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Confirm Deletion"),
                              content: Text(
                                "Are you sure you want to delete ${_items[index]}?",
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(false),
                                  child: const Text("Cancel"),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(true),
                                  child: const Text("Delete"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      direction: SwipeDirection.startToEnd,
                      key: ValueKey(_items[index]),
                      color: Colors.white,
                      backgroundBuilder: (context, direction, progress) {
                        return Container(
                          color: Colors.green,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          child: const Icon(Icons.delete, color: Colors.white),
                        );
                      },
                      onSwiped: (direction) {
                        setState(() {
                          final item = _items[index];
                          _items.removeAt(index);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("$item deleted"),
                              action: SnackBarAction(
                                label: "Undo",
                                onPressed: () {
                                  setState(() {
                                    _items.insert(index, item);
                                  });
                                },
                              ),
                            ),
                          );
                        });
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Text('${index + 1}'),
                        ),
                        title: Text(_items[index]),
                        subtitle: const Text("Swipe left to delete"),
                        trailing: const Icon(Icons.arrow_back_ios, size: 16),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════
// HELPER WIDGETS
// ═══════════════════════════════════════════════════════════════════════

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }
}
