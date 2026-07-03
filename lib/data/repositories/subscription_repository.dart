import '../database/database_helper.dart';
import '../models/subscription_model.dart';

class SubscriptionRepository {
  final DatabaseHelper _databaseHelper;

  SubscriptionRepository({DatabaseHelper? databaseHelper})
      : _databaseHelper = databaseHelper ?? DatabaseHelper.instance;

  Future<List<SubscriptionModel>> getAllSubscriptions() async {
    return await _databaseHelper.readAllSubscriptions();
  }

  Future<SubscriptionModel> addSubscription(SubscriptionModel subscription) async {
    return await _databaseHelper.createSubscription(subscription);
  }

  Future<int> updateSubscription(SubscriptionModel subscription) async {
    return await _databaseHelper.updateSubscription(subscription);
  }

  Future<int> deleteSubscription(int id) async {
    return await _databaseHelper.deleteSubscription(id);
  }
}
