import 'package:flutter/material.dart';

import '../constants/app_sizes.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;

  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    return Material(
      color: theme.colorScheme.surface,
      borderRadius: BorderRadius.circular(AppSizes.radiusLg),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: padding ?? const EdgeInsets.all(AppSizes.md),
          decoration: BoxDecoration(
            border: Border.all(
              color: theme.colorScheme.outline,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(AppSizes.radiusLg),
            boxShadow: [
              BoxShadow(
                color: isDark ? Colors.black26 : Colors.black.withValues(alpha: 0.04),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}
