import 'package:flutter/material.dart';

class GuideOverlay extends StatelessWidget {
  const GuideOverlay({super.key, required this.readiness});

  final double readiness;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Center(
        child: Container(
          width: 260,
          height: 340,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.white70, width: 2),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: LinearProgressIndicator(
              value: readiness.clamp(0.0, 1.0),
              minHeight: 6,
              backgroundColor: Colors.white24,
              color: Colors.greenAccent,
            ),
          ),
        ),
      ),
    );
  }
}
