import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/routes/app_routes.dart';
import '../subscriptions/list_subscription/list_subscription_screen.dart';
import 'views/dashboard_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _views = [
    const DashboardView(),
    const ListSubscriptionScreen(),
    const Center(child: Text('Calendar View')),
    const Center(child: Text('Settings View')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _views[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addSubscription);
        },
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.secondary,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        ),
        child: const Icon(Icons.add, size: 28),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: AppColors.border, width: 1),
          ),
        ),
        child: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: AppColors.primary.withValues(alpha: 0.1),
            labelTextStyle: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                );
              }
              return const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.textSecondary,
              );
            }),
            iconTheme: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return const IconThemeData(color: AppColors.primary);
              }
              return const IconThemeData(color: AppColors.textSecondary);
            }),
          ),
          child: NavigationBar(
            selectedIndex: _currentIndex,
            onDestinationSelected: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            backgroundColor: AppColors.background,
            elevation: 0,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home_rounded),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.format_list_bulleted_outlined),
                selectedIcon: Icon(Icons.format_list_bulleted_rounded),
                label: 'Subscriptions',
              ),
              NavigationDestination(
                icon: Icon(Icons.calendar_month_outlined),
                selectedIcon: Icon(Icons.calendar_month_rounded),
                label: 'Calendar',
              ),
              NavigationDestination(
                icon: Icon(Icons.settings_outlined),
                selectedIcon: Icon(Icons.settings_rounded),
                label: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}