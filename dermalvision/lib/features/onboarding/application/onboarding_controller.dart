import 'package:dermalvision/features/onboarding/domain/onboarding_selections.dart';
import 'package:dermalvision/shared/models/user_profile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingState {
  const OnboardingState({
    this.skinType,
    this.goals = const {},
  });

  final SkinType? skinType;
  final Set<SkinGoal> goals;

  bool get canSubmit => skinType != null && goals.isNotEmpty;

  OnboardingState copyWith({
    SkinType? skinType,
    bool clearSkinType = false,
    Set<SkinGoal>? goals,
  }) {
    return OnboardingState(
      skinType: clearSkinType ? null : (skinType ?? this.skinType),
      goals: goals ?? this.goals,
    );
  }
}

class OnboardingController extends StateNotifier<OnboardingState> {
  OnboardingController() : super(const OnboardingState());

  void selectSkinType(SkinType value) {
    state = state.copyWith(skinType: value);
  }

  void toggleGoal(SkinGoal goal) {
    final nextGoals = Set<SkinGoal>.from(state.goals);
    if (nextGoals.contains(goal)) {
      nextGoals.remove(goal);
    } else {
      nextGoals.add(goal);
    }
    state = state.copyWith(goals: nextGoals);
  }

  UserProfile buildProfile() {
    final selectedType = state.skinType;
    if (selectedType == null || state.goals.isEmpty) {
      throw StateError('Onboarding is incomplete.');
    }
    return UserProfile(skinType: selectedType, goals: state.goals);
  }

  void reset() {
    state = const OnboardingState();
  }
}

final onboardingControllerProvider =
    StateNotifierProvider<OnboardingController, OnboardingState>(
  (ref) => OnboardingController(),
);

final userProfileProvider = StateProvider<UserProfile?>((ref) => null);
