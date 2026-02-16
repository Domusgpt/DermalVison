import 'package:purchases_flutter/purchases_flutter.dart';
import '../domain/subscription_repository.dart';
import '../domain/subscription_tier.dart';

class RevenueCatRepository implements SubscriptionRepository {
  @override
  Future<void> init(String apiKey) async {
    await Purchases.setLogLevel(LogLevel.debug);
    PurchasesConfiguration configuration = PurchasesConfiguration(apiKey);
    await Purchases.configure(configuration);
  }

  @override
  Future<SubscriptionTier> getCurrentTier() async {
    try {
      final customerInfo = await Purchases.getCustomerInfo();
      if (customerInfo.entitlements.all['pro']?.isActive ?? false) {
        return SubscriptionTier.pro;
      }
      if (customerInfo.entitlements.all['plus']?.isActive ?? false) {
        return SubscriptionTier.plus;
      }
      return SubscriptionTier.free;
    } catch (e) {
      return SubscriptionTier.free;
    }
  }

  @override
  Future<List<Package>> getOfferings() async {
    try {
      final offerings = await Purchases.getOfferings();
      if (offerings.current != null) {
        return offerings.current!.availablePackages;
      }
    } catch (e) {
      // handle error
    }
    return [];
  }

  @override
  Future<bool> purchasePackage(Package package) async {
    try {
      await Purchases.purchasePackage(package);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> restorePurchases() async {
    await Purchases.restorePurchases();
  }
}
