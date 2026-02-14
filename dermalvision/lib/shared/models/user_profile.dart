import 'package:dermalvision/features/onboarding/domain/onboarding_selections.dart';

class UserProfile {
  const UserProfile({
    required this.skinType,
    required this.goals,
  });

  final SkinType skinType;
  final Set<SkinGoal> goals;
}
