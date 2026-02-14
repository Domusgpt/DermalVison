import 'package:dermalvision/features/auth/application/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('DermalVision Login')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FilledButton(
              key: const Key('login_button'),
              onPressed: () =>
                  ref.read(authControllerProvider.notifier).signInAnonymously(),
              child: const Text('Continue as guest'),
            ),
            const SizedBox(height: 12),
            TextButton(
              key: const Key('open_signup_button'),
              onPressed: () => context.go('/signup'),
              child: const Text('Create account'),
            ),
            TextButton(
              key: const Key('open_forgot_password_button'),
              onPressed: () => context.go('/forgot-password'),
              child: const Text('Forgot password'),
            ),
          ],
        ),
      ),
    );
  }
}
