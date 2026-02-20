import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SkinHeatmap extends StatelessWidget {
  const SkinHeatmap({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          errorWidget: (_, __, ___) => const Center(child: Icon(Icons.error)),
        ),
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
