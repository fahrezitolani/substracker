import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';

class MonthlySpendingCard extends StatelessWidget {
  final double amount;
  
  const MonthlySpendingCard({
    super.key,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.currency(symbol: '\$', decimalDigits: 2);
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSizes.xl),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.15),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total Monthly Spending',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.grey400,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: AppSizes.sm),
          Text(
            currencyFormatter.format(amount),
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: AppColors.secondary,
              fontSize: 36,
            ),
          ),
        ],
      ),
    );
  }
}
