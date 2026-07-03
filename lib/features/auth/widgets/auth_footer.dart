import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class AuthFooter extends StatelessWidget {
  final String message;
  final String actionText;
  final VoidCallback onPressed;

  const AuthFooter({
    super.key,
    required this.message,
    required this.actionText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        GestureDetector(
          onTap: onPressed,
          child: Text(
            actionText,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ],
    );
  }
}
