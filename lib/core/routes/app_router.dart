import 'package:flutter/material.dart';

import '../../features/auth/login/login_screen.dart';
import '../../features/auth/register/register_screen.dart';
import '../../features/home/home_screen.dart';
import '../../features/splash/splash_screen.dart';
import '../../features/subscriptions/list_subscription/list_subscription_screen.dart';
import '../../features/subscriptions/add_subscription/add_subscription_screen.dart';
import '../../features/subscriptions/edit_subscription/edit_subscription_screen.dart';
import '../../features/subscriptions/detail_subscription/detail_subscription_screen.dart';
import '../../data/models/subscription_model.dart';

import 'app_routes.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );

      case AppRoutes.register:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        );

      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      case AppRoutes.subscriptions:
        return MaterialPageRoute(
          builder: (_) => const ListSubscriptionScreen(),
        );

      case AppRoutes.addSubscription:
        return MaterialPageRoute(
          builder: (_) => const AddSubscriptionScreen(),
        );

      case AppRoutes.editSubscription:
        final subscription = settings.arguments as SubscriptionModel;
        return MaterialPageRoute(
          builder: (_) => EditSubscriptionScreen(subscription: subscription),
        );

      case AppRoutes.detailSubscription:
        final subscription = settings.arguments as SubscriptionModel;
        return MaterialPageRoute(
          builder: (_) => DetailSubscriptionScreen(subscription: subscription),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
    }
  }
}