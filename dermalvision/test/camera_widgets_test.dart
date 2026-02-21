import 'package:dermalvision/core/services/lighting_service.dart';
import 'package:dermalvision/features/camera/presentation/widgets/ghost_image_overlay.dart';
import 'package:dermalvision/features/camera/presentation/widgets/guide_overlay.dart';
import 'package:dermalvision/features/camera/presentation/widgets/lighting_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('GuideOverlay renders progress indicator', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: GuideOverlay(readiness: 0.5),
        ),
      ),
    );

    expect(find.byType(LinearProgressIndicator), findsOneWidget);
  });

  testWidgets('LightingIndicator renders label for quality', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: LightingIndicator(quality: LightingQuality.tooDark),
        ),
      ),
    );

    expect(find.text('Lighting: Too Dark'), findsOneWidget);
  });

  testWidgets('GhostImageOverlay hides when no image provider', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: GhostImageOverlay(),
        ),
      ),
    );

    expect(find.byType(Image), findsNothing);
  });
}
