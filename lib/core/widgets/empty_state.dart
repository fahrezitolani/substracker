import 'package:flutter/material.dart';

import '../constants/app_sizes.dart';
import 'app_button.dart';

class EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final String? actionLabel;
  final VoidCallback? onActionPressed;

  const EmptyState({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.actionLabel,
    this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(AppSizes.xl),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 64,
            color: theme.colorScheme.secondary.withValues(alpha: 0.5),
          ),
          const SizedBox(height: AppSizes.md),
          Text(
            title,
            style: theme.textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          if (subtitle != null) ...[
            const SizedBox(height: AppSizes.sm),
            Text(
              subtitle!,
              style: theme.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
          if (actionLabel != null && onActionPressed != null) ...[
            const SizedBox(height: AppSizes.lg),
            AppButton(
              label: actionLabel!,
              onPressed: onActionPressed,
            ),
          ],
        ],
      ),
    );
  }
}
