import 'package:dermalvision/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('home redirects unauthenticated users to login', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: DermalVisionApp()));
    await tester.pumpAndSettle();

    expect(find.text('DermalVision Login'), findsOneWidget);
    expect(find.byType(FilledButton), findsOneWidget);
  });

  testWidgets('authenticated users land on onboarding before home',
      (tester) async {
    await tester.pumpWidget(const ProviderScope(child: DermalVisionApp()));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('login_button')));
    await tester.pumpAndSettle();

    expect(find.text('Onboarding'), findsOneWidget);
    expect(find.text('DermalVision Home'), findsNothing);
  });
}
