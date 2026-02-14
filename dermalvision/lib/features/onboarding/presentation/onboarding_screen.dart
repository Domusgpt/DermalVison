import 'package:dermalvision/features/auth/application/auth_controller.dart';
import 'package:dermalvision/features/onboarding/application/onboarding_controller.dart';
import 'package:dermalvision/features/onboarding/domain/onboarding_selections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(onboardingControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Onboarding')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Select your skin type', style: TextStyle(fontSize: 18)),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: SkinType.values
                .map(
                  (type) => ChoiceChip(
                    key: Key('skin_type_${type.name}'),
                    label: Text(type.label),
                    selected: state.skinType == type,
                    onSelected: (_) => ref
                        .read(onboardingControllerProvider.notifier)
                        .selectSkinType(type),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 24),
          const Text('Choose your goals', style: TextStyle(fontSize: 18)),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: SkinGoal.values
                .map(
                  (goal) => FilterChip(
                    key: Key('skin_goal_${goal.name}'),
                    label: Text(goal.label),
                    selected: state.goals.contains(goal),
                    onSelected: (_) => ref
                        .read(onboardingControllerProvider.notifier)
                        .toggleGoal(goal),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 32),
          FilledButton(
            key: const Key('finish_onboarding_button'),
            onPressed: state.canSubmit
                ? () {
                    final profile = ref
                        .read(onboardingControllerProvider.notifier)
                        .buildProfile();
                    ref.read(userProfileProvider.notifier).state = profile;
                    ref
                        .read(authControllerProvider.notifier)
                        .completeOnboarding();
                  }
                : null,
            child: const Text('Finish setup'),
          ),
        ],
      ),
    );
  }
}
