import 'package:dermalvision/features/onboarding/application/onboarding_controller.dart';
import 'package:dermalvision/features/onboarding/domain/onboarding_selections.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OnboardingController', () {
    test('starts incomplete', () {
      final controller = OnboardingController();

      expect(controller.state.canSubmit, isFalse);
      expect(controller.state.skinType, isNull);
      expect(controller.state.goals, isEmpty);
    });

    test('can submit when type and one goal selected', () {
      final controller = OnboardingController();

      controller.selectSkinType(SkinType.normal);
      controller.toggleGoal(SkinGoal.hydrationBoost);

      expect(controller.state.canSubmit, isTrue);
      final profile = controller.buildProfile();
      expect(profile.skinType, SkinType.normal);
      expect(profile.goals, contains(SkinGoal.hydrationBoost));
    });
  });
}
