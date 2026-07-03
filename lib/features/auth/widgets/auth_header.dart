import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool showLogo;

  const AuthHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.showLogo = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showLogo) ...[
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.accent,
              borderRadius: BorderRadius.circular(AppSizes.radiusLg),
            ),
            padding: const EdgeInsets.all(AppSizes.md),
            child: Image.asset(
              'assets/logos/logo.png',
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: AppSizes.lg),
        ],
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSizes.sm),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}