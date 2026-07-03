import 'package:flutter/material.dart';

import '../constants/app_sizes.dart';

class AppBottomNavigationBarItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;

  const AppBottomNavigationBarItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });
}

class AppBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<AppBottomNavigationBarItem> items;

  const AppBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(
          top: BorderSide(
            color: theme.colorScheme.outline,
            width: 1,
          ),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.md,
            vertical: AppSizes.sm,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(items.length, (index) {
              final item = items[index];
              final isSelected = index == currentIndex;
              
              return InkWell(
                onTap: () => onTap(index),
                borderRadius: BorderRadius.circular(AppSizes.radiusLg),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.lg,
                    vertical: AppSizes.sm,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected 
                        ? theme.colorScheme.primary.withValues(alpha: 0.1)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(AppSizes.radiusLg),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        isSelected ? item.activeIcon : item.icon,
                        color: isSelected 
                            ? theme.colorScheme.primary
                            : theme.colorScheme.secondary,
                      ),
                      if (isSelected) ...[
                        const SizedBox(width: AppSizes.sm),
                        Text(
                          item.label,
                          style: theme.textTheme.labelLarge?.copyWith(
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
