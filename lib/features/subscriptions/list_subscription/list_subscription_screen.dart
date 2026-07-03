import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/providers/subscription_provider.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/app_button.dart';

class ListSubscriptionScreen extends StatelessWidget {
  const ListSubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('My Subscriptions', style: TextStyle(color: AppColors.textPrimary)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      body: Consumer<SubscriptionProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.subscriptions.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.subscriptions_outlined, size: 64, color: AppColors.textSecondary),
                    const SizedBox(height: 16),
                    const Text('No subscriptions yet', style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
                    const SizedBox(height: 24),
                    AppButton(
                      label: 'Add First Subscription',
                      onPressed: () => Navigator.pushNamed(context, AppRoutes.addSubscription),
                    ),
                  ],
                ),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: provider.subscriptions.length,
            itemBuilder: (context, index) {
              final sub = provider.subscriptions[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context,
                    AppRoutes.detailSubscription,
                    arguments: sub,
                  ),
                  child: AppCard(
                    child: Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.border),
                          ),
                          child: Icon(_getIcon(sub.icon), color: AppColors.textPrimary),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(sub.name, style: const TextStyle(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 4),
                              Text(sub.category, style: const TextStyle(color: AppColors.textSecondary, fontSize: 14)),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('\$${sub.cost.toStringAsFixed(2)}', style: const TextStyle(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 4),
                            Text(sub.billingCycle, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  IconData _getIcon(String? iconString) {
    return Icons.category_outlined;
  }
}
