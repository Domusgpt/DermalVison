import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/body_zone_provider.dart';
import '../domain/body_zone.dart';

class BodyZoneSelector extends ConsumerWidget {
  const BodyZoneSelector({super.key, required this.onZoneSelected});

  final ValueChanged<BodyZone> onZoneSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final zones = ref.watch(bodyZonesProvider);

    return zones.when(
      data: (data) {
        if (data.isEmpty) {
          return Center(
            child: ElevatedButton(
              onPressed: () {
                // TODO: Add zone flow
              },
              child: const Text('Add your first monitoring zone'),
            ),
          );
        }
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final zone = data[index];
            return ListTile(
              title: Text(zone.customLabel ?? zone.bodyZone),
              subtitle: Text(zone.monitoringTargets.join(', ')),
              onTap: () => onZoneSelected(zone),
            );
          },
        );
      },
      error: (e, s) => Center(child: Text('Error: $e')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
