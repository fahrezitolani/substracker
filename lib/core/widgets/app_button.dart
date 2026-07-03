import 'package:flutter/material.dart';

import '../constants/app_sizes.dart';

enum AppButtonType { primary, secondary, text }

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final AppButtonType type;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.type = AppButtonType.primary,
  });

  const AppButton.secondary({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
  }) : type = AppButtonType.secondary;

  const AppButton.text({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
  }) : type = AppButtonType.text;

  @override
  Widget build(BuildContext context) {
    Widget content = isLoading
        ? const SizedBox(
            width: 22,
            height: 22,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
        : Text(label);

    switch (type) {
      case AppButtonType.secondary:
        return SizedBox(
          height: AppSizes.buttonHeight,
          width: double.infinity,
          child: OutlinedButton(
            onPressed: isLoading ? null : onPressed,
            child: content,
          ),
        );
      case AppButtonType.text:
        return TextButton(
          onPressed: isLoading ? null : onPressed,
          child: content,
        );
      case AppButtonType.primary:
        return SizedBox(
          height: AppSizes.buttonHeight,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: isLoading ? null : onPressed,
            child: content,
          ),
        );
    }
  }
}
