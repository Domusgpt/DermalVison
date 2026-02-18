import 'package:flutter/material.dart';

class GhostImageOverlay extends StatelessWidget {
  const GhostImageOverlay({super.key, this.imageProvider, this.opacity = 0.2});

  final ImageProvider? imageProvider;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    if (imageProvider == null) return const SizedBox.shrink();

    return IgnorePointer(
      child: Opacity(
        opacity: opacity.clamp(0.0, 1.0),
        child: Image(
          image: imageProvider!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}
