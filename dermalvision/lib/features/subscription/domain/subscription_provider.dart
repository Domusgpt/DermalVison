import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'subscription_provider.g.dart';

enum SubscriptionTier { free, plus, pro }

@riverpod
class Subscription extends _$Subscription {
  @override
  SubscriptionTier build() {
    return SubscriptionTier.free; // Default to free for now
  }

  // Placeholder for subscription logic
}
