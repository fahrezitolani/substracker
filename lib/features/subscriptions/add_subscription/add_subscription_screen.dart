import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/providers/subscription_provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../data/models/subscription_model.dart';

class AddSubscriptionScreen extends StatefulWidget {
  const AddSubscriptionScreen({super.key});

  @override
  State<AddSubscriptionScreen> createState() => _AddSubscriptionScreenState();
}

class _AddSubscriptionScreenState extends State<AddSubscriptionScreen> {
  final _formKey = GlobalKey<FormState>();
  
  final _nameController = TextEditingController();
  final _costController = TextEditingController();
  final _categoryController = TextEditingController();
  final _billingCycleController = TextEditingController(text: 'Monthly');
  final _paymentMethodController = TextEditingController();
  final _notesController = TextEditingController();
  
  DateTime _selectedDate = DateTime.now();

  @override
  void dispose() {
    _nameController.dispose();
    _costController.dispose();
    _categoryController.dispose();
    _billingCycleController.dispose();
    _paymentMethodController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: AppColors.background,
              onSurface: AppColors.textPrimary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      final newSub = SubscriptionModel(
        name: _nameController.text,
        cost: double.tryParse(_costController.text) ?? 0.0,
        billingCycle: _billingCycleController.text,
        nextBillingDate: _selectedDate,
        category: _categoryController.text.isNotEmpty ? _categoryController.text : 'General',
        paymentMethod: _paymentMethodController.text,
        notes: _notesController.text,
        icon: null,
      );

      context.read<SubscriptionProvider>().addSubscription(newSub);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Add Subscription', style: TextStyle(color: AppColors.textPrimary)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextField(
                hint: 'Service Name (e.g. Netflix)',
                controller: _nameController,
                prefixIcon: Icons.title,
                validator: (val) => val == null || val.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              AppTextField(
                hint: 'Monthly Price',
                controller: _costController,
                prefixIcon: Icons.attach_money,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                validator: (val) => val == null || val.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              AppTextField(
                hint: 'Category (e.g. Entertainment)',
                controller: _categoryController,
                prefixIcon: Icons.category,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                initialValue: _billingCycleController.text,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.autorenew, color: AppColors.textSecondary),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.border),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.border),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.primary),
                  ),
                ),
                dropdownColor: AppColors.surface,
                items: ['Weekly', 'Monthly', 'Yearly']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (val) {
                  if (val != null) _billingCycleController.text = val;
                },
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: AppTextField(
                    hint: 'Next Billing Date: ${_selectedDate.toLocal().toString().split(' ')[0]}',
                    prefixIcon: Icons.calendar_today,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              AppTextField(
                hint: 'Payment Method (e.g. Credit Card)',
                controller: _paymentMethodController,
                prefixIcon: Icons.payment,
              ),
              const SizedBox(height: 16),
              AppTextField(
                hint: 'Notes',
                controller: _notesController,
                prefixIcon: Icons.notes,
              ),
              const SizedBox(height: 32),
              AppButton(
                label: 'Save Subscription',
                onPressed: _save,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
