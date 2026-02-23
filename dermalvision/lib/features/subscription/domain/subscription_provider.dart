import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import '../data/subscription_repository.dart';
import 'subscription_tier.dart';

part 'subscription_provider.g.dart';

@riverpod
SubscriptionRepository subscriptionRepository(SubscriptionRepositoryRef ref) {
  return SubscriptionRepository();
}

@riverpod
Stream<CustomerInfo> subscription(SubscriptionRef ref) {
  final repo = ref.watch(subscriptionRepositoryProvider);
  return repo.customerInfoStream;
}

@riverpod
Future<SubscriptionTier> currentTier(CurrentTierRef ref) async {
  final repo = ref.watch(subscriptionRepositoryProvider);
  return repo.getCurrentTier();
}
