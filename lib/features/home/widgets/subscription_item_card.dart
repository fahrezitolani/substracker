import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../data/models/subscription_model.dart';

class SubscriptionItemCard extends StatelessWidget {
  final SubscriptionModel subscription;

  const SubscriptionItemCard({
    super.key,
    required this.subscription,
  });

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.currency(symbol: '\$', decimalDigits: 2);
    final dateFormatter = DateFormat('MMM dd, yyyy');

    return Container(
      margin: const EdgeInsets.only(bottom: AppSizes.md),
      padding: const EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        border: Border.all(color: AppColors.border, width: 1),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Logo Placeholder
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: _getBrandColor(subscription.name).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppSizes.radiusSm),
            ),
            child: Center(
              child: Text(
                subscription.name.substring(0, 1).toUpperCase(),
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: _getBrandColor(subscription.name),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(width: AppSizes.md),
          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subscription.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Renews ${dateFormatter.format(subscription.nextBillingDate)}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          // Price
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                currencyFormatter.format(subscription.cost),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '/${_getBillingCycleShort(subscription.billingCycle)}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getBrandColor(String name) {
    final lowercaseName = name.toLowerCase();
    if (lowercaseName.contains('netflix')) return const Color(0xFFE50914);
    if (lowercaseName.contains('spotify')) return const Color(0xFF1DB954);
    if (lowercaseName.contains('chatgpt')) return const Color(0xFF10A37F);
    if (lowercaseName.contains('canva')) return const Color(0xFF00C4CC);
    if (lowercaseName.contains('google')) return const Color(0xFF4285F4);
    if (lowercaseName.contains('youtube')) return const Color(0xFFFF0000);
    if (lowercaseName.contains('disney')) return const Color(0xFF113CCF);
    if (lowercaseName.contains('adobe')) return const Color(0xFFFF0000);
    if (lowercaseName.contains('github')) return const Color(0xFF181717);
    if (lowercaseName.contains('notion')) return const Color(0xFF000000);
    return AppColors.primary;
  }

  String _getBillingCycleShort(String cycle) {
    final lowerCycle = cycle.toLowerCase();
    if (lowerCycle == 'monthly' || lowerCycle == 'month') return 'mo';
    if (lowerCycle == 'yearly' || lowerCycle == 'year') return 'yr';
    if (lowerCycle == 'weekly' || lowerCycle == 'week') return 'wk';
    return cycle;
  }
}
