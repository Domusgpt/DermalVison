import 'package:flutter/material.dart';
import '../../../../core/services/lighting_service.dart';

class LightingIndicator extends StatelessWidget {
  const LightingIndicator({super.key, required this.quality});

  final LightingQuality quality;

  @override
  Widget build(BuildContext context) {
    final (label, color) = switch (quality) {
      LightingQuality.good => ('Lighting: Good', Colors.greenAccent),
      LightingQuality.tooDark => ('Lighting: Too Dark', Colors.orangeAccent),
      LightingQuality.tooBright => ('Lighting: Too Bright', Colors.redAccent),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.wb_sunny, color: color, size: 16),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
