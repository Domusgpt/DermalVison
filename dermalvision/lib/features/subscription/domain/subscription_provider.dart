import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'subscription_repository.dart';
import 'subscription_tier.dart';
import '../data/subscription_repository.dart';

part 'subscription_provider.g.dart';

@Riverpod(keepAlive: true)
SubscriptionRepository subscriptionRepository(SubscriptionRepositoryRef ref) {
  return RevenueCatRepository();
}

@riverpod
class Subscription extends _$Subscription {
  @override
  FutureOr<SubscriptionTier> build() async {
    final repo = ref.watch(subscriptionRepositoryProvider);
    // In a real app, init is called at startup with env var
    return await repo.getCurrentTier();
  }

  Future<void> purchase(Package package) async {
    final repo = ref.read(subscriptionRepositoryProvider);
    final success = await repo.purchasePackage(package);
    if (success) {
      ref.invalidateSelf();
    }
  }

  Future<void> restore() async {
    final repo = ref.read(subscriptionRepositoryProvider);
    await repo.restorePurchases();
    ref.invalidateSelf();
  }
}
