import 'package:flutter/material.dart';

class SkinHeatmap extends StatelessWidget {
  const SkinHeatmap({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => const Center(child: Icon(Icons.error)),
        ),
        // Placeholder for heatmap overlay
        // In real implementation, this would be a CustomPaint or Shader
        Positioned.fill(
          child: Opacity(
            opacity: 0.2,
            child: Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  colors: [Colors.red, Colors.transparent],
                  center: Alignment.center,
                  radius: 0.8,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
