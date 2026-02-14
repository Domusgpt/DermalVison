import 'package:dermalvision/features/auth/application/auth_controller.dart';
import 'package:dermalvision/features/auth/application/auth_service.dart';
import 'package:dermalvision/shared/models/user_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthController', () {
    test('starts anonymous with onboarding incomplete', () {
      const initial = UserState(
        authStatus: AuthStatus.anonymous,
        onboardingComplete: false,
      );
      final controller = AuthController(const LocalAuthService());

      expect(controller.state.authStatus, initial.authStatus);
      expect(controller.state.onboardingComplete, isFalse);
    });

    test('signInAnonymously sets authenticated state', () async {
      final controller = AuthController(const LocalAuthService());

      await controller.signInAnonymously();

      expect(controller.state.isAuthenticated, isTrue);
      expect(controller.state.onboardingComplete, isFalse);
    });

    test('signInWithEmail sets authenticated state', () async {
      final controller = AuthController(const LocalAuthService());

      await controller.signInWithEmail('user@example.com', 'password123');

      expect(controller.state.isAuthenticated, isTrue);
    });

    test('completeOnboarding toggles onboarding complete', () async {
      final controller = AuthController(const LocalAuthService());
      await controller.signInAnonymously();

      controller.completeOnboarding();

      expect(controller.state.onboardingComplete, isTrue);
    });
  });
}
