import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../auth/domain/auth_provider.dart';
import '../../body_map/presentation/body_zone_selector.dart';
import '../../subscription/domain/subscription_provider.dart';
import '../../subscription/domain/subscription_tier.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subAsync = ref.watch(subscriptionProvider);
    final isFree = subAsync.value == SubscriptionTier.free;

    return Scaffold(
      appBar: AppBar(
        title: const Text('DermalVision'),
        actions: [
          if (isFree)
            TextButton(
              onPressed: () => context.push('/paywall'),
              child:
                  const Text('UPGRADE', style: TextStyle(color: Colors.amber)),
            ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              ref.read(authRepositoryProvider).signOut();
            },
          ),
        ],
      ),
      body: BodyZoneSelector(
        onZoneSelected: (zone) {
          context.push('/camera/${zone.id}');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/chat/default');
        },
        child: const Icon(Icons.chat),
      ),
    );
  }
}
