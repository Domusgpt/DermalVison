import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/body_zone_provider.dart';
import '../domain/body_zone.dart';
import '../../../../shared/widgets/depth_scroll_view.dart';
import '../../../../shared/widgets/shader_card.dart';

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
        return DepthScrollView(
          children: data.map((zone) {
            return GestureDetector(
              onTap: () => onZoneSelected(zone),
              child: ShaderCard(
                shaderAsset: 'lib/shared/shaders/iridescent.frag',
                child: Card(
                  child: Container(
                    height: 200,
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          zone.customLabel ?? zone.bodyZone,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 8),
                        Text(zone.monitoringTargets.join(', ')),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
      error: (e, s) => Center(child: Text('Error: $e')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
