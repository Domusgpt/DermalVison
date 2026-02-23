import 'package:flutter/material.dart';
import '../../../../core/services/lighting_service.dart';

class LightingIndicator extends StatelessWidget {
  final LightingQuality quality;

  const LightingIndicator({super.key, required this.quality});

  @override
  Widget build(BuildContext context) {
    Color color;
    IconData icon;
    String text;

    switch (quality) {
      case LightingQuality.good:
        color = Colors.green;
        icon = Icons.wb_sunny;
        text = 'Good Lighting';
        break;
      case LightingQuality.poor:
        color = Colors.orange;
        icon = Icons.warning;
        text = 'Poor Lighting';
        break;
      case LightingQuality.tooDark:
        color = Colors.red;
        icon = Icons.brightness_3;
        text = 'Too Dark';
        break;
      case LightingQuality.glare:
        color = Colors.yellow;
        icon = Icons.wb_iridescent;
        text = 'Glare Detected';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 16),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }
}
