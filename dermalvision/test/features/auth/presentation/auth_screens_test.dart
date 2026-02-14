import 'package:dermalvision/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('signup flow submits and redirects to onboarding',
      (tester) async {
    await tester.pumpWidget(const ProviderScope(child: DermalVisionApp()));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('open_signup_button')));
    await tester.pumpAndSettle();

    await tester.enterText(
      find.byKey(const Key('signup_email_field')),
      'tester@dermalvision.app',
    );
    await tester.enterText(
      find.byKey(const Key('signup_password_field')),
      'very-secure-password',
    );
    await tester.tap(find.byKey(const Key('signup_submit_button')));
    await tester.pumpAndSettle();

    expect(find.text('Onboarding'), findsOneWidget);
  });
}
