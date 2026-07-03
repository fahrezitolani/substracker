import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/providers/subscription_provider.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_card.dart';
import '../../../data/models/subscription_model.dart';

class DetailSubscriptionScreen extends StatefulWidget {
  final SubscriptionModel subscription;

  const DetailSubscriptionScreen({super.key, required this.subscription});

  @override
  State<DetailSubscriptionScreen> createState() => _DetailSubscriptionScreenState();
}

class _DetailSubscriptionScreenState extends State<DetailSubscriptionScreen> {
  late SubscriptionModel _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = widget.subscription;
  }

  void _confirmDelete() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.surface,
          title: const Text('Delete Subscription', style: TextStyle(color: AppColors.textPrimary)),
          content: Text(
            'Are you sure you want to delete ${_subscription.name}?',
            style: const TextStyle(color: AppColors.textSecondary),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel', style: TextStyle(color: AppColors.textSecondary)),
            ),
            TextButton(
              onPressed: () {
                if (_subscription.id != null) {
                  context.read<SubscriptionProvider>().deleteSubscription(_subscription.id!);
                }
                Navigator.pop(context); // Close dialog
                Navigator.pop(context); // Go back to list
              },
              child: const Text('Delete', style: TextStyle(color: Colors.redAccent)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Details', style: TextStyle(color: AppColors.textPrimary)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: AppColors.textPrimary),
            onPressed: () async {
              final updated = await Navigator.pushNamed(
                context,
                AppRoutes.editSubscription,
                arguments: _subscription,
              );
              if (updated != null && updated is SubscriptionModel) {
                setState(() {
                  _subscription = updated;
                });
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppCard(
              child: Column(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.border),
                    ),
                    child: const Icon(Icons.category, size: 32, color: AppColors.textPrimary),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _subscription.name,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$${_subscription.cost.toStringAsFixed(2)} / ${_subscription.billingCycle}',
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Information',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            AppCard(
              child: Column(
                children: [
                  _buildInfoRow('Category', _subscription.category),
                  const Divider(color: AppColors.border),
                  _buildInfoRow('Next Billing', _subscription.nextBillingDate.toLocal().toString().split(' ')[0]),
                  if (_subscription.paymentMethod != null && _subscription.paymentMethod!.isNotEmpty) ...[
                    const Divider(color: AppColors.border),
                    _buildInfoRow('Payment Method', _subscription.paymentMethod!),
                  ],
                  if (_subscription.notes != null && _subscription.notes!.isNotEmpty) ...[
                    const Divider(color: AppColors.border),
                    _buildInfoRow('Notes', _subscription.notes!),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 32),
            AppButton.secondary(
              label: 'Delete Subscription',
              onPressed: _confirmDelete,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: AppColors.textSecondary, fontSize: 14)),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(color: AppColors.textPrimary, fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
