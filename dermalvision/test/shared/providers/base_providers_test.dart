import 'package:dermalvision/shared/models/subscription_state.dart';
import 'package:dermalvision/shared/providers/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('subscription defaults to active free tier', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final state = container.read(subscriptionProvider);
    expect(state.tier, SubscriptionTier.free);
    expect(state.active, isTrue);
    expect(state.isPremium, isFalse);
  });
}
