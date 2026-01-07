import 'package:flutter/material.dart';
import 'package:ui_pro/ui_pro.dart';

/// Demonstrates UI Pro shimmer loading system with auto-shimmer
class ShimmerDemo extends StatefulWidget {
  const ShimmerDemo({super.key});

  @override
  State<ShimmerDemo> createState() => _ShimmerDemoState();
}

class _ShimmerDemoState extends State<ShimmerDemo> {
  bool _isLoading = true;

  // Sample data
  final List<Map<String, String>> _items = List.generate(
    10,
    (i) => {
      'name': 'User ${i + 1}',
      'email': 'user${i + 1}@example.com',
      'initials': 'U${i + 1}',
    },
  );

  @override
  Widget build(BuildContext context) {
    final theme = context.uiProTheme;

    return Column(
      children: [
        // Toggle
        Padding(
          padding: EdgeInsets.all(theme.spacingMD),
          child: Row(
            children: [
              Text(
                "Toggle Loading State",
                style: theme.textStyle(fontWeight: theme.fontWeightMedium),
              ),
              const Spacer(),
              Switch(
                value: _isLoading,
                onChanged: (value) => setState(() => _isLoading = value),
                activeColor: theme.primaryColor,
              ),
            ],
          ),
        ),
        // Info text
        Padding(
          padding: EdgeInsets.symmetric(horizontal: theme.spacingMD),
          child: Text(
            "Auto-shimmer: Define item structure once with UIProShimmerWrap, "
            "shimmer appears automatically when loading!",
            style: theme.textStyle(
              fontSize: theme.fontSizeSmall,
              color: theme.textSecondaryColor,
            ),
          ),
        ),
        SizedBox(height: theme.spacingSM),
        // List with auto-shimmer
        Expanded(
          child: UIProListView(
            // isLoading: _isLoading,
            isLoading: _isLoading, // Disable default loading
            itemCount: _items.length,
            shimmerItemCount: 8,
            useAutoShimmer: true, // Enable auto-shimmer!
            itemBuilder: (context, index) {
              final item = _isLoading ? null : _items[index];
              return ListTile(
                // Avatar with shimmer
                leading: UIProShimmerWrap.circle(
                  size: 48,
                  child: CircleAvatar(
                    backgroundColor: theme.primaryColor,
                    child: Text(
                      item?['initials'] ?? '',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                // Title with shimmer
                title: UIProShimmerWrap.text(
                  width: 100,
                  // height: theme.fontSizeBase,
                  child: Text(item?['name'] ?? ''),
                ),
                // Subtitle with shimmer
                subtitle: UIProShimmerWrap.text(
                  width: 180,
                  // height: theme.fontSizeSmall,
                  child: Text(item?['email'] ?? ''),
                ),
                // Trailing with shimmer
                // trailing: UIProShimmerWrap.box(
                //   width: 24,
                //   height: 24,
                //   child: const Icon(Icons.chevron_right),
                // ),
              );
            },
          ),
        ),
      ],
    );
  }
}
