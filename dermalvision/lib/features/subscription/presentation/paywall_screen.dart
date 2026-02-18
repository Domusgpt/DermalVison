import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import '../domain/subscription_provider.dart';
import 'widgets/plan_card.dart';

class PaywallScreen extends ConsumerWidget {
  const PaywallScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.watch(subscriptionRepositoryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Upgrade to Pro')),
      body: FutureBuilder<List<Package>>(
        future: repo.getOfferings(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final packages = snapshot.data ?? [];
          if (packages.isEmpty) {
            return const Center(child: Text('No plans available'));
          }
          return ListView.builder(
            itemCount: packages.length,
            itemBuilder: (context, index) {
              return PlanCard(
                package: packages[index],
                onTap: () {
                  ref.read(subscriptionProvider.notifier).purchase(packages[index]);
                },
              );
            },
          );
        },
      ),
    );
  }
}
