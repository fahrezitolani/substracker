import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_text_field.dart';
import '../widgets/auth_footer.dart';
import '../widgets/auth_header.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    // Simulate login delay, then navigate
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
                  title: AppStrings.welcomeBack,
                  subtitle: AppStrings.signInToContinue,
                ),

                const SizedBox(height: 48),

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
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: AppSizes.sm),

                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // TODO: Implement forgot password
                    },
                    child: const Text(AppStrings.forgotPassword),
                  ),
                ),

                const SizedBox(height: AppSizes.lg),

                // Sign In Button
                AppButton(
                  label: AppStrings.signIn,
                  onPressed: _handleLogin,
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

                // Google Sign In (placeholder)
                OutlinedButton.icon(
                  onPressed: () {
                    // TODO: Implement Google sign in
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
                  message: AppStrings.dontHaveAccount,
                  actionText: AppStrings.createAccount,
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.register);
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