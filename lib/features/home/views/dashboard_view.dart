import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../data/models/subscription_model.dart';
import '../widgets/monthly_spending_card.dart';
import '../widgets/stat_card.dart';
import '../widgets/subscription_item_card.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    // Generate dummy data only for visual presentation as requested
    final dummySubscriptions = [
      SubscriptionModel(id: 1, name: 'Netflix', cost: 15.49, billingCycle: 'Monthly', nextBillingDate: DateTime.now().add(const Duration(days: 12)), category: 'Entertainment'),
      SubscriptionModel(id: 2, name: 'Spotify', cost: 10.99, billingCycle: 'Monthly', nextBillingDate: DateTime.now().add(const Duration(days: 3)), category: 'Music'),
      SubscriptionModel(id: 3, name: 'ChatGPT Plus', cost: 20.00, billingCycle: 'Monthly', nextBillingDate: DateTime.now().add(const Duration(days: 20)), category: 'Productivity'),
      SubscriptionModel(id: 4, name: 'Canva Pro', cost: 12.99, billingCycle: 'Monthly', nextBillingDate: DateTime.now().add(const Duration(days: 5)), category: 'Design'),
      SubscriptionModel(id: 5, name: 'Google One', cost: 2.99, billingCycle: 'Monthly', nextBillingDate: DateTime.now().add(const Duration(days: 18)), category: 'Storage'),
      SubscriptionModel(id: 6, name: 'YouTube Premium', cost: 13.99, billingCycle: 'Monthly', nextBillingDate: DateTime.now().add(const Duration(days: 8)), category: 'Entertainment'),
      SubscriptionModel(id: 7, name: 'Disney+', cost: 10.99, billingCycle: 'Monthly', nextBillingDate: DateTime.now().add(const Duration(days: 25)), category: 'Entertainment'),
      SubscriptionModel(id: 8, name: 'Adobe Creative Cloud', cost: 54.99, billingCycle: 'Monthly', nextBillingDate: DateTime.now().add(const Duration(days: 2)), category: 'Design'),
      SubscriptionModel(id: 9, name: 'GitHub Pro', cost: 4.00, billingCycle: 'Monthly', nextBillingDate: DateTime.now().add(const Duration(days: 15)), category: 'Development'),
      SubscriptionModel(id: 10, name: 'Notion', cost: 8.00, billingCycle: 'Monthly', nextBillingDate: DateTime.now().add(const Duration(days: 28)), category: 'Productivity'),
    ];

    double totalSpending = dummySubscriptions.fold(0, (sum, item) => sum + item.cost);

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg, vertical: AppSizes.md),
        children: [
          // Greeting Section
          const SizedBox(height: AppSizes.sm),
          Text(
            'Good Morning,',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'User Name',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: AppSizes.xl),

          // Monthly Spending Card
          MonthlySpendingCard(amount: totalSpending),
          const SizedBox(height: AppSizes.xl),

          // Statistics Row
          Row(
            children: [
              StatCard(
                title: 'Active Subscriptions',
                value: dummySubscriptions.length.toString(),
                color: AppColors.primary,
              ),
              const SizedBox(width: AppSizes.md),
              StatCard(
                title: 'Upcoming Payments',
                value: '4',
                color: AppColors.warning,
              ),
              const SizedBox(width: AppSizes.md),
              StatCard(
                title: 'Expired',
                value: '0',
                color: AppColors.error,
              ),
            ],
          ),
          const SizedBox(height: AppSizes.xl),

          // Recent Subscriptions
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Recent Subscriptions',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
          const SizedBox(height: AppSizes.md),
          
          ...dummySubscriptions.map((sub) => SubscriptionItemCard(subscription: sub)),
          const SizedBox(height: AppSizes.xxl), // padding for FAB
        ],
      ),
    );
  }
}
