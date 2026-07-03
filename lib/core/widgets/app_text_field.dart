import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';

class AppTextField extends StatelessWidget {
  final String hint;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool obscure;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const AppTextField({
    super.key,
    required this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.obscure = false,
    this.controller,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      keyboardType: keyboardType,
      validator: validator,
      style: Theme.of(context).textTheme.bodyLarge,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(left: AppSizes.md, right: AppSizes.sm),
                child: Icon(prefixIcon, size: AppSizes.iconSm, color: AppColors.grey600),
              )
            : null,
        prefixIconConstraints: prefixIcon != null
            ? const BoxConstraints(minWidth: 0, minHeight: 0)
            : null,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
