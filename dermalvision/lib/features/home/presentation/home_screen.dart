import 'package:dermalvision/features/auth/application/auth_controller.dart';
import 'package:dermalvision/features/onboarding/application/onboarding_controller.dart';
import 'package:dermalvision/features/onboarding/domain/onboarding_selections.dart';
import 'package:dermalvision/shared/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(userProfileProvider);
    final subscription = ref.watch(subscriptionProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('DermalVision Home'),
            if (profile != null)
              Text(
                'Skin type: ${profile.skinType.label} • Goals: ${profile.goals.length}',
                key: const Key('profile_summary_text'),
              ),
            Text(
              subscription.isPremium ? 'Plan: Premium' : 'Plan: Free',
              key: const Key('subscription_summary_text'),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: [
                FilledButton(
                  key: const Key('open_camera_button'),
                  onPressed: () => context.go('/camera'),
                  child: const Text('Open Camera'),
                ),
                FilledButton.tonal(
                  key: const Key('open_analysis_button'),
                  onPressed: () => context.go('/analysis'),
                  child: const Text('Open Analysis'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              key: const Key('sign_out_button'),
              onPressed: () {
                ref.read(userProfileProvider.notifier).state = null;
                ref.read(onboardingControllerProvider.notifier).reset();
                ref.read(authControllerProvider.notifier).signOut();
              },
              child: const Text('Sign out'),
            ),
          ],
        ),
      ),
    );
  }
}
