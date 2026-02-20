import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/subscription/domain/subscription_provider.dart';
import '../../features/subscription/domain/subscription_tier.dart';
import '../../features/subscription/presentation/paywall_screen.dart';

class SubscriptionGate extends ConsumerWidget {
  const SubscriptionGate(
      {super.key,
      required this.child,
      this.requiredTier = SubscriptionTier.plus});

  final Widget child;
  final SubscriptionTier requiredTier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subscriptionAsync = ref.watch(subscriptionProvider);

    return subscriptionAsync.when(
      data: (currentTier) {
        if (currentTier.index >= requiredTier.index) {
          return child;
        }
        return const PaywallScreen();
      },
      error: (e, s) => Center(child: Text('Error: $e')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
