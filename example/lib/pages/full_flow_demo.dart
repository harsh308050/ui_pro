import 'package:flutter/material.dart';
import 'package:ui_pro/ui_pro.dart';

/// A comprehensive demo showcasing all UI Pro widgets in a realistic flow.
///
/// This demonstrates:
/// - Login flow with text field validation
/// - Dashboard with shimmer loading
/// - Profile editing
/// - All button types
/// - Navigation patterns
class FullFlowDemo extends StatefulWidget {
  const FullFlowDemo({super.key});

  @override
  State<FullFlowDemo> createState() => _FullFlowDemoState();
}

class _FullFlowDemoState extends State<FullFlowDemo> {
  // Simulated authentication state
  bool _isLoggedIn = false;

  void _login() {
    setState(() => _isLoggedIn = true);
  }

  void _logout() {
    setState(() => _isLoggedIn = false);
  }

  @override
  Widget build(BuildContext context) {
    return _isLoggedIn
        ? _DashboardScreen(onLogout: _logout)
        : _LoginScreen(onLogin: _login);
  }
}

// ─────────────────────────────────────────────────────────────────────
// LOGIN SCREEN
// ─────────────────────────────────────────────────────────────────────

class _LoginScreen extends StatefulWidget {
  final VoidCallback onLogin;

  const _LoginScreen({required this.onLogin});

  @override
  State<_LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<_LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    // Trigger validation by updating state
    setState(() {});

    // Check if fields are valid
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      return;
    }

    // Email validation regex
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      return;
    }

    if (password.length < 6) {
      return;
    }

    setState(() => _isLoading = true);

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      setState(() => _isLoading = false);
      widget.onLogin();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiProTheme;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(theme.spacingLG),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: theme.spacingXL),

                // Logo/Header
                Center(
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: theme.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.rocket_launch,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: theme.spacingLG),

                // Title
                Center(
                  child: Text(
                    "Welcome Back",
                    style: theme.textStyle(
                      fontSize: 28,
                      fontWeight: theme.fontWeightBold,
                    ),
                  ),
                ),
                SizedBox(height: theme.spacingSM),
                Center(
                  child: Text(
                    "Sign in to continue",
                    style: theme.textStyle(color: theme.textSecondaryColor),
                  ),
                ),
                SizedBox(height: theme.spacingXL),

                // Email Field with validation
                UIProTextField.email(
                  controller: _emailController,
                  label: "Email Address",
                  hint: "Enter your email",
                  validateNotEmpty: true,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: theme.spacingMD),

                // Password Field with validation
                UIProTextField.password(
                  controller: _passwordController,
                  label: "Password",
                  hint: "Enter your password",
                  validateNotEmpty: true,
                  minPasswordLength: 6,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => _handleLogin(),
                ),
                SizedBox(height: theme.spacingSM),

                // Remember me & Forgot password row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Checkbox(
                            value: _rememberMe,
                            onChanged: (v) =>
                                setState(() => _rememberMe = v ?? false),
                            activeColor: theme.primaryColor,
                          ),
                        ),
                        SizedBox(width: theme.spacingSM),
                        Text(
                          "Remember me",
                          style: theme.textStyle(fontSize: theme.fontSizeSmall),
                        ),
                      ],
                    ),
                    UIProLoadingButton.text(
                      text: "Forgot Password?",
                      onPressed: () {
                        _showSnackBar(context, "Password reset link sent!");
                      },
                    ),
                  ],
                ),
                SizedBox(height: theme.spacingLG),

                // Login Button
                UIProLoadingButton(
                  text: "Sign In",
                  isLoading: _isLoading,
                  onPressed: _handleLogin,
                ),
                SizedBox(height: theme.spacingMD),

                // Divider
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: theme.spacingMD,
                      ),
                      child: Text(
                        "OR",
                        style: theme.textStyle(
                          color: theme.textSecondaryColor,
                          fontSize: theme.fontSizeSmall,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: theme.spacingMD),

                // Social login buttons
                UIProLoadingButton.outlined(
                  text: "Continue with Google",
                  leading: Icon(
                    Icons.g_mobiledata,
                    size: 24,
                    color: theme.textColor,
                  ),
                  onPressed: () {
                    _showSnackBar(context, "Google login pressed");
                  },
                ),
                SizedBox(height: theme.spacingSM),
                UIProLoadingButton.outlined(
                  text: "Continue with Apple",
                  leading: Icon(Icons.apple, size: 20, color: theme.textColor),
                  onPressed: () {
                    _showSnackBar(context, "Apple login pressed");
                  },
                ),
                SizedBox(height: theme.spacingXL),

                // Sign up link
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: theme.textStyle(color: theme.textSecondaryColor),
                      ),
                      UIProLoadingButton.text(
                        text: "Sign Up",
                        onPressed: () {
                          _showSnackBar(context, "Navigate to Sign Up");
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────
// DASHBOARD SCREEN
// ─────────────────────────────────────────────────────────────────────

class _DashboardScreen extends StatefulWidget {
  final VoidCallback onLogout;

  const _DashboardScreen({required this.onLogout});

  @override
  State<_DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<_DashboardScreen> {
  int _currentIndex = 0;
  bool _isLoading = true;

  // Sample data
  final List<Map<String, dynamic>> _activities = [
    {
      'icon': Icons.shopping_bag,
      'title': 'Order Placed',
      'subtitle': 'Order #12345 confirmed',
      'time': '2 min ago',
      'color': Colors.green,
    },
    {
      'icon': Icons.payment,
      'title': 'Payment Received',
      'subtitle': '\$249.99 via Apple Pay',
      'time': '1 hour ago',
      'color': Colors.blue,
    },
    {
      'icon': Icons.local_shipping,
      'title': 'Order Shipped',
      'subtitle': 'Tracking #ABC123456',
      'time': '3 hours ago',
      'color': Colors.orange,
    },
    {
      'icon': Icons.star,
      'title': 'Review Request',
      'subtitle': 'Rate your recent purchase',
      'time': 'Yesterday',
      'color': Colors.purple,
    },
    {
      'icon': Icons.card_giftcard,
      'title': 'Reward Earned',
      'subtitle': '+50 points added',
      'time': '2 days ago',
      'color': Colors.amber,
    },
  ];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiProTheme;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: UIProAppBar(
        title: _getTitle(),
        actions: [
          UIProAppBarAction(
            icon: Icons.notifications_outlined,
            onPressed: () => _showSnackBar(context, "Notifications"),
          ),
          UIProAppBarAction(
            icon: Icons.logout,
            onPressed: widget.onLogout,
            tooltip: "Logout",
          ),
        ],
      ),
      body: _buildBody(context),
      bottomNavigationBar: UIProBottomNav(
        items: const [
          UIProBottomNavItem(icon: Icons.home, label: "Home"),
          UIProBottomNavItem(icon: Icons.explore, label: "Explore"),
          UIProBottomNavItem(icon: Icons.person, label: "Profile"),
        ],
        currentIndex: _currentIndex,
        onChanged: (index) => setState(() => _currentIndex = index),
      ),
    );
  }

  String _getTitle() {
    switch (_currentIndex) {
      case 0:
        return "Dashboard";
      case 1:
        return "Explore";
      case 2:
        return "Profile";
      default:
        return "App";
    }
  }

  Widget _buildBody(BuildContext context) {
    switch (_currentIndex) {
      case 0:
        return _HomeTab(
          isLoading: _isLoading,
          activities: _activities,
          onRefresh: () async {
            setState(() => _isLoading = true);
            await _loadData();
          },
        );
      case 1:
        return const _ExploreTab();
      case 2:
        return _ProfileTab(onLogout: widget.onLogout);
      default:
        return const SizedBox.shrink();
    }
  }
}

// ─────────────────────────────────────────────────────────────────────
// HOME TAB
// ─────────────────────────────────────────────────────────────────────

class _HomeTab extends StatelessWidget {
  final bool isLoading;
  final List<Map<String, dynamic>> activities;
  final Future<void> Function() onRefresh;

  const _HomeTab({
    required this.isLoading,
    required this.activities,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiProTheme;

    return RefreshIndicator(
      onRefresh: onRefresh,
      color: theme.primaryColor,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome header
            Padding(
              padding: EdgeInsets.all(theme.spacingMD),
              child: UIProShimmerWrap.text(
                width: 200,
                child: Text(
                  "Hello, John! 👋",
                  style: theme.textStyle(
                    fontSize: 24,
                    fontWeight: theme.fontWeightBold,
                  ),
                ),
              ),
            ),

            // Stats cards
            Padding(
              padding: EdgeInsets.symmetric(horizontal: theme.spacingMD),
              child: UIProShimmerScope(
                isLoading: isLoading,
                child: Row(
                  children: [
                    Expanded(
                      child: _StatCard(
                        icon: Icons.shopping_bag,
                        title: "Orders",
                        value: "12",
                        color: theme.primaryColor,
                      ),
                    ),
                    SizedBox(width: theme.spacingSM),
                    Expanded(
                      child: _StatCard(
                        icon: Icons.star,
                        title: "Points",
                        value: "2,450",
                        color: Colors.amber,
                      ),
                    ),
                    SizedBox(width: theme.spacingSM),
                    Expanded(
                      child: _StatCard(
                        icon: Icons.favorite,
                        title: "Wishlist",
                        value: "8",
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: theme.spacingLG),

            // Recent Activity header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: theme.spacingMD),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent Activity",
                    style: theme.textStyle(
                      fontSize: theme.fontSizeLarge,
                      fontWeight: theme.fontWeightBold,
                    ),
                  ),
                  UIProLoadingButton.text(
                    text: "View All",
                    onPressed: () =>
                        _showSnackBar(context, "View all activities"),
                  ),
                ],
              ),
            ),
            SizedBox(height: theme.spacingSM),

            // Activity list with auto-shimmer
            UIProListView(
              isLoading: isLoading,
              itemCount: activities.length,
              shimmerItemCount: 5,
              useAutoShimmer: true,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: theme.spacingMD),
              itemBuilder: (context, index) {
                final activity = isLoading ? null : activities[index];
                return _ActivityItem(activity: activity);
              },
            ),

            // Empty state example
            if (!isLoading && activities.isEmpty)
              UIProEmptyState(
                icon: Icons.inbox_outlined,
                title: "No Activity",
                description: "Your recent activity will appear here",
                actionText: "Refresh",
                onAction: onRefresh,
              ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiProTheme;

    return UIProShimmerWrap.box(
      height: 100,
      borderRadius: theme.borderRadius,
      width: 100,
      child: Container(
        padding: EdgeInsets.all(theme.spacingSM),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(theme.borderRadius),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 28),
            SizedBox(height: theme.spacingXS),
            Text(
              value,
              style: theme.textStyle(
                fontSize: theme.fontSizeLarge,
                fontWeight: theme.fontWeightBold,
              ),
            ),
            Text(
              title,
              style: theme.textStyle(
                fontSize: theme.fontSizeSmall,
                color: theme.textSecondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActivityItem extends StatelessWidget {
  final Map<String, dynamic>? activity;

  const _ActivityItem({this.activity});

  @override
  Widget build(BuildContext context) {
    final theme = context.uiProTheme;

    return Padding(
      padding: EdgeInsets.only(bottom: theme.spacingSM),
      child: Row(
        children: [
          // Icon
          UIProShimmerWrap.circle(
            size: 48,
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: (activity?['color'] as Color? ?? theme.primaryColor)
                    .withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                activity?['icon'] as IconData? ?? Icons.circle,
                color: activity?['color'] as Color? ?? theme.primaryColor,
              ),
            ),
          ),
          SizedBox(width: theme.spacingSM),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIProShimmerWrap.text(
                  width: 120,
                  child: Text(
                    activity?['title'] ?? '',
                    style: theme.textStyle(fontWeight: theme.fontWeightMedium),
                  ),
                ),
                SizedBox(height: 4),
                UIProShimmerWrap.text(
                  width: 180,
                  child: Text(
                    activity?['subtitle'] ?? '',
                    style: theme.textStyle(
                      fontSize: theme.fontSizeSmall,
                      color: theme.textSecondaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Time
          UIProShimmerWrap.text(
            width: 60,
            child: Text(
              activity?['time'] ?? '',
              style: theme.textStyle(
                fontSize: theme.fontSizeSmall,
                color: theme.textSecondaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────
// EXPLORE TAB
// ─────────────────────────────────────────────────────────────────────

class _ExploreTab extends StatefulWidget {
  const _ExploreTab();

  @override
  State<_ExploreTab> createState() => _ExploreTabState();
}

class _ExploreTabState extends State<_ExploreTab> {
  final _searchController = TextEditingController();
  bool _isSearching = false;

  final List<Map<String, dynamic>> _categories = [
    {'icon': Icons.laptop, 'name': 'Electronics', 'count': 128},
    {'icon': Icons.checkroom, 'name': 'Fashion', 'count': 256},
    {'icon': Icons.home, 'name': 'Home', 'count': 89},
    {'icon': Icons.sports_basketball, 'name': 'Sports', 'count': 64},
    {'icon': Icons.book, 'name': 'Books', 'count': 312},
    {'icon': Icons.toys, 'name': 'Toys', 'count': 45},
  ];

  @override
  void dispose() {
    _searchController.dispose();
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
          // Search field
          UIProTextField(
            controller: _searchController,
            hint: "Search products...",
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
            onChanged: (value) {
              setState(() => _isSearching = value.isNotEmpty);
            },
          ),
          SizedBox(height: theme.spacingLG),

          // Categories header
          Text(
            "Categories",
            style: theme.textStyle(
              fontSize: theme.fontSizeLarge,
              fontWeight: theme.fontWeightBold,
            ),
          ),
          SizedBox(height: theme.spacingMD),

          // Categories grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: theme.spacingSM,
              mainAxisSpacing: theme.spacingSM,
              childAspectRatio: 1.5,
            ),
            itemCount: _categories.length,
            itemBuilder: (context, index) {
              final category = _categories[index];
              return _CategoryCard(
                icon: category['icon'] as IconData,
                name: category['name'] as String,
                count: category['count'] as int,
                onTap: () => _showSnackBar(context, "Open ${category['name']}"),
              );
            },
          ),
          SizedBox(height: theme.spacingLG),

          // Quick actions
          Text(
            "Quick Actions",
            style: theme.textStyle(
              fontSize: theme.fontSizeLarge,
              fontWeight: theme.fontWeightBold,
            ),
          ),
          SizedBox(height: theme.spacingMD),

          // Action buttons row
          Row(
            children: [
              Expanded(
                child: UIProLoadingButton(
                  text: "Scan QR",
                  leading: const Icon(
                    Icons.qr_code_scanner,
                    color: Colors.white,
                    size: 18,
                  ),
                  onPressed: () => _showSnackBar(context, "Open QR Scanner"),
                ),
              ),
              SizedBox(width: theme.spacingSM),
              Expanded(
                child: UIProLoadingButton.outlined(
                  text: "Favorites",
                  leading: Icon(
                    Icons.favorite_outline,
                    color: theme.primaryColor,
                    size: 18,
                  ),
                  onPressed: () => _showSnackBar(context, "Open Favorites"),
                ),
              ),
            ],
          ),
          SizedBox(height: theme.spacingSM),
          Row(
            children: [
              Expanded(
                child: UIProLoadingButton.outlined(
                  text: "Orders",
                  leading: Icon(
                    Icons.receipt_long,
                    color: theme.primaryColor,
                    size: 18,
                  ),
                  onPressed: () => _showSnackBar(context, "Open Orders"),
                ),
              ),
              SizedBox(width: theme.spacingSM),
              Expanded(
                child: UIProLoadingButton(
                  text: "Support",
                  leading: const Icon(
                    Icons.support_agent,
                    color: Colors.white,
                    size: 18,
                  ),
                  onPressed: () => _showSnackBar(context, "Open Support"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final IconData icon;
  final String name;
  final int count;
  final VoidCallback onTap;

  const _CategoryCard({
    required this.icon,
    required this.name,
    required this.count,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiProTheme;

    return Material(
      color: theme.surfaceColor,
      borderRadius: BorderRadius.circular(theme.borderRadius),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(theme.borderRadius),
        child: Container(
          padding: EdgeInsets.all(theme.spacingMD),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(theme.borderRadius),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: theme.primaryColor, size: 32),
              SizedBox(height: theme.spacingXS),
              Text(
                name,
                style: theme.textStyle(fontWeight: theme.fontWeightMedium),
              ),
              Text(
                "$count items",
                style: theme.textStyle(
                  fontSize: theme.fontSizeSmall,
                  color: theme.textSecondaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────
// PROFILE TAB
// ─────────────────────────────────────────────────────────────────────

class _ProfileTab extends StatefulWidget {
  final VoidCallback onLogout;

  const _ProfileTab({required this.onLogout});

  @override
  State<_ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<_ProfileTab> {
  bool _isEditing = false;
  bool _isSaving = false;

  final _nameController = TextEditingController(text: "John Doe");
  final _emailController = TextEditingController(text: "john.doe@example.com");
  final _phoneController = TextEditingController(text: "+1 234 567 8900");

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _saveProfile() async {
    setState(() => _isSaving = true);
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      setState(() {
        _isSaving = false;
        _isEditing = false;
      });
      _showSnackBar(context, "Profile saved successfully!");
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = context.uiProTheme;

    return SingleChildScrollView(
      padding: EdgeInsets.all(theme.spacingMD),
      child: Column(
        children: [
          // Profile header
          Center(
            child: Stack(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      "JD",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                if (_isEditing)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: theme.primaryColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: theme.backgroundColor,
                          width: 2,
                        ),
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: theme.spacingMD),

          // Name and email (non-editing state)
          if (!_isEditing) ...[
            Text(
              "John Doe",
              style: theme.textStyle(
                fontSize: 24,
                fontWeight: theme.fontWeightBold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "john.doe@example.com",
              style: theme.textStyle(color: theme.textSecondaryColor),
            ),
            SizedBox(height: theme.spacingMD),
            UIProLoadingButton.outlined(
              text: "Edit Profile",
              fullWidth: false,
              width: 150,
              leading: Icon(Icons.edit, size: 18, color: theme.primaryColor),
              onPressed: () => setState(() => _isEditing = true),
            ),
          ],
          SizedBox(height: theme.spacingLG),

          // Edit form
          if (_isEditing) ...[
            Form(
              key: _formKey,
              child: Column(
                children: [
                  UIProTextField(
                    controller: _nameController,
                    label: "Full Name",
                    prefixIcon: Icons.person_outline,
                    validateNotEmpty: true,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: theme.spacingMD),
                  UIProTextField.email(
                    controller: _emailController,
                    label: "Email",
                    validateNotEmpty: true,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: theme.spacingMD),
                  UIProTextField(
                    controller: _phoneController,
                    label: "Phone Number",
                    prefixIcon: Icons.phone_outlined,
                    keyboardType: TextInputType.phone,
                    validateNotEmpty: true,
                    textInputAction: TextInputAction.done,
                  ),
                ],
              ),
            ),

            SizedBox(height: theme.spacingLG),
            Row(
              children: [
                Expanded(
                  child: UIProLoadingButton.outlined(
                    text: "Cancel",
                    onPressed: () => setState(() => _isEditing = false),
                  ),
                ),
                SizedBox(width: theme.spacingSM),
                Expanded(
                  child: UIProLoadingButton(
                    text: "Save Changes",
                    isLoading: _isSaving,
                    onPressed: _saveProfile,
                  ),
                ),
              ],
            ),
            SizedBox(height: theme.spacingLG),
          ],

          // Settings section
          if (!_isEditing) ...[_buildSettingsSection(context)],
        ],
      ),
    );
  }

  Widget _buildSettingsSection(BuildContext context) {
    final theme = context.uiProTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Settings",
          style: theme.textStyle(
            fontSize: theme.fontSizeLarge,
            fontWeight: theme.fontWeightBold,
          ),
        ),
        SizedBox(height: theme.spacingMD),
        _SettingsItem(
          icon: Icons.notifications_outlined,
          title: "Notifications",
          onTap: () => _showSnackBar(context, "Open Notifications"),
        ),
        _SettingsItem(
          icon: Icons.lock_outline,
          title: "Privacy & Security",
          onTap: () => _showSnackBar(context, "Open Privacy"),
        ),
        _SettingsItem(
          icon: Icons.payment_outlined,
          title: "Payment Methods",
          onTap: () => _showSnackBar(context, "Open Payment"),
        ),
        _SettingsItem(
          icon: Icons.location_on_outlined,
          title: "Addresses",
          onTap: () => _showSnackBar(context, "Open Addresses"),
        ),
        _SettingsItem(
          icon: Icons.help_outline,
          title: "Help & Support",
          onTap: () => _showSnackBar(context, "Open Help"),
        ),
        SizedBox(height: theme.spacingLG),
        UIProLoadingButton(
          text: "Sign Out",
          backgroundColor: theme.errorColor,
          leading: const Icon(Icons.logout, color: Colors.white, size: 18),
          onPressed: widget.onLogout,
        ),
      ],
    );
  }
}

class _SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _SettingsItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiProTheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: theme.spacingSM),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: theme.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: theme.primaryColor, size: 20),
              ),
              SizedBox(width: theme.spacingMD),
              Expanded(
                child: Text(
                  title,
                  style: theme.textStyle(fontWeight: theme.fontWeightMedium),
                ),
              ),
              Icon(Icons.chevron_right, color: theme.textSecondaryColor),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────
// HELPER
// ─────────────────────────────────────────────────────────────────────

void _showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
    ),
  );
}
