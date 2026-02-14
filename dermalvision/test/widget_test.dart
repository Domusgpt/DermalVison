import 'package:dermalvision/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('app boots to login screen', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: DermalVisionApp()));
    await tester.pumpAndSettle();

    expect(find.text('DermalVision Login'), findsOneWidget);
  });
}
