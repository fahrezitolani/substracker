import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/constants/app_strings.dart';
import '../../core/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeIn;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _navigateToLogin();
    });
  }

  Future<void> _navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    Navigator.of(context).pushReplacementNamed(AppRoutes.login);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _fadeIn,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  borderRadius: BorderRadius.circular(AppSizes.radiusXl),
                ),
                padding: const EdgeInsets.all(AppSizes.md),
                child: Image.asset(
                  'assets/logos/logo.png',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: AppSizes.lg),
              Text(
                AppStrings.appName,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: AppSizes.sm),
              Text(
                AppStrings.tagline,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}