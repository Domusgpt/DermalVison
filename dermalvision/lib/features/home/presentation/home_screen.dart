import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../auth/domain/auth_provider.dart';
import '../../body_map/presentation/body_zone_selector.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DermalVision'),
        actions: [
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
