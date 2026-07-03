class SubscriptionModel {
  final int? id;
  final String name;
  final double cost;
  final String billingCycle;
  final DateTime nextBillingDate;
  final String category;
  final String? icon;
  final String? paymentMethod;
  final String? notes;

  SubscriptionModel({
    this.id,
    required this.name,
    required this.cost,
    required this.billingCycle,
    required this.nextBillingDate,
    required this.category,
    this.icon,
    this.paymentMethod,
    this.notes,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'cost': cost,
      'billingCycle': billingCycle,
      'nextBillingDate': nextBillingDate.toIso8601String(),
      'category': category,
      'icon': icon,
      'paymentMethod': paymentMethod,
      'notes': notes,
    };
  }

  factory SubscriptionModel.fromMap(Map<String, dynamic> map) {
    return SubscriptionModel(
      id: map['id'] as int?,
      name: map['name'] as String,
      cost: (map['cost'] as num).toDouble(),
      billingCycle: map['billingCycle'] as String,
      nextBillingDate: DateTime.parse(map['nextBillingDate'] as String),
      category: map['category'] as String,
      icon: map['icon'] as String?,
      paymentMethod: map['paymentMethod'] as String?,
      notes: map['notes'] as String?,
    );
  }

  SubscriptionModel copyWith({
    int? id,
    String? name,
    double? cost,
    String? billingCycle,
    DateTime? nextBillingDate,
    String? category,
    String? icon,
    String? paymentMethod,
    String? notes,
  }) {
    return SubscriptionModel(
      id: id ?? this.id,
      name: name ?? this.name,
      cost: cost ?? this.cost,
      billingCycle: billingCycle ?? this.billingCycle,
      nextBillingDate: nextBillingDate ?? this.nextBillingDate,
      category: category ?? this.category,
      icon: icon ?? this.icon,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      notes: notes ?? this.notes,
    );
  }
}
