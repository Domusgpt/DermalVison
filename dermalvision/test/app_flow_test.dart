import 'package:dermalvision/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('login to onboarding to modules to sign out flow works',
      (tester) async {
    await tester.pumpWidget(const ProviderScope(child: DermalVisionApp()));
    await tester.pumpAndSettle();

    expect(find.text('DermalVision Login'), findsOneWidget);
    await tester.tap(find.byKey(const Key('login_button')));
    await tester.pumpAndSettle();

    expect(find.text('Onboarding'), findsOneWidget);
    await tester.tap(find.byKey(const Key('skin_type_combination')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('skin_goal_textureRefinement')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('finish_onboarding_button')));
    await tester.pumpAndSettle();

    expect(find.text('DermalVision Home'), findsOneWidget);
    expect(find.byKey(const Key('profile_summary_text')), findsOneWidget);
    expect(find.byKey(const Key('subscription_summary_text')), findsOneWidget);

    await tester.tap(find.byKey(const Key('open_camera_button')));
    await tester.pumpAndSettle();
    expect(find.text('Camera Module Placeholder'), findsOneWidget);

    await tester.tap(find.byKey(const Key('back_home_from_camera_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('open_analysis_button')));
    await tester.pumpAndSettle();
    expect(find.text('Analysis Module Placeholder'), findsOneWidget);

    await tester.tap(find.byKey(const Key('back_home_from_analysis_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('sign_out_button')));
    await tester.pumpAndSettle();

    expect(find.text('DermalVision Login'), findsOneWidget);
  });
}
