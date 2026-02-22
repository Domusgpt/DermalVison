import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GhostImageOverlay extends StatelessWidget {
  const GhostImageOverlay({super.key, this.imageUrl, this.opacity = 0.3});

  final String? imageUrl;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) return const SizedBox.shrink();
    return IgnorePointer(
      child: Opacity(
        opacity: opacity,
        child: CachedNetworkImage(
          imageUrl: imageUrl!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          errorWidget: (_, __, ___) => const SizedBox.shrink(),
        ),
      ),
    );
  }
}
