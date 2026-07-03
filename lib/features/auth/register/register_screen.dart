import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_text_field.dart';
import '../widgets/auth_footer.dart';
import '../widgets/auth_header.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirm = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleRegister() {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    // Simulate register delay, then navigate
    Future.delayed(const Duration(milliseconds: 800), () {
      if (!mounted) return;
      setState(() => _isLoading = false);
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.pagePadding,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 60),

                // Header
                const AuthHeader(
                  title: AppStrings.createAccount,
                  subtitle: AppStrings.getStarted,
                ),

                const SizedBox(height: 48),

                // Full Name
                AppTextField(
                  hint: AppStrings.fullName,
                  prefixIcon: Icons.person_outline,
                  controller: _nameController,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: AppSizes.md),

                // Email
                AppTextField(
                  hint: AppStrings.email,
                  prefixIcon: Icons.email_outlined,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: AppSizes.md),

                // Password
                AppTextField(
                  hint: AppStrings.password,
                  prefixIcon: Icons.lock_outline,
                  controller: _passwordController,
                  obscure: _obscurePassword,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() => _obscurePassword = !_obscurePassword);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: AppSizes.md),
                      child: Icon(
                        _obscurePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: AppSizes.iconSm,
                        color: AppColors.grey600,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: AppSizes.md),

                // Confirm Password
                AppTextField(
                  hint: AppStrings.confirmPassword,
                  prefixIcon: Icons.lock_outline,
                  controller: _confirmPasswordController,
                  obscure: _obscureConfirm,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() => _obscureConfirm = !_obscureConfirm);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: AppSizes.md),
                      child: Icon(
                        _obscureConfirm
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: AppSizes.iconSm,
                        color: AppColors.grey600,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: AppSizes.xl),

                // Sign Up Button
                AppButton(
                  label: AppStrings.signUp,
                  onPressed: _handleRegister,
                  isLoading: _isLoading,
                ),

                const SizedBox(height: AppSizes.xl),

                // Divider
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.md,
                      ),
                      child: Text(
                        AppStrings.orContinueWith,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),

                const SizedBox(height: AppSizes.lg),

                // Google Sign Up (placeholder)
                OutlinedButton.icon(
                  onPressed: () {
                    // TODO: Implement Google sign up
                  },
                  icon: const Icon(Icons.g_mobiledata, size: 28),
                  label: const Text('Google'),
                  style: OutlinedButton.styleFrom(
                    minimumSize:
                        const Size(double.infinity, AppSizes.buttonHeight),
                    side: const BorderSide(color: AppColors.border, width: 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(AppSizes.radiusMd),
                    ),
                  ),
                ),

                const SizedBox(height: AppSizes.xxl),

                // Footer
                AuthFooter(
                  message: AppStrings.alreadyHaveAccount,
                  actionText: AppStrings.signIn,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),

                const SizedBox(height: AppSizes.xl),
              ],
            ),
          ),
        ),
      ),
    );
  }
}