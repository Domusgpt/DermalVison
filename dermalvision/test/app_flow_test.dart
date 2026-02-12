import 'package:dermalvision/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('login to onboarding to home and sign out flow works',
      (tester) async {
    await tester.pumpWidget(const ProviderScope(child: DermalVisionApp()));
    await tester.pumpAndSettle();

    expect(find.text('DermalVision Login'), findsOneWidget);
    await tester.tap(find.byKey(const Key('login_button')));
    await tester.pumpAndSettle();

    expect(find.text('Onboarding'), findsOneWidget);
    await tester.tap(find.byKey(const Key('finish_onboarding_button')));
    await tester.pumpAndSettle();

    expect(find.text('DermalVision Home'), findsOneWidget);
    await tester.tap(find.byKey(const Key('sign_out_button')));
    await tester.pumpAndSettle();

    expect(find.text('DermalVision Login'), findsOneWidget);
  });
}
