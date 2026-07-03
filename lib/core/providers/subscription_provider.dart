import 'package:flutter/foundation.dart';
import '../../data/models/subscription_model.dart';
import '../../data/repositories/subscription_repository.dart';

class SubscriptionProvider with ChangeNotifier {
  final SubscriptionRepository _repository;
  
  List<SubscriptionModel> _subscriptions = [];
  bool _isLoading = false;

  SubscriptionProvider({SubscriptionRepository? repository})
      : _repository = repository ?? SubscriptionRepository();

  List<SubscriptionModel> get subscriptions => _subscriptions;
  bool get isLoading => _isLoading;

  double get totalMonthlyCost {
    double total = 0;
    for (var sub in _subscriptions) {
      if (sub.billingCycle.toLowerCase() == 'yearly') {
        total += sub.cost / 12;
      } else {
        total += sub.cost;
      }
    }
    return total;
  }

  Future<void> loadSubscriptions() async {
    _isLoading = true;
    notifyListeners();

    _subscriptions = await _repository.getAllSubscriptions();
    
    _isLoading = false;
    notifyListeners();
  }

  Future<void> addSubscription(SubscriptionModel subscription) async {
    final newSub = await _repository.addSubscription(subscription);
    _subscriptions.add(newSub);
    notifyListeners();
  }

  Future<void> updateSubscription(SubscriptionModel subscription) async {
    await _repository.updateSubscription(subscription);
    final index = _subscriptions.indexWhere((s) => s.id == subscription.id);
    if (index != -1) {
      _subscriptions[index] = subscription;
      notifyListeners();
    }
  }

  Future<void> deleteSubscription(int id) async {
    await _repository.deleteSubscription(id);
    _subscriptions.removeWhere((s) => s.id == id);
    notifyListeners();
  }
}

