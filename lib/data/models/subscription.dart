import 'package:flutter/material.dart';

class Subscription {
  final String id;
  final String name;
  final double price;
  final String billingCycle;
  final DateTime nextPayment;
  final Color color;
  final IconData icon;
  final String category;
  final bool isActive;

  const Subscription({
    required this.id,
    required this.name,
    required this.price,
    required this.billingCycle,
    required this.nextPayment,
    required this.color,
    required this.icon,
    required this.category,
    this.isActive = true,
  });

  static List<Subscription> dummyData = [
    Subscription(
      id: '1',
      name: 'Netflix',
      price: 15.49,
      billingCycle: 'Monthly',
      nextPayment: DateTime.now().add(const Duration(days: 3)),
      color: const Color(0xFFE50914),
      icon: Icons.movie_outlined,
      category: 'Entertainment',
    ),
    Subscription(
      id: '2',
      name: 'Spotify',
      price: 9.99,
      billingCycle: 'Monthly',
      nextPayment: DateTime.now().add(const Duration(days: 7)),
      color: const Color(0xFF1DB954),
      icon: Icons.music_note_outlined,
      category: 'Music',
    ),
    Subscription(
      id: '3',
      name: 'ChatGPT Plus',
      price: 20.00,
      billingCycle: 'Monthly',
      nextPayment: DateTime.now().add(const Duration(days: 12)),
      color: const Color(0xFF10A37F),
      icon: Icons.smart_toy_outlined,
      category: 'Productivity',
    ),
    Subscription(
      id: '4',
      name: 'Canva',
      price: 12.99,
      billingCycle: 'Monthly',
      nextPayment: DateTime.now().add(const Duration(days: 18)),
      color: const Color(0xFF7B2FF7),
      icon: Icons.palette_outlined,
      category: 'Design',
    ),
    Subscription(
      id: '5',
      name: 'Google One',
      price: 2.99,
      billingCycle: 'Monthly',
      nextPayment: DateTime.now().add(const Duration(days: 22)),
      color: const Color(0xFF4285F4),
      icon: Icons.cloud_outlined,
      category: 'Cloud',
    ),
    Subscription(
      id: '6',
      name: 'YouTube Premium',
      price: 13.99,
      billingCycle: 'Monthly',
      nextPayment: DateTime.now().add(const Duration(days: 5)),
      color: const Color(0xFFFF0000),
      icon: Icons.play_circle_outline,
      category: 'Entertainment',
    ),
  ];

  static double get totalMonthly =>
      dummyData.where((s) => s.isActive).fold(0, (sum, s) => sum + s.price);

  static int get activeCount => dummyData.where((s) => s.isActive).length;

  static List<Subscription> get upcoming {
    final sorted = List<Subscription>.from(dummyData)
      ..sort((a, b) => a.nextPayment.compareTo(b.nextPayment));
    return sorted.take(3).toList();
  }

  String get daysUntilPayment {
    final days = nextPayment.difference(DateTime.now()).inDays;
    if (days == 0) return 'Today';
    if (days == 1) return 'Tomorrow';
    return 'In $days days';
  }

  String get formattedPrice => '\$${price.toStringAsFixed(2)}';

  String get nextPaymentFormatted {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return '${months[nextPayment.month - 1]} ${nextPayment.day}';
  }
}
