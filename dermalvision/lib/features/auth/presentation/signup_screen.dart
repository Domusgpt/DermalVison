import 'package:dermalvision/features/auth/application/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create account')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              key: const Key('signup_email_field'),
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextButton(
              key: const Key('signup_back_to_login_button'),
              onPressed: () => context.go('/login'),
              child: const Text('Back to login'),
            ),
            const SizedBox(height: 12),
            TextField(
              key: const Key('signup_password_field'),
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 20),
            FilledButton(
              key: const Key('signup_submit_button'),
              onPressed: () {
                ref.read(authControllerProvider.notifier).signInWithEmail(
                      _emailController.text,
                      _passwordController.text,
                    );
                context.go('/onboarding');
              },
              child: const Text('Create account'),
            ),
          ],
        ),
      ),
    );
  }
}
