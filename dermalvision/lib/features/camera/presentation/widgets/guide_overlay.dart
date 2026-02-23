import 'package:flutter/material.dart';

class GuideOverlay extends StatelessWidget {
  const GuideOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Center(
        child: Container(
          width: 250,
          height: 350,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green.withOpacity(0.5), width: 2),
            borderRadius: BorderRadius.circular(200), // Elliptical face shape
          ),
          child: Center(
            child: Icon(Icons.face, size: 48, color: Colors.white.withOpacity(0.3)),
          ),
        ),
      ),
    );
  }
}
