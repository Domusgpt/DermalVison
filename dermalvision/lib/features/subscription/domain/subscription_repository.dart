import 'package:purchases_flutter/purchases_flutter.dart';
import 'subscription_tier.dart';

abstract class SubscriptionRepository {
  Future<void> init(String apiKey);
  Future<SubscriptionTier> getCurrentTier();
  Future<List<Package>> getOfferings();
  Future<bool> purchasePackage(Package package);
  Future<void> restorePurchases();
}
